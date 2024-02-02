<?php
// Include-Statements für Datenbankverbindung, Admin-Prüfung und Header
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

// Alle Produkte aus der Datenbank abrufen
$statement = $pdo->query("SELECT * FROM products_details");
$allProducts = $statement->fetchAll(PDO::FETCH_ASSOC);

// Anzahl der Produkte mit verschiedenen Status zählen
$countOnlineProducts = countProductsByStatus($allProducts, 'online');
$countOfflineProducts = countProductsByStatus($allProducts, 'offline');

function countProductsByStatus($products, $status) {
    return count(array_filter($products, function ($product) use ($status) {
        return $product['status'] == $status;
    }));
}

// Produkte basierend auf Suchbegriff, Lieferantennamen und Kategorie filtern
// Produkte basierend auf Suchbegriff, Lieferantennamen, Kategorie, CPI oder Produktname filtern
$searchTerm = isset($_GET['search']) ? $_GET['search'] : '';
$supplierName = isset($_GET['supplier']) ? $_GET['supplier'] : '';
$category = isset($_GET['category']) ? $_GET['category'] : '';

if (!empty($searchTerm) || !empty($supplierName) || !empty($category)) {
    $products = array_filter($allProducts, function ($product) use ($searchTerm, $supplierName, $category) {
        $nameMatch = empty($searchTerm) || stripos($product['product_name'], $searchTerm) !== false || stripos($product['cpi'], $searchTerm) !== false;
        $supplierMatch = empty($supplierName) || stripos($product['company'], $supplierName) !== false;
        $categoryMatch = empty($category) || stripos($product['category'], $category) !== false;

        return $nameMatch && $supplierMatch && $categoryMatch;
    });
} else {
    $products = $allProducts;
}

// Anzahl der gefilterten Produkte zählen
$countFilteredProducts = count($products);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="products_mng.css"> <!-- Falls du zusätzliche lokale CSS-Dateien hast -->

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        h2 {
            color: #007bff;
        }

        #add-product-btn {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .status-info {
            display: flex;
            margin-left: auto;
        }

        .status-info div {
            margin-right: 20px;
            font-weight: bold;
        }

        .product-count {
            font-weight: bold;
            margin-left: 20px;
        }

        .search-form {
            margin-bottom: 20px;
        }

        .table th, .table td {
            text-align: center;
        }

        .selected-row {
            background-color: #007bff;
            color: #fff;
        }

        #scrollToTopBtn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 10px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Produkte verwalten</h2>

        <div id="add-product-btn">
            <a href="add_products.php" class="btn btn-success">Produkt hinzufügen</a>
            <div class="status-info">
                <div class="online"><?php echo $countOnlineProducts; ?> Online</div>
                <div class="offline"><?php echo $countOfflineProducts; ?> Offline</div>
            </div>
            <div class="product-count">
                <?php echo $countFilteredProducts; ?> Produkte
            </div>
        </div>

        <form action="" method="get" class="search-form">
            <div class="row">
                <div class="col-md-4">
                    <input type="text" name="search" class="form-control" placeholder="Suche nach Produktname oder CPI" value="<?php echo htmlspecialchars($searchTerm); ?>">
                </div>
                <div class="col-md-4">
                    <input type="text" name="supplier" class="form-control" placeholder="Suche nach Lieferantennamen" value="<?php echo htmlspecialchars($supplierName); ?>">
                </div>
                <div class="col-md-3">
                    <input type="text" name="category" class="form-control" placeholder="Suche nach Kategorie" value="<?php echo htmlspecialchars($category); ?>">
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary">Suchen</button>
                </div>
            </div>
        </form>

        <form action="" method="post" id="delete-form">
            <div id="selected-info" style="margin-bottom: 10px;">
                <span id="selected-count">0</span> ausgewählt
                <button type="button" id="delete-selected" class="btn btn-danger">Ausgewählte löschen</button>
            </div>
            
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Produkt Bild</th>
                        <th>Produkt Name</th>
                        <th>Preis</th>
                        <th>Unternehmen</th>
                        <th>CPI</th>
                        <th>Kategorie</th>
                        <th>Menge</th>
                        <th>Status</th>
                        <th>Erstellt am</th>
                        <th>Auswahl</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($products as $product): ?>
                        <tr class="<?php echo in_array($product['product_id'], $_POST['selectedProducts'] ?? []) ? 'selected-row' : ''; ?>">
                            <td><img src="<?php echo $product['first_picture']; ?>" alt="Produktbild" width="50"></td>
                            <td><?php echo $product['product_name']; ?></td>
                            <td><?php echo $product['unser_preis']; ?></td>
                            <td><?php echo $product['company']; ?></td>
                            <td><?php echo $product['cpi']; ?></td>
                            <td><?php echo $product['category']; ?></td>
                            <td><?php echo $product['quantity']; ?></td>
                            <td><h4 class="status-class"><?php echo $product['status']; ?></h4></td>
                            <td><?php echo $product['created_at']; ?></td>
                            <td>
                                <input type="checkbox" name="selectedProducts[]" value="<?php echo $product['product_id']; ?>">
                            </td>
                            <td>
                                <a href="edit_product.php?product_id=<?php echo $product['product_id']; ?>" class="btn btn-primary">Bearbeiten</a>
                                <?php if ($product['status'] == 'online'): ?>
                                    <a href="change_status.php?product_id=<?php echo $product['product_id']; ?>&status=offline" class="btn btn-warning">Off-stellen</a>
                                <?php else: ?>
                                    <a href="change_status.php?product_id=<?php echo $product['product_id']; ?>&status=online" class="btn btn-success">On-stellen</a>
                                <?php endif; ?>
                                <a href="delete_product.php?product_id=<?php echo $product['product_id']; ?>" onclick="return confirm('Sind Sie sicher?')" class="btn btn-danger">Löschen</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </form>
    </div>

    <button id="scrollToTopBtn" onclick="scrollToTop()" class="btn btn-primary" style="display: none;">Scroll to Top</button>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var deleteForm = document.getElementById('delete-form');
            var selectedInfo = document.getElementById('selected-info');
            var selectedCount = document.getElementById('selected-count');
            var deleteSelectedBtn = document.getElementById('delete-selected');
            var scrollToTopBtn = document.getElementById('scrollToTopBtn');

            if (deleteForm && selectedInfo && selectedCount && deleteSelectedBtn) {
                deleteForm.addEventListener('change', updateSelectedCount);
                deleteSelectedBtn.addEventListener('click', deleteSelectedProducts);

                function updateSelectedCount() {
                    var selectedProducts = document.querySelectorAll('input[name="selectedProducts[]"]:checked');
                    selectedCount.textContent = selectedProducts.length;
                }

                function deleteSelectedProducts() {
                    var confirmation = confirm('Möchten Sie die ausgewählten Produkte wirklich löschen?');
                    if (confirmation) {
                        deleteForm.submit();
                    }
                }
            }

            window.addEventListener('scroll', function () {
                if (window.scrollY > 500) {
                    scrollToTopBtn.style.display = 'block';
                } else {
                    scrollToTopBtn.style.display = 'none';
                }
            });

            scrollToTopBtn.addEventListener('click', function () {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>