<?php
session_start();
include('db_connection.php');
include('session_check.php');
// Überprüfen, ob der Warenkorb in der Session existiert
if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    // Der Warenkorb existiert, zeige die Produkte an
    include("header.php"); // Füge den Header ein
    echo '<link rel="stylesheet" type="text/css" href="cart.css">'; // Verbinde die CSS-Datei
    echo '<div class="container">';
    echo '<h2>Warenkorb</h2>';
    echo '<table>';
    echo '<tr><th>Bild</th><th>Produkt</th><th>Menge</th><th>Preis</th></tr>';

    foreach ($_SESSION['cart'] as $product) {
        echo '<tr>';
        echo '<td><img src="' . $product['first_picture'] . '" alt="Produktbild"></td>';
        echo '<td>' . $product['name'] . '</td>';
        echo '<td>' . $product['quantity'] . '</td>';
        echo '<td>' . $product['price'] . '</td>';
        echo '</tr>';
    }

    echo '</table>';
    echo '</div>';
} else {
    // Der Warenkorb ist leer
    include("header.php"); // Füge den Header ein
    echo '<link rel="stylesheet" type="text/css" href="cart.css">'; // Verbinde die CSS-Datei
    echo '<div class="container">';
    echo '<h2>Warenkorb ist leer</h2>';
    echo '</div>';
}

// Du kannst hier auch eine Schaltfläche zum Zurückkehren zum Shop oder zum Checkout hinzufügen.
?>
  <?php include('footer.php');?>