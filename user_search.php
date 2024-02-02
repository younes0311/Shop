<?php
include "db_connection.php";
include('header.php');
include('session_check.php');

if (isset($_GET['search_query'])) {
    $searchQuery = $_GET['search_query'];

    $stmt = $pdo->prepare("SELECT * FROM products_details WHERE product_name LIKE :searchQuery OR description LIKE :searchQuery");
    $stmt->bindValue(':searchQuery', '%' . $searchQuery . '%', PDO::PARAM_STR);
    $stmt->execute();

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $numResults = count($results);
} else {
    echo "Kein Suchbegriff gefunden.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Suchergebnisse</title>
    <style>
    .product-count {
        margin-bottom: 20px;
    }

    .card {
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
        overflow:hidden;
        justify-content:center;
        display:flex;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card img {
        height: 250px;
        width:auto;
    }

    .old-price {
        text-decoration: line-through;
        color: #888;
        margin-bottom: 5px;
    }

    .sale-price {
        color: #e74c3c;
    }
</style>
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Suchergebnisse für "<?php echo $searchQuery; ?>"</h2>

    <p class="product-count text-muted mb-4"><?php echo $numResults; ?> Produkte gefunden</p>

    <div class="row">
        <?php foreach ($results as $product): ?>
            <div class="col-md-4">
                <div class="card h-100">
                    <a href="single_product.php?id=<?php echo $product['product_id']; ?>">
                        <img src="<?php echo $product["first_picture"]; ?>" alt="<?php echo $product["product_name"]; ?>" class="card-img-top">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $product["product_name"]; ?></h5>
                        <?php if (!empty($product["sale_preis"])): ?>
                            <p class="old-price">Unser Preis: <?php echo $product["unser_preis"]; ?></p>
                            <p class="sale-price">Sale Preis: <?php echo $product["sale_preis"]; ?></p>
                        <?php else: ?>
                            <p class="card-text">Unser Preis: <?php echo $product["unser_preis"]; ?></p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <?php include('footer.php');?>
</body>
</html>