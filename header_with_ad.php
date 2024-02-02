<?php
// Funktion zum Abrufen einer zufälligen Anzeige für einen bestimmten Standort
function getRandomAdByLocation($location) {
    global $pdo;
    $currentDate = date('Y-m-d');

    $stmt = $pdo->prepare("SELECT * FROM Ads WHERE location = :location AND start_date <= :currentDate AND end_date >= :currentDate ORDER BY RAND() LIMIT 1");
    $stmt->bindParam(':location', $location);
    $stmt->bindParam(':currentDate', $currentDate);
    $stmt->execute();

    return $stmt->fetch(PDO::FETCH_ASSOC);
}

// Beispielaufruf für den Header
$headerAd = getRandomAdByLocation(1); // Annahme: Location 1 für den Header
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Weitere Header-Elemente hier -->
</head>

<body>

    <!-- Anzeige über dem Header -->
    <div class="container">
        <div class="banner">
            <?php if (!empty($headerAd['ad_image'])): ?>
                <a href="<?php echo $headerAd['ad_link']; ?>">
                    <img src="<?php echo $headerAd['ad_image']; ?>" alt="Header Ad">
                </a>
            <?php endif; ?>
        </div>
    </div>