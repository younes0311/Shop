<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Speichern Sie die URLs der Kategoriebilder in einer Datei oder Datenbank
    // Hier speichern wir sie einfach in einer Textdatei
    $category1 = $_POST['category_1'];
    $category2 = $_POST['category_2'];
    $category3 = $_POST['category_3'];
    $category4 = $_POST['category_4'];

    $content = "1,$category1\n2,$category2\n3,$category3\n4,$category4";

    file_put_contents('category_images.txt', $content);

    echo "Kategorie-Bilder wurden erfolgreich aktualisiert.";
} else {
    echo "Ungültige Anfrage.";
}
?>