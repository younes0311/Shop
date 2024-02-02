<?php
include("session_check.php");
require_once "db_connection.php";

$product_id = $_GET['product_id'] ?? null;

try {
    $stmt = $pdo->prepare("SELECT product_name, sale_profit, sale_preis, sale_prozent, profit, unser_preis, lieferant_preis, product_status FROM products_details WHERE product_id = :product_id");
    $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
    $stmt->execute();
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Fehler: " . $e->getMessage();
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
        .form-group {
            margin-bottom: 20px;
        }

        .sale-fields {
            display: none;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Edit Product Sale Status</h2>

        <form action="product_sale_status_process.php" method="post">

            <!-- Product Name -->
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" class="form-control" id="productName" name="product_name" value="<?php echo $product['product_name'] ?? ''; ?>" readonly>
            </div>

            <!-- Lieferant Preis (Readonly) -->
            <div class="form-group">
                <label for="lieferantPreis">Lieferant Preis:</label>
                <input type="text" class="form-control" id="lieferantPreis" name="lieferant_preis" value="<?php echo $product['lieferant_preis'] ?? ''; ?>" readonly>
            </div>

            <!-- Unser Preis -->
            <div class="form-group">
                <label for="unserPreis">Unser Preis:</label>
                <input type="text" class="form-control" id="unserPreis" name="unser_preis" value="<?php echo $product['unser_preis'] ?? ''; ?>" readonly>
            </div>

            <!-- Profit -->
            <div class="form-group">
                <label for="profit">Profit:</label>
                <input type="text" class="form-control" id="profit" name="profit" value="<?php echo $product['profit'] ?? ''; ?>" readonly>
            </div>

            <!-- Product Status -->
            <div class="form-group">
                <label for="productStatus">Product Status:</label>
                <select class="form-control" id="productStatus" name="product_status">
                    <option value="normal" <?php echo (isset($product['product_status']) && $product['product_status'] === 'normal') ? 'selected' : ''; ?>>Normal</option>
                    <option value="sale" <?php echo (isset($product['product_status']) && $product['product_status'] === 'sale') ? 'selected' : ''; ?>>Sale</option>
                </select>
            </div>

            <div class="form-group sale-fields">
                <label for="saleProzent">Sale Prozent:</label>
                <input type="text" class="form-control" id="saleProzent" name="sale_prozent" value="<?php echo $product['sale_prozent'] ?? ''; ?>">
            </div>

            <!-- Sale Profit -->
            <div class="form-group sale-fields">
                <label for="saleProfit">Sale Profit:</label>
                <input type="text" class="form-control" id="saleProfit" name="sale_profit" value="<?php echo $product['sale_profit'] ?? ''; ?>" readonly>
            </div>

            <!-- Sale Preis -->
            <div class="form-group sale-fields">
                <label for="salePreis">Sale Preis:</label>
                <input type="text" class="form-control" id="salePreis" name="sale_preis" value="<?php echo $product['sale_preis'] ?? ''; ?>" readonly>
            </div>

            <!-- Hidden Inputs for Calculated Values -->
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>">

            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>

    <script>
        $(document).ready(function () {
            toggleSaleFields();

            $('#productStatus').on('change', function () {
                toggleSaleFields();
            });

            $('#saleProzent').on('input', function () {
                updateSaleFields();
            });

            function toggleSaleFields() {
                var productStatus = $('#productStatus').val();
                if (productStatus === 'sale') {
                    $('.sale-fields').show();
                } else {
                    $('.sale-fields').hide();
                    // Setzen Sie die Sale-Felder auf 0, wenn der Status auf "normal" geändert wird
                    $('#saleProzent, #saleProfit, #salePreis').val('0');
                }
            }

            function updateSaleFields() {
                var saleProzent = parseFloat($('#saleProzent').val()) || 0;
                var unserPreis = parseFloat($('#unserPreis').val()) || 0;
                var profit = parseFloat($('#profit').val()) || 0;

                var saleProfit = profit - (profit * (saleProzent / 100));
                var salePreis = unserPreis - (unserPreis * (saleProzent / 100));

                $('#saleProfit').val(saleProfit.toFixed(2));
                $('#salePreis').val(salePreis.toFixed(2));
            }
        });
    </script>

</body>

</html>