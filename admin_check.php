
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
if ($user['is_admin'] != 1) {
    // Keine Administratorrechte, daher wird der Benutzer zur konto.php Seite weitergeleitet
    header("Location: profile.php");
    exit();
}
?>