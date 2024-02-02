<?php
// Verbindung zur Datenbank herstellen
include_once "db_connection.php";
include('admin_header.php');
// Funktion zum Formatieren des Datums
function formatDate($date) {
    return date('Y-m-d', strtotime($date));
}

// Daten aus der Datenbank abrufen (Beispiel: Anzahl der eingefügten Produkte)
$today = formatDate(date('Y-m-d'));
$lastWeek = formatDate(date('Y-m-d', strtotime('-7 days')));
$yesterday = formatDate(date('Y-m-d', strtotime('-1 day')));

// Abfrage für Anzahl der eingefügten Produkte
$statementProducts = $pdo->prepare("SELECT DATE(created_at) as date_added, COUNT(*) as count FROM products_details WHERE created_at >= :date GROUP BY date_added");
$statementProducts->execute(['date' => $lastWeek]);
$productData = $statementProducts->fetchAll(PDO::FETCH_ASSOC);

// Abfrage für die Verteilung der Produkte nach Kategorien
$statementCategories = $pdo->query("SELECT category, COUNT(*) as count FROM products_details GROUP BY category");
$categoryData = $statementCategories->fetchAll(PDO::FETCH_ASSOC);

// Abfrage für die Verteilung der Produkte nach Unternehmen (Company)
$statementCompanies = $pdo->query("SELECT company, COUNT(*) as count FROM products_details GROUP BY company");
$companyData = $statementCompanies->fetchAll(PDO::FETCH_ASSOC);

// Google Charts-Bibliothek einbinden
?>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard-Analyse</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            // Daten für das Säulendiagramm
            var dataProducts = new google.visualization.DataTable();
            dataProducts.addColumn('string', 'Datum');
            dataProducts.addColumn('number', 'Anzahl');

            dataProducts.addRows([
                <?php
                foreach ($productData as $row) {
                    echo "['" . $row['date_added'] . "', " . $row['count'] . "], ";
                }
                ?>
            ]);

            // Optionen für das Säulendiagramm
            var optionsProducts = {
                title: 'Anzahl der eingefügten Produkte (über die Zeit)',
                legend: { position: 'none' }
            };

            // Säulendiagramm erstellen und in das HTML-Element mit der ID 'chart_div_products' einfügen
            var chartProducts = new google.visualization.ColumnChart(document.getElementById('chart_div_products'));
            chartProducts.draw(dataProducts, optionsProducts);

            // Daten für das Donut-Diagramm (Pie Chart) - Kategorien
            var dataCategories = new google.visualization.DataTable();
            dataCategories.addColumn('string', 'Kategorie');
            dataCategories.addColumn('number', 'Anzahl');

            dataCategories.addRows([
                <?php
                foreach ($categoryData as $row) {
                    echo "['" . $row['category'] . "', " . $row['count'] . "], ";
                }
                ?>
            ]);

            // Optionen für das Donut-Diagramm (Pie Chart) - Kategorien
            var optionsCategories = {
                title: 'Verteilung der Produkte nach Kategorien',
                pieHole: 0.4, // Optional: Donut-Diagramm mit Loch
                legend: { position: 'right' }
            };

            // Donut-Diagramm erstellen und in das HTML-Element mit der ID 'chart_div_categories' einfügen
            var chartCategories = new google.visualization.PieChart(document.getElementById('chart_div_categories'));
            chartCategories.draw(dataCategories, optionsCategories);

            // Daten für das Donut-Diagramm (Pie Chart) - Unternehmen (Company)
            var dataCompanies = new google.visualization.DataTable();
            dataCompanies.addColumn('string', 'Unternehmen');
            dataCompanies.addColumn('number', 'Anzahl');

            dataCompanies.addRows([
                <?php
                foreach ($companyData as $row) {
                    echo "['" . $row['company'] . "', " . $row['count'] . "], ";
                }
                ?>
            ]);

            // Optionen für das Donut-Diagramm (Pie Chart) - Unternehmen (Company)
            var optionsCompanies = {
                title: 'Verteilung der Produkte nach Unternehmen',
                pieHole: 0.4, // Optional: Donut-Diagramm mit Loch
                legend: { position: 'right' }
            };

            // Donut-Diagramm erstellen und in das HTML-Element mit der ID 'chart_div_companies' einfügen
            var chartCompanies = new google.visualization.PieChart(document.getElementById('chart_div_companies'));
            chartCompanies.draw(dataCompanies, optionsCompanies);
        }
    </script>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Dashboard-Analyse</a>
</nav>

<!-- HTML-Elemente für die Diagramme -->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <div id="chart_div_products" style="height: 500px;"></div>
        </div>
        <div class="col-md-4">
            <div id="chart_div_categories" style="height: 500px;"></div>
        </div>
        <div class="col-md-4">
            <div id="chart_div_companies" style="height: 500px;"></div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>