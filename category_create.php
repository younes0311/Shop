<?php
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

$error_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['new_category'])) {
    $new_category = $_POST['new_category'];
    $cata_loc = $_POST['cata_loc']; // Hinzugefügter Teil für cata_loc

    // Überprüfen, ob die Kategorie bereits existiert
    $check_stmt = $pdo->prepare("SELECT * FROM categories WHERE category_name = :category");
    $check_stmt->bindParam(':category', $new_category);
    $check_stmt->execute();

    if ($check_stmt->rowCount() > 0) {
        $error_message = "Die Kategorie existiert bereits.";
    } else {
        // Füge die neue Kategorie hinzu
        $insert_stmt = $pdo->prepare("INSERT INTO categories (category_name, cata_loc) VALUES (:category, :cata_loc)");
        $insert_stmt->bindParam(':category', $new_category);
        $insert_stmt->bindParam(':cata_loc', $cata_loc);

        if ($insert_stmt->execute()) {
            header("Location: cate_erfolg.php");
            exit();
        } else {
            $error_message = "Fehler beim Hinzufügen der Kategorie.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="category_creat.css">
    <title>Neue Kategorie erstellen</title>
</head>
<body>

<div class='container'>
    <h2>Neue Kategorie erstellen</h2>

    <?php if (!empty($error_message)): ?>
        <p class="error-message"><?php echo $error_message; ?></p>
    <?php endif; ?>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="category-form">
        <label for="new_category" class="form-label">Neue Kategorie hinzufügen:</label>
        <input type="text" name="new_category" class="form-input" required>

        <!-- Hinzugefügtes Feld für cata_loc -->
        <label for="cata_loc" class="form-label">cata_loc:</label>
        <input type="text" name="cata_loc" class="form-input" required>

        <button type="submit" class="form-button">Kategorie hinzufügen</button>
    </form>
</div>

</body>
</html>