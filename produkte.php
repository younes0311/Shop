<?php
include_once "db_connection.php";
include("admin_header.php");

// Überprüfen, ob ein Lieferant ausgewählt wurde
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['selected_company'])) {
    $selected_company = $_POST['selected_company'];

    // SQL-Abfrage, um Produkte des ausgewählten Lieferanten zu holen
    $products_query = "SELECT * FROM products_details WHERE company = :selected_company";
    $products_stmt = $pdo->prepare($products_query);
    $products_stmt->bindParam(':selected_company', $selected_company);
    $products_stmt->execute();
    $products = $products_stmt->fetchAll(PDO::FETCH_ASSOC);

    // Zählen der Anzahl der Produkte
    $product_count = count($products);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="produkte.css"> <!-- Füge hier deine eigene CSS-Datei hinzu -->
    <title>Produkte</title>
</head>
<body>

<div class='container'>
    <h2>Produkte des Lieferanten <?php echo $selected_company; ?></h2>

    <?php if (isset($products) && !empty($products)): ?>
        <p>Anzahl der Produkte: <?php echo $product_count; ?></p>

        <table class="produkte-table">
            <thead>
            <tr>
                <th>Bild</th>
                <th>Produktname</th>
                <th>Preis</th>
                <th>Menge</th>
                <th>Typennummer</th>
                <th>Status</th>
                <th>CPI-Code</th>
                <th>Kategorie</th>
                <!-- Weitere Spalten je nach Bedarf -->
            </tr>
            </thead>
            <tbody>
            <?php foreach ($products as $product): ?>
                <tr>
                    <td>
                        <?php if (!empty($product['first_picture'])): ?>
                            <img src="<?php echo $product['first_picture']; ?>" alt="Produktbild" style="max-width: 100px;">
                        <?php else: ?>
                            <p>Kein Bild verfügbar</p>
                        <?php endif; ?>
                    </td>
                    <td><?php echo $product['product_name']; ?></td>
                    <td><?php echo $product['price']; ?></td>
                    <td><?php echo $product['quantity']; ?></td>
                    <td><?php echo $product['type_number']; ?></td>
                    <td><?php echo $product['status']; ?></td>
                    <td><?php echo $product['cpi']; ?></td>
                    <td><?php echo $product['category']; ?></td>
                    <!-- Weitere Spalten je nach Bedarf -->
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>Keine Produkte für den ausgewählten Lieferanten vorhanden.</p>
    <?php endif; ?>
</div>

</body>
</html>