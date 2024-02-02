<?php
include("session_check.php");
require_once "db_connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $product_id = $_POST['product_id'];
    $product_status = $_POST['product_status'];

    if ($product_status == 'sale') {
        $product_name = $_POST['product_name'];
        $unser_preis = $_POST['unser_preis'];
        $lieferant_preis = $_POST['lieferant_preis'];
        $profit = $_POST['profit'];
        $sale_prozent = $_POST['sale_prozent'];

        $sale_profit = $profit - ($profit * ($sale_prozent / 100));
        $sale_preis = $unser_preis - ($unser_preis * ($sale_prozent / 100));

        try {
            $updateStmt = $pdo->prepare("UPDATE products_details SET 
                                        sale_prozent = :sale_prozent,
                                        sale_profit = :sale_profit,
                                        sale_preis = :sale_preis,
                                        product_status = :product_status
                                        WHERE product_id = :product_id");

            $updateStmt->bindParam(':sale_prozent', $sale_prozent);
            $updateStmt->bindParam(':sale_profit', $sale_profit);
            $updateStmt->bindParam(':sale_preis', $sale_preis);
            $updateStmt->bindParam(':product_status', $product_status);
            $updateStmt->bindParam(':product_id', $product_id);

            if ($updateStmt->execute()) {
                // Erfolgsmeldung für den Sale-Fall im gleichen Stil
                echo <<<HTML
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Erfolg_product_sale_status.php</title>
                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                </head>
                <body class="bg-light">
                    <div class="container mt-5">
                        <div class="card text-center">
                            <div class="card-header bg-success text-white">
                                Erfolg
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Daten erfolgreich aktualisiert!</h5>
                                <p class="card-text">Die Sale-Informationen wurden erfolgreich in der Datenbank aktualisiert.</p>
                                <a href="products_sales_mng.php" class="btn btn-primary">Zu Sale Mng</a>
                                <a href="admin.php" class="btn btn-success">Zum Dashboard</a>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                </body>
                </html>
HTML;
            } else {
                echo "Fehler beim Aktualisieren der Daten in der Datenbank.";
            }
        } catch (PDOException $e) {
            echo "Fehler: " . $e->getMessage();
        }
    } elseif ($product_status == 'normal') {
        // Setze sale_prozent, sale_preis und sale_profit auf 0
        try {
            $updateStmt = $pdo->prepare("UPDATE products_details SET 
                                        sale_prozent = 0,
                                        sale_profit = 0,
                                        sale_preis = 0,
                                        product_status = 'normal'
                                        WHERE product_id = :product_id");

            $updateStmt->bindParam(':product_id', $product_id);

            if ($updateStmt->execute()) {
                // Erfolgsmeldung für den Normalfall im gleichen Stil
                echo <<<HTML
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Normal_product_status.php</title>
                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                </head>
                <body class="bg-light">
                    <div class="container mt-5">
                        <div class="card text-center">
                            <div class="card-header bg-info text-white">
                                Information
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Produkt wurde erfolgreich auf Normal gestellt.</h5>
                                <p class="card-text">Weitere Aktionen:</p>
                                <a href="products_sales_mng.php" class="btn btn-primary">Zu Sale Mng</a>
                                <a href="admin.php" class="btn btn-success">Zum Dashboard</a>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                </body>
                </html>
HTML;
            } else {
                echo "Fehler beim Aktualisieren der Daten in der Datenbank.";
            }
        } catch (PDOException $e) {
            echo "Fehler: " . $e->getMessage();
        }
    }
}
?>