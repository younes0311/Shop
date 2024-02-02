<?php include('session_check.php');?>

<?php

require_once "db_connection.php";
include('header.php');

function getAds($location) {
    global $pdo;
    $stmt = $pdo->prepare("SELECT ad_id, ad_title, ad_description, ad_image, ad_link FROM Ads WHERE location = ?");
    $stmt->execute([$location]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getCategories($loc) {
    global $pdo;
    $stmt = $pdo->prepare("SELECT id, category_name, category_image FROM Categories WHERE Cata_Loc = ?");
    $stmt->execute([$loc]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$loc = 1; // Ihre gewünschte Location

$categories = getCategories($loc);

function getProducts() {
    global $pdo;
    $stmt = $pdo->prepare("SELECT product_id, product_name, unser_preis, sale_preis, sale_prozent, first_picture FROM products_details WHERE status = 'online'");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$location = 1; // Nur Location 1 anzeigen

$ads = getAds($location);

$products = getProducts();
?>
<?php
include('cookies_not.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
    <style>
          body {
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            min-width: 1500px;
            margin: 0 auto;
            background:#444444
        }

        .ad-container {
            text-align: center;
            background: transparent;
            color: white;
            padding: 10px;
            width: 100%;
            display: flex;
            align-items: center;
            height: 270px;
        }

        .ad-container img {
            max-width: 100%;
            height: 100%;
            width: 100%;
        }

        .card {
            margin-bottom: 20px;
            position: relative;
        }

        .card img {
            height: 200px;
            object-fit: cover;
        }

        .card-title {
            font-size: 18px;
        }

        #categories-container {
            margin-top: 20px;
        }

        #categories-container .card {
            height: 400px;
            background:#ffffff;
            width:300px;
        }

        #categories-container .card img {
            height: 270px; /* Adjust the height of the images */
            object-fit: contain;
        }

        .slider {
            margin-top: 20px;
        }

    .leaderboard-banner {
    width: 728px; /* Breite eines Leaderboard-Banners */
    height: 90px; /* Höhe eines Leaderboard-Banners */
    max-width: 100%;
    max-height: 100%;
    object-fit: contain; /* Behält das Seitenverhältnis bei */
} 

    </style>
</head>

<body>
    <div class="container">
        <!-- Slider für Anzeigen -->
      <div class="slider">
    <?php foreach ($ads as $ad): ?>
        <div class="ad-container">
            <a href="<?php echo $ad['ad_link']; ?>" target="_blank">
                <img src="<?php echo $ad['ad_image']; ?>" alt="Werbung" class="leaderboard-banner">
            </a>
        </div>
    <?php endforeach; ?>
</div>

        <!-- Kategorien anzeigen -->
      <div id="categories-container" class="row">
    <?php foreach ($categories as $category): ?>
        <div class="col-md-3 mb-4">
            <div class="card h-100">


                <a href="products_by_category.php?category_id=<?php echo $category["id"]; ?>">

                  <div class="card-body">
                    <h5 class="card-title"><?php echo $category["category_name"]; ?></h5>
                </div>
                    <img src="<?php echo $category["category_image"]; ?>" alt="<?php echo $category["category_name"]; ?>" class="card-img-top">
                </a>
              
            </div>
        </div>
    <?php endforeach; ?>
</div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        // Initialisieren Sie den Slick-Slider
        $('.slider').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 4000,
            dots: true,
        });
    </script>
    <?php include('footer.php');?>
</body>

</html>