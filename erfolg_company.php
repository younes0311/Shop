<?php include('admin_check.php');  ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erfolg_hinzufuegen.php</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50;
        }
        p {
            margin-bottom: 20px;
        }
        button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lieferant erfolgreich hinzugefügt!</h1>
        <p>Ihr neuer Lieferant wurde erfolgreich zur Datenbank hinzugefügt.</p>
        <button onclick="window.location.href='lieferanten.php'">Zu den Lieferanten</button>
        <button onclick="window.location.href='add_company.php'">Lieferant hinzufügen</button>
    </div>
</body>
</html>