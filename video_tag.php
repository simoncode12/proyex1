<?php
/**
 * Video Tag - Untuk menayangkan iklan video di pemutar video publisher
 * Versi 2.1 (2025-09-14)
 */

header('Access-Control-Allow-Origin: *');
header('Content-type: application/xml; charset=utf-8');

// Pengaturan error & header
ini_set('display_errors', 0);
ini_set('log_errors', 1);
error_reporting(E_ALL);

define('TAG_DEBUG_MODE', false);

// 1. Validasi input dasar dari publisher
$tagid = filter_input(INPUT_GET, 'tagid', FILTER_UNSAFE_RAW);
$api_key = filter_input(INPUT_GET, 'apikey', FILTER_UNSAFE_RAW);

if (!$tagid || !$api_key) {
    http_response_code(400);
    echo '<?xml version="1.0" encoding="UTF-8"?><VAST version="3.0"></VAST>';
    exit;
}

try {
    // Muat fungsi-fungsi yang dibutuhkan
    require_once __DIR__ . '/../vendor/autoload.php';
    require_once __DIR__ . '/../includes/functions.php';

    if (!isset($pdo) || !$pdo) {
        throw new Exception("Koneksi database tidak tersedia");
    }

    // 2. Buat Bid Request JSON internal
    $visitor_ip = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';
    $user_agent = $_SERVER['HTTP_USER_AGENT'] ?? '';
    $referer = $_SERVER['HTTP_REFERER'] ?? '';

    // Generate unique tracking hash untuk video ini
    $tracking_data = bin2hex(random_bytes(16));

    $bid_request_body = [
        'id' => 'vast-tag-req-' . uniqid(),
        'imp' => [
            [
                'id' => 'imp-1',
                'tagid' => $tagid,
                'video' => [
                    'mimes' => ["video/mp4", "application/javascript"],
                    'minduration' => 5,
                    'maxduration' => 60,
                    'protocols' => [2, 3, 5, 6],
                    'w' => 1920,
                    'h' => 1080,
                    'linearity' => 1,
                    'skip' => 1
                ]
            ]
        ],
        'site' => [
            'page' => $referer,
            'domain' => parse_url($referer, PHP_URL_HOST)
        ],
        'device' => [
            'ip' => $visitor_ip,
            'ua' => $user_agent
        ]
    ];

    // 3. Panggil rtb_endpoint.php secara internal menggunakan cURL
    $domains = get_domain_config($pdo);
    $rtb_endpoint_url = "{$domains['rtb']}/delivery/rtb_endpoint.php?apikey={$api_key}";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $rtb_endpoint_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($bid_request_body));
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
    curl_setopt($ch, CURLOPT_TIMEOUT, 2);
    $response_json = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($http_code !== 200 || !$response_json) {
        throw new Exception("RTB endpoint returned HTTP $http_code or empty response");
    }

    $bid_response = json_decode($response_json, true);
    
    if (TAG_DEBUG_MODE) {
        error_log("Video Tag Response: " . json_encode($bid_response));
    }

    // 4. Proses respons dari endpoint
    if (!isset($bid_response['seatbid'][0]['bid'][0]['adm'])) {
        throw new Exception("No valid bid found in RTB response");
    }
    
    $vast_xml = $bid_response['seatbid'][0]['bid'][0]['adm'];
    $campaign_id = $bid_response['seatbid'][0]['bid'][0]['cid'] ?? null;

    // 5. Simpan informasi tracking di tabel impressions
    if ($campaign_id) {
        try {
            // Ambil zone info
            $stmt_zone = $pdo->prepare("SELECT site_id, publisher_id FROM zones WHERE tagid = ?");
            $stmt_zone->execute([$tagid]);
            $zone_info = $stmt_zone->fetch(PDO::FETCH_ASSOC);
            
            if ($zone_info) {
                $site_id = $zone_info['site_id'];
                $publisher_id = $zone_info['publisher_id'];
                
                // Periksa apakah zone_id sudah ada
                $stmt_zone_id = $pdo->prepare("SELECT id FROM zones WHERE tagid = ? LIMIT 1");
                $stmt_zone_id->execute([$tagid]);
                $zone_id = $stmt_zone_id->fetchColumn();
                
                if (!$zone_id) {
                    // Jika tidak ditemukan, buat zone baru
                    $stmt_create = $pdo->prepare(
                        "INSERT INTO zones (site_id, tagid, name, ad_format_id, format, is_active) 
                         VALUES (?, ?, ?, 17, 'video', 1)"
                    );
                    $stmt_create->execute([$site_id, $tagid, 'Video Zone ' . $tagid]);
                    $zone_id = $pdo->lastInsertId();
                }
                
                // Simpan data tracking di tabel impressions
                $stmt_tracking = $pdo->prepare(
                    "INSERT INTO impressions (campaign_id, site_id, publisher_id, advertiser_id, ad_format, cost, earning, country_code, device_type, os, browser, quality_score, impression_time, ip_address, user_agent) 
                     VALUES (?, ?, ?, ?, 'video', 0, 0, 'XX', 'unknown', 'unknown', 'unknown', 100, NOW(), ?, ?)"
                );
                $stmt_tracking->execute([$campaign_id, $site_id, $publisher_id, 0, $visitor_ip, $user_agent]);
            }
        } catch (PDOException $e) {
            if (TAG_DEBUG_MODE) {
                error_log("Failed to save tracking data: " . $e->getMessage());
            }
        }
    }

    // 6. Tampilkan VAST asli
    echo $vast_xml;
    
} catch (Exception $e) {
    if (TAG_DEBUG_MODE) {
        error_log("VAST Tag Generation Error for TagID {$tagid}: " . $e->getMessage());
    }
    echo '<?xml version="1.0" encoding="UTF-8"?><VAST version="3.0"></VAST>';
    exit;
}
?>