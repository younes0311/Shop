<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="admin_header.css">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        #box-nav {
            background-color: #007bff;
            color: white;
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #box-nav a {
            text-decoration: none;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            transition: 0.3s;
        }

        #box-nav a:hover {
            background-color: #0056b3;
            border-radius: 10px;
        }

        .material-symbols-outlined {
            font-size: 24px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>

<div id='box-nav'>
    <a href="admin.php">
        <span class="material-symbols-outlined">home</span>
        Dashboard
    </a>
    <a href="products_mng.php">
        <span class="material-symbols-outlined">inventory_2</span>
        Products-Mng
    </a>
    <a href="lieferanten.php">
        <span class="material-symbols-outlined">local_shipping</span>
        Lieferanten
    </a>
    <a href="all_categories.php">
        <span class="material-symbols-outlined">dataset</span>
        Categories
    </a>


<a href="ads_mng.php"><span class="material-symbols-outlined">
ad_group
</span>Ads</a>


    <a href="products_analyse.php">
        <span class="material-symbols-outlined">monitoring</span>
        Analyse
    </a>
    <a href="index.php">
        <span class="material-symbols-outlined">storefront</span>
        Shop
    </a>

    <a href="products_sales_mng.php"><span class="material-symbols-outlined">
percent
</span>
    Sales
    </a>

<a href="index_cata.php">Cata-ADS</a>


    <?php
    // Hier prüfen, ob der Benutzer angemeldet ist
    // Annahme: $isLoggedIn ist eine Variable, die angibt, ob der Benutzer angemeldet ist oder nicht
    $isLoggedIn = true; // Setze dies entsprechend deiner Logik

    if ($isLoggedIn) {
        echo '<a href="logout.php">Logout</a>'; // Ändere "logout.php" entsprechend deiner Logout-URL
    }
    ?>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>