<?php
include_once "db_connection.php";
include('admin_check.php'); 
include("admin_header.php");

if (isset($_POST['search_supplier'])) {
    $search_term = $_POST['search_supplier'];
    $query = "SELECT l.*, COUNT(p.product_id) AS product_count
              FROM lieferanten l
              LEFT JOIN products_details p ON l.lieferant_name = p.company
              WHERE l.lieferant_name LIKE :search_term
              GROUP BY l.id";
    $stmt = $pdo->prepare($query);
    $stmt->bindValue(':search_term', '%' . $search_term . '%');
    $stmt->execute();
    $lieferanten = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $query = "SELECT l.*, COUNT(p.product_id) AS product_count
              FROM lieferanten l
              LEFT JOIN products_details p ON l.lieferant_name = p.company
              GROUP BY l.id";
    $stmt = $pdo->query($query);
    $lieferanten = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$lieferanten_count = count($lieferanten);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="lieferanten.css">
    <title>Lieferanten</title>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .add-lieferant a {
            text-decoration: none;
            background-color: #28a745;
            border-radius: 10px;
            color: white;
            transition: 0.3s;
            padding: 8px 15px;
        }

        .add-lieferant a:hover {
            background-color: #218838;
            border-radius: 20px;
        }

        .lieferanten-table {
            width: 100%;
        }

        #search_supplier {
            border-radius: 10px;
            margin-right: 10px;
            padding: 8px;
        }

        #search-btn {
            border-radius: 20px;
            width: 120px;
            font-weight: bold;
            transition: 0.3s;
        }

        #search-btn:hover {
            transform: translateY(1px);
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">Übersicht Lieferanten</h2>

    <!-- Suchformular -->
    <form action="" method="post" class="form-inline mb-4">
        <div class="form-group">
            <label for="search_supplier">Lieferant suchen:</label>
            <input type="text" name="search_supplier" id="search_supplier" placeholder="Lieferantenname" class="form-control">
        </div>
        <button id="search-btn" type="submit" class="btn btn-primary">Suchen</button>
    </form>

    <div class="add-lieferant mb-4">
        <a href="add_company.php" class="btn btn-success">Lieferant hinzufügen</a>
    </div>

    <!-- Anzeige der Anzahl der Lieferanten -->
    <p class="mb-4">Anzahl der Lieferanten: <?php echo $lieferanten_count; ?></p>

    <table class="table table-bordered lieferanten-table">
        <thead class="thead-dark">
        <tr>
            <th>Lieferantenname</th>
            <th>Anzahl der Produkte</th>
            <th>Produkte anzeigen</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($lieferanten as $lieferant): ?>
            <tr>
                <td><?php echo $lieferant['lieferant_name']; ?></td>
                <td><?php echo $lieferant['product_count']; ?></td>
                <td>
                    <form action="produkte.php" method="post">
                        <input type="hidden" name="selected_company" value="<?php echo $lieferant['lieferant_name']; ?>">
                        <button type="submit" class="btn btn-info">Produkte anzeigen</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>