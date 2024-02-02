<?php
include("session_check.php");
include("admin_header.php");
require_once "db_connection.php";

// Filterung nach Produktstatus
$productStatusFilter = isset($_GET['product_status']) ? $_GET['product_status'] : 'all';
$filterCondition = ($productStatusFilter === 'sale') ? 'product_status = "sale"' : (($productStatusFilter === 'normal') ? 'product_status = "normal"' : '1');

try {
    // Nur die gewünschten Spalten auswählen und Produkte abrufen
    $stmt = $pdo->prepare("SELECT first_picture, product_name, unser_preis, profit, status, product_status, 
                                sale_prozent, sale_preis, sale_profit, product_id 
                            FROM products_details WHERE $filterCondition");
    $stmt->execute();

    // Fetch products only if the query was successful
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Count the number of products with different statuses
    $onlineProductsCount = array_count_values(array_column($products, 'status'))['online'] ?? 0;
    $offlineProductsCount = array_count_values(array_column($products, 'status'))['offline'] ?? 0;
    $saleProductsCount = array_count_values(array_column($products, 'product_status'))['sale'] ?? 0;
    $normalProductsCount = array_count_values(array_column($products, 'product_status'))['normal'] ?? 0;

} catch (PDOException $e) {
    echo "Fehler: " . $e->getMessage();
    // You might want to handle the error more gracefully, for example, redirect to an error page
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <style>
        /* Füge hier zusätzliche CSS-Stile hinzu, falls benötigt */
        .card {
            margin-bottom: 20px;
        }

        .card img {
            height: 150px; /* Kleinere Höhe für die Bilder */
            object-fit: contain; /* Bilder proportional einpassen, ohne zuschneiden */
        }

        .card-title {
            font-size: 16px;
        }

        .table th,
        .table td {
            text-align: center;
        }

        .img-thumbnail {
            height: 75px; /* Kleinere Höhe für die Vorschaubilder */
        }

        .sale-highlight {
            color: red;
            font-weight: bold;
        }

        .strikethrough {
            text-decoration: line-through;
            color: #ccc; /* Hellgrau für durchgestrichenen Text */
        }

        /* Neue Stile für den Verkaufskreis */
        .sale-circle {
            position: absolute;
            top: 50%;
            right: 0;
            transform: translate(0%, -50%);
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 5px;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <div class="container">
        <!-- Filter für Produkte -->
        <div class="row mb-4">
            <div class="col-md-12">
                <form id="filterForm">
                    <div class="form-group">
                        <label for="productStatusFilter">Filter nach Produktstatus:</label>
                        <select class="form-control" id="productStatusFilter" name="product_status">
                            <option value="all" <?php echo ($productStatusFilter === 'all') ? 'selected' : ''; ?>>Alle Produkte</option>
                            <option value="sale" <?php echo ($productStatusFilter === 'sale') ? 'selected' : ''; ?>>Sale Produkte</option>
                            <option value="normal" <?php echo ($productStatusFilter === 'normal') ? 'selected' : ''; ?>>Normal Produkte</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="applyFilter()">Filter anwenden</button>
                </form>
            </div>
        </div>

        <!-- Anzeige der Anzahl von Produkten ... (vorhandener Code) ... -->

        <!-- Produkte anzeigen -->
        <?php if (!empty($products)): ?>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Our Price (€)</th>
                        <th>Profit (€)</th>
                        <th>Sale Prozent %</th>
                        <th>Sale Profit</th>
                        <th>Sale Preis</th>
                        <th>Status</th>
                        <th>Product Status</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($products as $product): ?>
                        <tr>
                            <td>
                                <?php if (!empty($product['first_picture'])): ?>
                                    <div class="position-relative">
                                        <img src="<?php echo $product['first_picture']; ?>" alt="" class="img-thumbnail">
                                        <?php if ($product['sale_prozent'] > 0): ?>
                                            <div class="sale-circle"><?php echo $product['sale_prozent']; ?>%</div>
                                        <?php endif; ?>
                                    </div>
                                <?php endif; ?>
                            </td>
                            <td><?php echo $product['product_name']; ?></td>
                            <td <?php echo ($product['sale_prozent'] > 0.1) ? 'class="sale-highlight strikethrough"' : ''; ?>><?php echo $product['unser_preis']; ?></td>
                            <td <?php echo ($product['sale_prozent'] > 0.1) ? 'class="sale-highlight strikethrough"' : ''; ?>><?php echo $product['profit']; ?></td>
                            <td <?php echo ($product['sale_prozent'] > 0.1) ? 'class="sale-highlight"' : ''; ?>><?php echo $product['sale_prozent']; ?></td>
                            <td <?php echo ($product['sale_prozent'] > 0.1) ? 'class="sale-highlight"' : ''; ?>><?php echo $product['sale_profit']; ?></td>
                            <td <?php echo ($product['sale_prozent'] > 0.1) ? 'class="sale-highlight"' : ''; ?>><?php echo $product['sale_preis']; ?></td>
                            <td><?php echo $product['status']; ?></td>
                            <td><?php echo $product['product_status']; ?></td>
                            <td>
                                <a href="product_sale_status.php?product_id=<?php echo $product['product_id']; ?>" class="btn btn-primary">Bearbeiten</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No products found.</p>
        <?php endif; ?>
    </div>

    <!-- Weitere Inhalte hier -->

    <script>
        $(document).ready(function () {
            // Markiere die entsprechenden Zellen in Rot und durchgestrichen, wenn Sale Prozent größer als 0.1 ist
            $('.sale-highlight').css('color', 'red');
            $('.strikethrough').css('text-decoration', 'line-through').css('color', '#ccc');
        });

        function applyFilter() {
            var productStatus = $('#productStatusFilter').val();
            var url = 'products_list.php?product_status=' + productStatus;
            window.location.href = url;
        }
    </script>

</body>

</html>