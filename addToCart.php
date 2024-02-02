<?php
session_start();
require_once "db_connection.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_to_cart'])) {
    if (!isset($_SESSION['user'])) {
        $response = array('status' => 'error', 'message' => 'Bitte melden Sie sich an, um Produkte zum Warenkorb hinzuzufügen.');
        echo json_encode($response);
        exit();
    }

    try {
        // Überprüfen, ob erforderliche POST-Daten vorhanden sind
        if (isset($_POST['product_id'], $_POST['product_name'], $_POST['quantity'], $_POST['price'], $_POST['first_picture'])) {
            $productId = $_POST['product_id'];
            $productName = htmlspecialchars($_POST['product_name']);
            $quantity = $_POST['quantity'];
            $price = $_POST['price'];
            $firstPicture = htmlspecialchars($_POST['first_picture']);

            // Füge das Produkt in die Datenbanktabelle shop_cart ein
            $userId = $_SESSION['user']['user_id']; // Achte darauf, dass die Session-Variable korrekt ist
            $stmt = $pdo->prepare("INSERT INTO shop_cart (user_id, product_id, product_name, quantity, price, first_picture) VALUES (:user_id, :product_id, :product_name, :quantity, :price, :first_picture)");
            $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
            $stmt->bindParam(':product_id', $productId, PDO::PARAM_INT);
            $stmt->bindParam(':product_name', $productName, PDO::PARAM_STR);
            $stmt->bindParam(':quantity', $quantity, PDO::PARAM_INT);
            $stmt->bindParam(':price', $price, PDO::PARAM_STR);
            $stmt->bindParam(':first_picture', $firstPicture, PDO::PARAM_STR);
            $stmt->execute();

            $response = array('status' => 'success', 'message' => 'Produkt wurde zum Warenkorb hinzugefügt.');
            echo json_encode($response);
        } else {
            $response = array('status' => 'error', 'message' => 'Ungültige POST-Daten.');
            echo json_encode($response);
        }
    } catch (PDOException $e) {
        $response = array('status' => 'error', 'message' => 'Fehler beim Hinzufügen zum Warenkorb: ' . $e->getMessage());
        echo json_encode($response);
    }
} else {
    $response = array('status' => 'error', 'message' => 'Ungültige Anfrage.');
    echo json_encode($response);
}
?>