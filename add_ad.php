<?php
include("session_check.php");
include("admin_header.php");
require_once "db_connection.php";

// Überprüfen, ob das Formular abgesendet wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Daten aus dem Formular erhalten
    $adTitle = $_POST["ad_title"];
    $adDescription = $_POST["ad_description"];
    $adLink = $_POST["ad_link"];
    $adLocation = $_POST["ad_location"]; // Standort der Anzeige
    $startDate = $_POST["start_date"];
    $endDate = $_POST["end_date"];

    // Verzeichnis für Uploads
    $uploadDirectory = "uploads/";

    // Dateiinformationen erhalten
    $fileName = basename($_FILES["ad_image"]["name"]);
    $targetFilePath = $uploadDirectory . $fileName;
    $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

    // Überprüfen, ob die Datei ein Bild ist
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    if (in_array($fileType, $allowTypes)) {
        // Versuche, die Datei hochzuladen
        if (move_uploaded_file($_FILES["ad_image"]["tmp_name"], $targetFilePath)) {
            try {
                // SQL-Statement zum Einfügen der Anzeige in die Datenbank
                $stmt = $pdo->prepare("INSERT INTO Ads (ad_title, ad_description, ad_image, ad_link, location, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
                $stmt->execute([$adTitle, $adDescription, $targetFilePath, $adLink, $adLocation, $startDate, $endDate]);

                // Erfolgreich eingefügt, Weiterleitung oder Erfolgsmeldung
                header("Location: ads_mng.php"); // Du kannst zu einer anderen Seite weiterleiten
                exit();
            } catch (PDOException $e) {
                echo "Fehler: " . $e->getMessage();
            }
        } else {
            echo "Fehler beim Hochladen der Datei.";
        }
    } else {
        echo "Nur JPG, JPEG, PNG und GIF-Dateien sind erlaubt.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
            margin-bottom: 50px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>

<body>
    <?php include('header_with_ad.php'); ?>
    <div class="container">
        <h2 class="mb-4">Werbung hinzufügen</h2>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
            <div class="form-group">
                <label for="ad_title">Titel:</label>
                <input type="text" class="form-control" id="ad_title" name="ad_title" required>
            </div>
            <div class="form-group">
                <label for="ad_description">Beschreibung:</label>
                <textarea class="form-control" id="ad_description" name="ad_description" required></textarea>
            </div>
            <div class="form-group">
                <label for="ad_image">Bild hochladen:</label>
                <input type="file" class="form-control" id="ad_image" name="ad_image" accept="image/*" required>
            </div>
            <div class="form-group">
                <label for="ad_link">Link:</label>
                <input type="text" class="form-control" id="ad_link" name="ad_link" required>
            </div>
            <div class="form-group">
                <label for="ad_location">Standort:</label>
                <input type="text" class="form-control" id="ad_location" name="ad_location" required>
            </div>
            <div class="form-group">
                <label for="start_date">Startdatum:</label>
                <input type="date" class="form-control" id="start_date" name="start_date" required>
            </div>
            <div class="form-group">
                <label for="end_date">Enddatum:</label>
                <input type="date" class="form-control" id="end_date" name="end_date" required>
            </div>
            <button type="submit" class="btn btn-primary">Werbung hinzufügen</button>
        </form>
    </div>

    <!-- Weitere Inhalte hier -->

</body>

</html>