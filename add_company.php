<?php
include_once "db_connection.php";
include('admin_check.php');
include('admin_header.php');
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['lieferant_name'])) {
    $lieferant_name = $_POST['lieferant_name'];

    // Überprüfen, ob der Lieferant bereits existiert
    $check_stmt = $pdo->prepare("SELECT * FROM lieferanten WHERE lieferant_name = :lieferant_name");
    $check_stmt->bindParam(':lieferant_name', $lieferant_name);
    $check_stmt->execute();

    if ($check_stmt->rowCount() > 0) {
        $error_message = "Der Lieferant existiert bereits.";
    } else {
        // Füge den neuen Lieferanten hinzu
        $insert_stmt = $pdo->prepare("INSERT INTO lieferanten (lieferant_name) VALUES (:lieferant_name)");
        $insert_stmt->bindParam(':lieferant_name', $lieferant_name);

        if ($insert_stmt->execute()) {
            header("Location: erfolg_company.php");
            exit();
        } else {
            $error_message = "Fehler beim Hinzufügen des Lieferanten.";
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
    <link rel="stylesheet" href="add_company.css"> <!-- Füge hier deine eigene CSS-Datei hinzu -->
    <title>Lieferant hinzufügen</title>
</head>
<body>

<div class='container'>
    <h2>Lieferant hinzufügen</h2>

    <?php if (!empty($error_message)): ?>
        <p class="error-message"><?php echo $error_message; ?></p>
    <?php endif; ?>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="company-form">
        <label for="lieferant_name" class="form-label">Lieferant hinzufügen:</label>
        <input type="text" name="lieferant_name" class="form-input" required>

        <button type="submit" class="form-button">Lieferant hinzufügen</button>
    </form>
</div>

</body>
</html>