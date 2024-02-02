<?php include('admin_check.php');  ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erfolg_delete_product.php</title>
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
            color: #FF5733;
        }
        img {
            max-width: 100px;
            max-height: 100px;
            margin-top: 10px;
        }
        p {
            margin: 20px 0;
        }
        button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #FF5733;
            color: #fff;
            border: none;
            border-radius: 5px;
        }
        button:hover {
            background-color: #E74C3C;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Produkt erfolgreich gelöscht!</h1>
        <button onclick="window.location.href='products_mng.php'">Zu den Produkten</button>
        <button onclick="window.location.href='all_categories.php'">zu den Categories</button>
    </div>
</body>
</html>