<?php
include("db_connection.php");

// Überprüfen, ob der Benutzer angemeldet ist
include("session_check.php");

// Überprüfen, ob die category_id im GET-Parameter vorhanden ist
if (isset($_GET['category_id'])) {
    $category_id = $_GET['category_id'];

    // SQL-Abfrage vorbereiten und ausführen, um den Kategorienamen zu erhalten
    $stmt_category = $pdo->prepare("SELECT category_name FROM categories WHERE id = ?");
    $stmt_category->execute([$category_id]);
    $category_name = $stmt_category->fetchColumn();

    // SQL-Abfrage vorbereiten und ausführen, um Produkte basierend auf der Kategorie abzurufen
    $stmt_products = $pdo->prepare("SELECT pd.* FROM products_details pd
                                  JOIN categories c ON pd.category = c.category_name
                                  WHERE c.id = ?");
    $stmt_products->execute([$category_id]);

    // Ergebnisse abrufen
    $products = $stmt_products->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Fügen Sie hier Ihr spezifisches CSS hinzu */
          .card-img-top {
        height: auto;
        object-fit: contain; /* Ändern Sie von 'cover' zu 'contain' */
    }

    #mainImage {
        max-width: 100%;
        height: auto;
    }

    .image-gallery img {
        height: auto;
        cursor: pointer;
    }
    </style>
    <title>Produkte für Kategorie <?php echo $category_name; ?></title>
</head>

<body>

<?php include('header.php'); ?>


    <div class="container mt-5">
        <h2>Produkte für Kategorie "<?php echo $category_name; ?>"</h2>

        <div class="row">
            <?php foreach ($products as $product): ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="single_product.php?id=<?php echo $product['product_id']; ?>">
                            <img src="<?php echo $product["first_picture"]; ?>" alt="<?php echo $product["product_name"]; ?>" class="card-img-top">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $product["product_name"]; ?></h5>
                            <p class="card-text">Unser Preis: <?php echo $product["unser_preis"]; ?></p>
                            <!-- Weitere Produktinformationen hier einfügen -->
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>

<?php
} else {
    echo "Die category_id wurde nicht übergeben.";
}
?>