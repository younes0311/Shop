<?php
include_once "db_connection.php";
include('admin_check.php');
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];

    // Hier könnte zusätzliche Logik hinzugefügt werden, z.B. Überprüfung von Berechtigungen

    // Löschen der verknüpften Datensätze in der Tabelle products_images
    $stmtImages = $pdo->prepare("DELETE FROM products_images WHERE product_id = :product_id");
    $stmtImages->bindParam(':product_id', $product_id);
    $stmtImages->execute();

    // Löschen des Produkts aus der Tabelle products_details
    $stmtDetails = $pdo->prepare("DELETE FROM products_details WHERE product_id = :product_id");
    $stmtDetails->bindParam(':product_id', $product_id);

    if ($stmtDetails->execute()) {
        // Erfolgreich gelöscht, weiterleiten oder andere Aktion
        header("Location: erfolg_delete.php");
        exit();
    } else {
        echo "Fehler beim Löschen des Produkts.";
    }
} else {
    echo "Ungültige Anfrage.";
}
?>
<?php
session_start();

// Überprüfen, ob der Benutzer eingeloggt ist
if (!isset($_SESSION["user_id"])) {
    // Nicht eingeloggte Benutzer werden zur Login-Seite weitergeleitet
    header("Location: login.php");
    exit();
}

include('db_connection.php');

// Benutzerinformationen aus der Datenbank abrufen
$userID = $_SESSION["user_id"];
$sql = "SELECT * FROM users_details WHERE user_id = :userID";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':userID', $userID);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Überprüfen, ob der Benutzer ein Administrator ist
if (!isset($user['is_admin']) || $user['is_admin'] != 1) {
    // Benutzer hat keine Administratorrechte, weiterleiten zu profile.php
    header("Location: profile.php");
    exit();
}

?>