<?php
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

// Überprüfen, ob die Suche durchgeführt wurde
if (isset($_POST['search_category'])) {
    $search_term = $_POST['search_category'];
    $sql = "SELECT c.id, c.category_name, c.category_image, c.cata_loc, COUNT(p.product_id) as product_count
            FROM categories c
            LEFT JOIN products_details p ON c.category_name = p.category
            WHERE c.category_name LIKE :search_term
            GROUP BY c.category_name";
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':search_term', '%' . $search_term . '%');
    $stmt->execute();
    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    // Standard-SQL-Abfrage, um alle Kategorien mit der Anzahl der zugehörigen Produkte zu holen
    $sql = "SELECT c.id, c.category_name, c.category_image, c.cata_loc, COUNT(p.product_id) as product_count
            FROM categories c
            LEFT JOIN products_details p ON c.category_name = p.category
            GROUP BY c.category_name";
    $stmt = $pdo->query($sql);
    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="all_categories.css">
    <title>Alle Kategorien</title>
    <style>
        /* Füge hier dein spezifisches CSS hinzu */
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .add-category-btn {
            margin-left: 10px;
        }

        form {
            margin-bottom: 20px;
        }

          #scrollToTopBtn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: none;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Alle Kategorien</h2>
        <div class="category-actions">
            <h4><span>Anzahl der Kategorien: <?php echo count($categories); ?></span></h4>
            <a href="category_create.php" class="btn btn-primary add-category-btn">Neue Kategorie hinzufügen</a>
        </div>
    </div>

    <!-- Kategorien-Suchformular -->
    <form action="" method="post">
        <div class="form-group">
            <label for="search_category">Kategorie suchen:</label>
            <div class="input-group">
                <input type="text" name="search_category" id="search_category" class="form-control" placeholder="Kategorienname">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-primary" id="search-btn">Suchen</button>
                </div>
            </div>
        </div>
    </form>

    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>Kategorie Bild</th>
                <th>Kategorie</th>
                <th>Cata Loc</th>
                <th>Anzahl der Produkte</th>
                <th>Aktionen</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($categories as $category): ?>
                <tr>
                    <!-- Kategoriebild -->
                    <td>
                        <?php 
                        $categoryImage = $category['category_image'];
                        echo "<img src='$categoryImage' alt='Kategoriebild' style='max-width: 50px; max-height: 50px;'>";
                        ?>
                    </td>
                    
                    <!-- Originalspalten -->
                    <td><?php echo $category['category_name']; ?></td>
                    <td><?php echo $category['cata_loc']; ?></td>
                    <td><?php echo $category['product_count']; ?></td>
                    
                    <!-- Aktionen -->
                    <td>
                        <a class="btn btn-info" href="category_products.php?category=<?php echo $category['category_name']; ?>">Produkte anzeigen</a>
                        <a class="btn btn-warning" href="edit_category.php?category=<?php echo $category['category_name']; ?>">Bearbeiten</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<button onclick="scrollToTop()" id="scrollToTopBtn">Scroll To Top</button>

<!-- JavaScript einbinden -->
<script>
    // Funktion, um zur Oberseite der Seite zu scrollen
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    // Funktion, um den Scroll-To-Top-Button basierend auf dem Scroll-Verhalten anzuzeigen/auszublenden
    window.onscroll = function() {
        scrollFunction();
    };

    function scrollFunction() {
        var scrollToTopBtn = document.getElementById("scrollToTopBtn");

        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            scrollToTopBtn.style.display = "block";
        } else {
            scrollToTopBtn.style.display = "none";
        }
    }
</script>

<!-- Bootstrap JavaScript-Dateien einbinden (falls benötigt) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>