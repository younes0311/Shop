<?php
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

if (isset($_GET['category'])) {
    $category_name = $_GET['category'];

    // Produkte für die angegebene Kategorie abrufen
    $stmt = $pdo->prepare("SELECT * FROM products_details WHERE category = :category");
    $stmt->bindParam(':category', $category_name);
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Anzahl der Produkte zählen
    $product_count = count($products);
} else {
    // Fallback: Wenn keine Kategorie angegeben ist, zurückspringen
    header("Location: all_categories.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="category_products.css">
    <title>Produkte in <?php echo $category_name; ?></title>
</head>
<body>

<div class='container'>
    <h2>Produkte in <?php echo $category_name; ?></h2>

    <?php if (!empty($products)): ?>
        <p>Anzahl der Produkte: <?php echo $product_count; ?></p>
    <?php endif; ?>

    <?php if (empty($products)): ?>
        <p>Es gibt keine Produkte in dieser Kategorie.</p>
    <?php else: ?>
        <table>
            <thead>
                <tr>
                    <th>Produkt Bild</th>
                    <th>Produkt Name</th>
                    <th>Preis</th>
                    <th>Unternehmen</th>
                    <th>CPI</th>
                    <th>Menge</th>
                    <th>Status</th>
                    <th>Erstellt am</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $product): ?>
                    <tr>
                        <td><img src="<?php echo $product['first_picture']; ?>" alt="Produktbild" width="50"></td>
                        <td><?php echo $product['product_name']; ?></td>
                        <td><?php echo $product['unser_preis']; ?></td>
                        <td><?php echo $product['company']; ?></td>
                        <td><?php echo $product['cpi']; ?></td>
                        <td><?php echo $product['quantity']; ?></td>
                        <td><?php echo $product['status']; ?></td>
                        <td><?php echo $product['created_at']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>

</body>
</html>