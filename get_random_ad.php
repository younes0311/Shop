<?php
require_once "db_connection.php";

// Funktion zum Abrufen einer zufälligen Anzeige für einen bestimmten Standort
function getRandomAd() {
    global $pdo;
    $currentDate = date('Y-m-d');

    $stmt = $pdo->prepare("SELECT ad_id, ad_title, ad_description, ad_image, ad_link, location FROM Ads WHERE start_date <= :currentDate AND end_date >= :currentDate ORDER BY RAND() LIMIT 1");
    $stmt->bindParam(':currentDate', $currentDate);
    $stmt->execute();

    return $stmt->fetch(PDO::FETCH_ASSOC);
}

// Rufe die Funktion auf und gib die Ergebnisse im JSON-Format zurück
echo json_encode(getRandomAd());
?>