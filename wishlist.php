<?php
session_start();

include_once "db_connection.php";

try {
    $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;
    if (!$user_id) {
        // Benutzer ist nicht angemeldet, leite zur Login-Seite weiter oder handle es entsprechend
        header("Location: login.php");
        exit();
    }

    $stmt_get_wishlist = $pdo->prepare("SELECT * FROM wishlist WHERE user_id = :user_id");
    $stmt_get_wishlist->bindParam(':user_id', $user_id);
    $stmt_get_wishlist->execute();
    $wishlist_items = $stmt_get_wishlist->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Fehler beim Abrufen der Wunschliste: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Füge deinen spezifischen CSS-Stil für die Wunschliste hinzu */
    </style>
    <title>dein_titel - Wunschliste</title>
</head>
<body>
    <?php include('header.php'); ?>

    <div class="container">
        <?php if (!empty($wishlist_items)): ?>
            <h2>Wunschliste</h2>
            <ul>
                <?php foreach ($wishlist_items as $item): ?>
                    <li>
                        <?php echo "Produkt: " . htmlspecialchars($item['product_name']); ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>Die Wunschliste ist leer.</p>
        <?php endif; ?>
    </div>

     <?php include('footer.php');?>
</body>
</html>