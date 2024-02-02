<?php
session_start();

// Lösche die Session in der Datenbank
if (isset($_SESSION['user_id'])) {
    require_once "db_connection.php";
    
    $userId = $_SESSION['user_id'];
    
    $stmt = $pdo->prepare("DELETE FROM user_sessions WHERE user_id = ?");
    $stmt->execute([$userId]);
}

// Zerstöre alle Session-Variablen
session_unset();

// Lösche das Session-Cookie
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time()-86400, '/');
}

// Zerstöre die Session
session_destroy();

// Weiterleitung zur Login-Seite
header("Location: login.php");
exit();
?>