<?php
include("session_check.php");
include("admin_header.php");
require_once "db_connection.php";

try {
    // Nur die gewünschten Spalten auswählen und Anzeigen abrufen
    $stmt = $pdo->prepare("SELECT ad_id, ad_title, ad_description, ad_image, ad_link, location FROM Ads");
    $stmt->execute();

    // Fetch Anzeigen, falls die Abfrage erfolgreich war
    $ads = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Fehler: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    <title>Anzeigen verwalten</title>
</head>

<body>

    <div class="container">
        <!-- Anzeigen anzeigen als Tabelle -->
        <h2>Anzeigen verwalten</h2>
        <a href="add_ad.php" class="btn btn-success mb-3">Werbung hinzufügen</a>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titel</th>
                    <th>Beschreibung</th>
                    <th>Bild</th>
                    <th>Link</th>
                    <th>Location</th>
                    <th>Aktionen</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($ads as $ad): ?>
                    <tr>
                        <td><?php echo $ad['ad_id']; ?></td>
                        <td><?php echo $ad['ad_title']; ?></td>
                        <td><?php echo $ad['ad_description']; ?></td>
                        <td>
                            <?php if (!empty($ad['ad_image'])): ?>
                                <img src="<?php echo $ad['ad_image']; ?>" alt="Bild" style="max-width: 100px; max-height: 100px;">
                            <?php endif; ?>
                        </td>
                        <td><?php echo $ad['ad_link']; ?></td>
                        <td><?php echo $ad['location']; ?></td>
                       <td>
    <a href="edit_ad.php?ad_id=<?php echo $ad['ad_id']; ?>" class="btn btn-primary">Bearbeiten</a>
    <!-- Weitere Aktionen hier, z.B. Löschen -->
</td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- Weitere Inhalte hier -->

</body>

</html>