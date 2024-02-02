<?php
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

if(isset($_GET['category'])) {
    $category_name = $_GET['category'];

    // SQL-Abfrage, um die Informationen zur ausgewählten Kategorie abzurufen
    $sql = "SELECT * FROM categories WHERE category_name = :category_name";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':category_name', $category_name);
    $stmt->execute();
    $category = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$category) {
        // Die Kategorie wurde nicht gefunden, zeige eine Fehlermeldung oder leite um
        header("Location: error_page.php");
        exit();
    }
} else {
    // Keine Kategorie angegeben, zeige eine Fehlermeldung oder leite um
    header("Location: error_page.php");
    exit();
}

// Verarbeite das Formular, wenn es gesendet wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $new_category_name = $_POST['new_category_name'];
    $new_cata_loc = $_POST['new_cata_loc']; // Hinzugefügt: cata_loc-Wert aus dem Formular

    // Hier kannst du die Logik für die Bildbearbeitung hinzufügen (Upload, Speichern des Pfads, etc.)
    if ($_FILES['new_category_image']['error'] == 0) {
        // Überprüfe, ob ein Bild hochgeladen wurde
        $image_tmp = $_FILES['new_category_image']['tmp_name'];
        $image_name = $_FILES['new_category_image']['name'];
        $upload_path = "uploads/"; // Hier musst du den Pfad anpassen, in dem du die Bilder speichern möchtest
        $new_image_path = $upload_path . $image_name;

        // Verschiebe das hochgeladene Bild in den Zielordner
        move_uploaded_file($image_tmp, $new_image_path);

        // Hier kannst du weitere Logik hinzufügen, z.B. das alte Bild löschen

        // SQL-Abfrage, um die Kategorie zu aktualisieren
        $update_sql = "UPDATE categories SET category_name = :new_category_name, category_image = :new_image_path, cata_loc = :new_cata_loc WHERE category_name = :category_name";
        $update_stmt = $pdo->prepare($update_sql);
        $update_stmt->bindValue(':new_category_name', $new_category_name);
        $update_stmt->bindValue(':new_image_path', $new_image_path);
        $update_stmt->bindValue(':new_cata_loc', $new_cata_loc);
        $update_stmt->bindValue(':category_name', $category_name);
        $update_stmt->execute();
    } else {
        // Falls kein neues Bild hochgeladen wurde, nur den Kategorienamen und cata_loc aktualisieren
        $update_sql = "UPDATE categories SET category_name = :new_category_name, cata_loc = :new_cata_loc WHERE category_name = :category_name";
        $update_stmt = $pdo->prepare($update_sql);
        $update_stmt->bindValue(':new_category_name', $new_category_name);
        $update_stmt->bindValue(':new_cata_loc', $new_cata_loc);
        $update_stmt->bindValue(':category_name', $category_name);
        $update_stmt->execute();
    }

    // Du kannst eine Erfolgsmeldung anzeigen oder zur Kategorieliste umleiten
    header("Location: all_categories.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Kategorie bearbeiten</title>
    <style>
     
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Kategorie bearbeiten</h4>
                </div>
                <div class="card-body">
                    <form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="new_category_name">Neuer Kategoriename:</label>
                            <input type="text" class="form-control" id="new_category_name" name="new_category_name" value="<?php echo $category['category_name']; ?>" required>
                        </div>


                        <div class="form-group">
    <label for="new_cata_loc">Neuer cata_loc-Wert:</label>
    <input type="text" class="form-control" id="new_cata_loc" name="new_cata_loc" value="<?php echo isset($category['cata_loc']) ? $category['cata_loc'] : ''; ?>" required>
</div>



                        <div class="form-group">
                            <label for="new_category_image">Neues Kategoriebild hochladen:</label>
                            <input type="file" class="form-control-file" id="new_category_image" name="new_category_image">
                        </div>

                        <button type="submit" class="btn btn-primary">Speichern</button>
                        <a href="all_categories.php" class="btn btn-secondary">Abbrechen</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JavaScript-Dateien einbinden (falls benötigt) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>