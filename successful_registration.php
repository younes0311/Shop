<?php
session_start();

// Prüfen, ob der Benutzer angemeldet ist
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

?>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="successful_registration.css">
    <title>Erfolgreiche Registrierung</title>
    <style>
        body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.success-container {
    text-align: center;
    max-width: 600px;
    margin: 100px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.success-container h2 {
    color: #28a745;
}

.success-container p {
    font-size: 18px;
    color: #333;
}

.success-container a {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.success-container a:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
    <div class="success-container">
        <h2>Erfolgreiche Registrierung</h2>
        <p>Willkommen, <?php echo $_SESSION['first_name']; ?>!</p>
        <a href="login.php">Zum einloggen</a>
    </div>
</body>
</html>
