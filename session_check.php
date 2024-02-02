<?php
// Starte die Sitzung


// Überprüfen, ob die Sitzung abgelaufen ist
if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > 28800)) {
    // Sitzung ist abgelaufen
    session_unset();
    session_destroy();
    header("Location: login.php"); // Optional: Umleitung auf die Anmeldeseite
    exit();
}

// Aktualisiere die letzte Aktivitätszeit
$_SESSION['last_activity'] = time();
?>