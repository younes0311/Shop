<?php
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

// Überprüfen, ob eine Produkt-ID übergeben wurde
if (isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];

    // Produktinformationen aus der Datenbank abrufen
    $stmt = $pdo->prepare("SELECT * FROM products_details WHERE product_id = :product_id");
    $stmt->bindParam(':product_id', $product_id);
    $stmt->execute();
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

    // Überprüfen, ob das Produkt gefunden wurde
    if (!$product) {
        echo "Produkt nicht gefunden.";
        exit();
    }
} else {
    echo "Ungültige Anfrage.";
    exit();
}

// Lieferanten aus der Datenbank abrufen
$lieferantenQuery = "SELECT lieferant_name FROM lieferanten";
$lieferantenStmt = $pdo->query($lieferantenQuery);
$lieferanten = $lieferantenStmt->fetchAll(PDO::FETCH_ASSOC);

// Kategorien aus der Datenbank abrufen
$categoriesQuery = "SELECT category_name FROM categories";
$categoriesStmt = $pdo->query($categoriesQuery);
$categories = $categoriesStmt->fetchAll(PDO::FETCH_ASSOC);

// Verarbeiten des Formulars, wenn es abgeschickt wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Hier kannst du die Aktualisierung der Produktinformationen implementieren

    // Bild hochladen
    $newImage = $_FILES['new_image'];

    // Überprüfen, ob ein neues Bild hochgeladen wurde
    if ($newImage['size'] > 0) {
        $uploadDir = 'uploads'; // Verzeichnis für Uploads
        $uploadFile = $uploadDir . basename($newImage['name']);

        // Bild in das Upload-Verzeichnis verschieben
        if (move_uploaded_file($newImage['tmp_name'], $uploadFile)) {
            // Erfolgreich hochgeladen
            $newImagePath = $uploadFile;
        } else {
            // Fehler beim Hochladen
            echo "Fehler beim Hochladen des Bildes.";
            exit();
        }
    } else {
        // Wenn kein neues Bild hochgeladen wurde, behalte das vorhandene Bild
        $newImagePath = $product['first_picture'];
    }

    // Produktinformationen aktualisieren
    $newProductName = $_POST['new_product_name'];
    $newUnserPreis = $_POST['new_unser_preis'];
    $newLieferantPreis = $_POST['new_lieferant_preis'];

    // Hier kannst du die Logik für die Berechnung des Gewinns implementieren
    $profit = $newUnserPreis - $newLieferantPreis;

    $updateStmt = $pdo->prepare("UPDATE products_details SET 
                                product_name = :product_name,
                                unser_preis = :unser_preis,
                                lieferant_preis = :lieferant_preis,
                                profit = :profit,
                                first_picture = :first_picture
                                WHERE product_id = :product_id");

    $updateStmt->bindParam(':product_name', $newProductName);
    $updateStmt->bindParam(':unser_preis', $newUnserPreis);
    $updateStmt->bindParam(':lieferant_preis', $newLieferantPreis);
    $updateStmt->bindParam(':profit', $profit);
    $updateStmt->bindParam(':first_picture', $newImagePath);
    $updateStmt->bindParam(':product_id', $product_id);

    if ($updateStmt->execute()) {
        // Nach der Aktualisierung zur Verwaltungsseite weiterleiten
        header("Location: products_mng.php");
        exit();
    } else {
        echo "Fehler beim Aktualisieren des Produkts.";
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="edit_product.css"> <!-- Stelle sicher, dass die Datei edit_product.css korrekt eingebunden ist -->
    <title>Produkt bearbeiten</title>
</head>

<body>

    <div class='container'>
        <h2>Produkt bearbeiten</h2>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"] . "?product_id=" . $product_id); ?>" method="post"
            class="product-form" enctype="multipart/form-data">
            <div class="form-group">
                <label for="new_product_name">Neuer Produktname:</label>
                <input type="text" name="new_product_name" class="form-control"
                    value="<?php echo htmlspecialchars($product['product_name']); ?>" required>
            </div>

            <div class="form-group">
                <label for="new_unser_preis">Unser neuer Preis:</label>
                <input type="text" name="new_unser_preis" class="form-control"
                    value="<?php echo htmlspecialchars($product['unser_preis']); ?>" required>
            </div>

            <div class="form-group">
                <label for="new_lieferant_preis">Lieferanten-Preis:</label>
                <input type="text" name="new_lieferant_preis" class="form-control"
                    value="<?php echo htmlspecialchars($product['lieferant_preis']); ?>" required>
            </div>

            <div class="form-group">
                <label for="profit">Profit:</label>
                <input type="text" name="profit" class="form-control"
                    value="<?php echo htmlspecialchars($product['profit']); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="new_company">Neues Unternehmen:</label>
                <select name="new_company" class="form-control" required>
                    <?php foreach ($lieferanten as $lieferant): ?>
                    <option value="<?php echo $lieferant['lieferant_name']; ?>"
                        <?php echo ($product['company'] == $lieferant['lieferant_name']) ? 'selected' : ''; ?>>
                        <?php echo $lieferant['lieferant_name']; ?>
                    </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="new_cpi">Neuer CPI:</label>
                <input type="text" name="new_cpi" class="form-control"
                    value="<?php echo htmlspecialchars($product['cpi']); ?>" required>
            </div>

        <div class="form-group">
    <label for="new_category">Neue Kategorie:</label>
    <div class="input-group">
        <input type="text" id="search_category" name="search_category" class="form-control"
            placeholder="Kategorie suchen" value="<?php echo htmlspecialchars($searchedCategory); ?>">
        <div class="input-group-append">
            <button type="button" class="btn btn-outline-secondary" onclick="searchCategories()">
                Suchen
            </button>
        </div>
    </div>
    <select name="new_category" id="new_category" class="form-control" required>
        <?php foreach ($categories as $category): ?>
        <option value="<?php echo $category['category_name']; ?>"
            <?php echo ($product['category'] == $category['category_name'] || $searchedCategory == $category['category_name']) ? 'selected' : ''; ?>>
            <?php echo $category['category_name']; ?>
        </option>
        <?php endforeach; ?>
    </select>
</div>

            <div class="form-group">
                <label for="new_quantity">Neue Menge:</label>
                <input type="number" name="new_quantity" class="form-control"
                    value="<?php echo htmlspecialchars($product['quantity']); ?>" required>
            </div>

            <div class="form-group">
                <label for="new_description">Neue Beschreibung:</label>
                <textarea name="new_description" class="form-control" rows="4"
                    required><?php echo htmlspecialchars($product['description']); ?></textarea>
            </div>

            <div class="form-group">
                <label for="new_image">Neues Produktbild:</label>
                <input type="file" name="new_image" class="form-control" accept="image/*">
            </div>

            <button type="submit" class="btn btn-primary">Produkt aktualisieren</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const lieferantPreisInput = document.querySelector('input[name="new_lieferant_preis"]');
            const unserPreisInput = document.querySelector('input[name="new_unser_preis"]');
            const profitOutput = document.querySelector('input[name="profit"]');

            // Event Listener für Änderungen in den Eingabefeldern
            lieferantPreisInput.addEventListener('input', updateProfit);
            unserPreisInput.addEventListener('input', updateProfit);

            // Funktion zur Aktualisierung des Profits
            function updateProfit() {
                const lieferantPreis = parseFloat(lieferantPreisInput.value) || 0;
                const unserPreis = parseFloat(unserPreisInput.value) || 0;

                const profit = unserPreis - lieferantPreis;

                // Aktualisiere das Profit-Output-Feld
                profitOutput.value = profit.toFixed(2);
            }
        });
    </script>
</body>

</html>