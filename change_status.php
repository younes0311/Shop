<?php
include_once "db_connection.php";
include('admin_check.php');
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['product_id']) && isset($_GET['status'])) {
    $product_id = $_GET['product_id']; // Anpassung hier, um die richtige Variable zu verwenden
    $status = $_GET['status'];

    $stmt = $pdo->prepare("UPDATE products_details SET status = :status WHERE product_id = :product_id");
    $stmt->bindParam(':status', $status);
    $stmt->bindParam(':product_id', $product_id);

    if ($stmt->execute()) {
        header("Location: products_mng.php");
        exit();
    } else {
        echo "Fehler beim Aktualisieren des Status.";
    }
} else {
    echo "Ungültige Anfrage.";
}
?>
