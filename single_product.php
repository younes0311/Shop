
<?php
include("session_check.php");
include("header.php");
require_once "db_connection.php";

if (isset($_GET['id'])) {
    $productId = $_GET['id'];

    try {
      
        $stmt = $pdo->prepare("SELECT * FROM products_details WHERE product_id = :id AND status = 'online'");
        $stmt->bindParam(':id', $productId, PDO::PARAM_INT);
        $stmt->execute();

        $product = $stmt->fetch(PDO::FETCH_ASSOC);

      
        $imageStmt = $pdo->prepare("SELECT * FROM products_images WHERE product_id = :id");
        $imageStmt->bindParam(':id', $productId, PDO::PARAM_INT);
        $imageStmt->execute();

        $images = $imageStmt->fetchAll(PDO::FETCH_ASSOC);

        if (!$product) {
            header("Location: error_page.php"); 
            exit();
        }
    } catch (PDOException $e) {
        header("Location: error_page.php"); 
        exit();
    }
} else {
    header("Location: error_page.php"); 
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="single_product.css">
</head>

<body>

    <div class='box'>

        <div class="product-details">
            <h1><?php echo $product['product_name']; ?></h1>
            <p class="price">Preis: <?php echo $product['unser_preis']; ?> €</p>

            <?php if (!empty($product['first_picture'])): ?>
                <img src="<?php echo $product['first_picture']; ?>" id="mainImage">
            <?php endif; ?>

            <!-- Bildergalerie -->
            <div class="image-gallery">
                <?php foreach ($images as $image): ?>
                    <img src="<?php echo $image['image_path']; ?>" onclick="changeMainImage('<?php echo $image['image_path']; ?>')">
                <?php endforeach; ?>
            </div>

            <p><?php echo $product['description']; ?></p>

            <!-- In den Warenkorb-Button -->
           <button class="add-to-cart-btn" onclick="addToCart(<?php echo $product['product_id']; ?>, '<?php echo $product['product_name']; ?>', 1, <?php echo $product['unser_preis']; ?>, '<?php echo $product['first_picture']; ?>')">In den Warenkorb</button>

            <!-- Merken-Button -->
            <button class="save-btn" onclick="saveProduct(<?php echo $product['product_id']; ?>)">Merken</button>
        </div>

    </div>

    <script>
        function changeMainImage(newImage) {
            document.getElementById('mainImage').src = newImage;
        }

        function saveProduct(productId) {
            alert("Produkt wurde gemerkt!");
        }
    </script>

</body>

</html>