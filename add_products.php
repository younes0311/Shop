<?php
include_once "db_connection.php";
include('admin_check.php');
include("admin_header.php");

// Fehlermeldung initialisieren
$error_message = "";

// Überprüfen, ob das Formular abgeschickt wurde
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Formulardaten validieren und sicherstellen, dass keine leeren Felder vorhanden sind
    $product_name = trim($_POST["product_name"]);
    $company = trim($_POST["company"]);
    $cpi = trim($_POST["cpi"]);
    $category = isset($_POST["category"]) ? implode(', ', $_POST["category"]) : '';
    $quantity = trim($_POST["quantity"]);
    $type_number = trim($_POST["type_number"]);
    $status = $_POST["status"];
    $description = trim($_POST["description"]); // Neu hinzugefügt
    $brand = trim($_POST["brand"]); // Neu hinzugefügt

    // Überprüfen, ob Bilder ausgewählt wurden
    if (!empty($_FILES['images']['name'][0])) {
        $uploadedImages = array();

        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $targetPath = "uploads/" . basename($_FILES['images']['name'][$key]);

            // Überprüfen, ob das Bild erfolgreich hochgeladen wurde
            if (move_uploaded_file($tmp_name, $targetPath)) {
                $uploadedImages[] = $targetPath; // Füge den Dateipfad in das Array ein
            } else {
                $error_message = "Fehler beim Hochladen einer der Dateien.";
                break; // Breche die Schleife ab, wenn ein Fehler auftritt
            }
        }

        // Verwende das erste hochgeladene Bild als first_picture
        $first_picture = $uploadedImages[0];
        array_shift($uploadedImages); // Entferne das erste Bild aus dem Array
    } else {
        $error_message = "Bitte wählen Sie mindestens ein Bild aus.";
    }

    // Wenn keine Fehler aufgetreten sind, Daten in die Datenbank einfügen und weiterleiten
    if (empty($error_message)) {
        try {
            // SQL-Statement vorbereiten und Daten in die Tabelle "product_details" einfügen
            $stmt = $pdo->prepare("INSERT INTO products_details (product_name, company, cpi, quantity, type_number, category, first_picture, status, description, brand, lieferant_preis, unser_preis, profit, created_at) 
                                VALUES (:product_name, :company, :cpi, :quantity, :type_number, :category, :first_picture, :status, :description, :brand, :lieferant_preis, :unser_preis, :profit, CURRENT_TIMESTAMP)");

            $stmt->bindParam(':product_name', $product_name);
            $stmt->bindParam(':company', $company);
            $stmt->bindParam(':cpi', $cpi);
            $stmt->bindParam(':quantity', $quantity);
            $stmt->bindParam(':type_number', $type_number);
            $stmt->bindParam(':category', $category);
            $stmt->bindParam(':first_picture', $first_picture);
            $stmt->bindParam(':status', $status);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':brand', $brand);

            // Füge zusätzlich die Werte für Lieferantenpreis, unser Preis und Gewinn hinzu
            $lieferant_preis = trim($_POST["lieferant_preis"]);
            $unser_preis = trim($_POST["unser_preis"]);
            $profit = $unser_preis - $lieferant_preis;

            $stmt->bindParam(':lieferant_preis', $lieferant_preis);
            $stmt->bindParam(':unser_preis', $unser_preis);
            $stmt->bindParam(':profit', $profit);

            $stmt->execute();

            // ...

            // Holen Sie sich die ID des zuletzt eingefügten Produkts
            $lastProductId = $pdo->lastInsertId();

            // Bilder in einer separaten Tabelle "products_images" speichern
            foreach ($uploadedImages as $imagePath) {
                $stmtImages = $pdo->prepare("INSERT INTO products_images (product_id, image_path) VALUES (:product_id, :image_path)");
                $stmtImages->bindParam(':product_id', $lastProductId);
                $stmtImages->bindParam(':image_path', $imagePath);
                $stmtImages->execute();
            }

            // Weiterleitung zur Erfolgsseite
            header("Location: erfolg_fügen.php");
            exit();
        } catch (PDOException $e) {
            $error_message = "Fehler beim Einfügen des Produkts: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="add_products.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin-top: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .error-message {
            color: #dc3545;
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 1rem;
            margin-bottom: 5px;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .checkbox-label {
            margin-right: 15px;
            font-size: 0.9rem;
            display: block;
        }

        .custom-form-label {
            font-size: 1rem;
            margin-bottom: 5px;
            display: block;
        }

        .custom-form-input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            resize: none;
        }

        .form-button {
            padding: 10px;
            font-size: 1rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #0056b3;
        }

        .image-preview {
            margin-top: 20px;
        }

        .thumbnail-container {
            display: flex;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        .thumbnail {
            width: 100px;
            cursor: pointer;
            border-radius: 8px;
            margin-right: 10px;
            margin-bottom: 10px;
            transition: transform 0.3s;
        }

        .thumbnail:hover {
            transform: scale(1.1);
        }

        .selected {
            border: 2px solid #007bff;
        }

        .close-btn {
            display: block;
            width: 20px;
            height: 20px;
            background-color: #dc3545;
            color: #fff;
            text-align: center;
            line-height: 20px;
            border-radius: 50%;
            cursor: pointer;
            position: absolute;
            top: 5px;
            right: 5px;
        }

        /* Neuer Stil für den Output-Bereich */
        .output-container {
            margin-top: 20px;
        }

        .output-label {
            font-size: 1rem;
            margin-bottom: 5px;
        }

        .output-result {
            font-size: 1rem;
            font-weight: bold;
            color: #28a745;
        }
    </style>

    <title>Produkt hinzufügen</title>
</head>

<body>

    <div class="container">
        <h2>Produkt hinzufügen</h2>

        <?php if (!empty($error_message)): ?>
            <p class="error-message"><?php echo $error_message; ?></p>
        <?php endif; ?>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="product_name" class="form-label">Produktname:</label>
                <input type="text" name="product_name" class="form-control" required>
            </div>


            <div class="form-group">
                <label for="company" class="form-label">Unternehmen:</label>
                <select name="company" class="form-control" required>
                    <?php
                    // Verbindung zur Datenbank herstellen
                    include_once "db_connection.php";

                    // SQL-Abfrage, um alle Lieferanten zu holen
                    $stmt = $pdo->query("SELECT * FROM lieferanten");
                    $companies = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    // Optionen für die Auswahlliste erstellen
                    foreach ($companies as $companyOption) {
                        echo "<option value='" . $companyOption['lieferant_name'] . "'>" . $companyOption['lieferant_name'] . "</option>";
                    }
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label for="cpi" class="form-label">CPI:</label>
                <input type="text" name="cpi" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="quantity" class="form-label">Menge:</label>
                <input type="number" name="quantity" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="type_number" class="form-label">Typennummer:</label>
                <input type="text" name="type_number" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="category" class="form-label">Kategorie:</label>
                <?php
                // Verbindung zur Datenbank herstellen
                include_once "db_connection.php";

                // SQL-Abfrage, um alle Kategorien zu holen
                $stmt = $pdo->query("SELECT * FROM categories");
                $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // Optionen für die Auswahlliste erstellen
                foreach ($categories as $categoryOption) {
                    echo "<label class='checkbox-label'><input type='checkbox' name='category[]' value='" . $categoryOption['category_name'] . "'>" . $categoryOption['category_name'] . "</label>";
                }
                ?>
            </div>

            <div class="form-group">
                <label for="description" class="custom-form-label">Beschreibung:</label>
                <textarea name="description" class="custom-form-input" rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label for="brand" class="form-label">Brand:</label>
                <input type="text" name="brand" class="form-control" required>
            </div>


<div class="form-group">
    <label for="lieferant_preis" class="form-label">Verkaufspreis des Lieferanten:</label>
    <input type="text" name="lieferant_preis" class="form-control" required>
</div>

<div class="form-group">
    <label for="unser_preis" class="form-label">Unser Verkaufspreis:</label>
    <input type="text" name="unser_preis" class="form-control" required>
</div>

<div id="gewinnOutput" class="form-group"></div>

            <div class="form-group">
                <label for="status" class="form-label">Status:</label>
                <select name="status" class="form-control" required>
                    <option value="online">Online</option>
                    <option value="offline">Offline</option>
                </select>
            </div>

            <div class="form-group">
                <label for="images" class="form-label">Bilder hochladen:</label>
                <input type="file" name="images[]" class="form-control" accept="image/*" multiple required>
            </div>

            <div class="image-preview"></div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary form-button">Produkt hinzufügen</button>
            </div>
        </form>

        <!-- ... (vorheriger HTML-Bereich) ... -->

    </div>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const lieferantPreisInput = document.querySelector('input[name="lieferant_preis"]');
    const unserPreisInput = document.querySelector('input[name="unser_preis"]');
    const gewinnOutput = document.querySelector('#gewinnOutput');

    // Event Listener für Änderungen in den Eingabefeldern
    lieferantPreisInput.addEventListener('input', updateGewinn);
    unserPreisInput.addEventListener('input', updateGewinn);

    // Funktion zur Aktualisierung des Gewinns
    function updateGewinn() {
        const lieferantPreis = parseFloat(lieferantPreisInput.value) || 0;
        const unserPreis = parseFloat(unserPreisInput.value) || 0;

        const gewinn = unserPreis - lieferantPreis;

        // Aktualisiere das Gewinn-Output-Feld
        gewinnOutput.textContent = `Gewinn: ${gewinn.toFixed(2)} €`;
    }
});
</script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const inputImages = document.querySelector('input[name="images[]"]');
            const imagePreviewContainer = document.querySelector('.image-preview');
            const imageOverlay = document.getElementById('imageOverlay');
            const largeImage = document.getElementById('largeImage');
            let firstPictureIndex = 0;

            inputImages.addEventListener('change', function () {
                displayImagePreview(this);
            });

            function displayImagePreview(input) {
                imagePreviewContainer.innerHTML = '';

                if (input.files && input.files.length > 0) {
                    for (let i = 0; i < input.files.length; i++) {
                        const reader = new FileReader();
                        const imgContainer = document.createElement('div');
                        const img = document.createElement('img');
                        const closeBtn = document.createElement('span');

                        reader.onload = function (e) {
                            img.src = e.target.result;

                            img.addEventListener('click', function () {
                                selectFirstPicture(this, i);
                            });

                            img.addEventListener('dblclick', function () {
                                showLargeImage(this);
                            });

                            closeBtn.innerHTML = '&times;';
                            closeBtn.className = 'close-btn';
                            closeBtn.addEventListener('click', function () {
                                removeImage(imgContainer, i);
                            });

                            if (i === firstPictureIndex) {
                                img.classList.add('selected');
                            }

                            imgContainer.appendChild(img);
                            imgContainer.appendChild(closeBtn);
                            imagePreviewContainer.appendChild(imgContainer);
                        };

                        reader.readAsDataURL(input.files[i]);
                    }
                }
            }

        function selectFirstPicture(selectedImg, index) {
            const prevSelectedImg = document.querySelector('.image-preview img.selected');
            if (prevSelectedImg) {
                prevSelectedImg.classList.remove('selected');
            }

            selectedImg.classList.add('selected');
            firstPictureIndex = index;
        }

        function showLargeImage(img) {
            largeImage.src = img.src;
            imageOverlay.style.display = 'block';
        }

        function removeImage(imgContainer, index) {
            // Entferne das Bild und den Container
            imgContainer.remove();

            // Falls das entfernte Bild das ausgewählte "first_picture" war, setze den Index zurück
            if (index === firstPictureIndex) {
                firstPictureIndex = 0;
            }
        }

        imageOverlay.addEventListener('click', function () {
            imageOverlay.style.display = 'none';
        });
    });
</script>

</body>

</html>