<?php
session_start();
include_once "db_connection.php";

$first_name = isset($_POST['first_name']) ? $_POST['first_name'] : "";
$last_name = isset($_POST['last_name']) ? $_POST['last_name'] : "";
$email = isset($_POST['email']) ? $_POST['email'] : "";
$subscribe_newsletter = isset($_POST['subscribe_newsletter']) ? 1 : 0;
$error_message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    try {
        // Überprüfen, ob die E-Mail-Adresse bereits existiert
        $stmt_check_email = $pdo->prepare("SELECT user_id FROM users_details WHERE email = :email");
        $stmt_check_email->bindParam(':email', $email);
        $stmt_check_email->execute();

        if ($stmt_check_email->rowCount() > 0) {
            $error_message = "Die E-Mail-Adresse ist bereits vergeben.";
        } else {
            // Einfügen des neuen Benutzers in die Datenbank
            $stmt_insert_user = $pdo->prepare("INSERT INTO users_details (first_name, last_name, email, password) VALUES (:first_name, :last_name, :email, :password)");
            $stmt_insert_user->bindParam(':first_name', $first_name);
            $stmt_insert_user->bindParam(':last_name', $last_name);
            $stmt_insert_user->bindParam(':email', $email);
            $stmt_insert_user->bindParam(':password', $password);
            $stmt_insert_user->execute();

            // Erfolgreiche Registrierung, Session setzen und Cookie erstellen
            $_SESSION['user_id'] = $pdo->lastInsertId();
            setcookie("user_id", $_SESSION['user_id'], time() + (86400 * 30), "/");

            // Hinzufügen des Benutzers zur shop_cart und wishlist
            $user_id = $_SESSION['user_id'];
            $stmt_insert_cart = $pdo->prepare("INSERT INTO shop_cart (user_id) VALUES (:user_id)");
            $stmt_insert_cart->bindParam(':user_id', $user_id);
            $stmt_insert_cart->execute();

            $stmt_insert_wishlist = $pdo->prepare("INSERT INTO wishlist (user_id) VALUES (:user_id)");
            $stmt_insert_wishlist->bindParam(':user_id', $user_id);
            $stmt_insert_wishlist->execute();

            // Weiterleitung zur Profilseite
            header("Location: profile.php");
            exit();
        }
    } catch (PDOException $e) {
        die("Fehler bei der Registrierung: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
    <style>
        body {
            background-color: #f8f9fa;
        }

        #box {
            max-width: 800px;
            margin: auto;
            margin-top: 50px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        #img-haver img {
            max-width: 100%;
            height: auto;
        }

        #hi-register {
            margin-top: 20px;
            font-size: 16px;
            color: #555;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }

        #form-div {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
        }

        #register-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #register-btn:hover {
            background-color: #0056b3;
        }
    </style>
    <title>Registrierung</title>
</head>
<body>
    <?php include('header.php'); ?>

    <div id='box'>
        <div id='mini-box'>
            <div id='img-haver'><img src="register-foto.jpg" alt=""></div>
            <div id='hi-register'>
                <p>
                    Registriere dich bei Arosax und erlebe die Bequemlichkeit eines eigenen Kundenkontos! Nutze deinen Warenkorb und Merkzettel von überall aus. Verpasse keine Angebote, Trends und Aktionen.
                </p>
            </div>
            <?php if ($error_message): ?>
                <p class="error"><?php echo $error_message; ?></p>
            <?php endif; ?>
            <div id='form-div'>
                <form action="register.php" method="post">
                    <div class="form-group">
                        <label for="first_name">Vorname:</label>
                        <input type="text" class="form-control" id="first_name" name="first_name" required value="<?php echo htmlspecialchars($first_name); ?>">
                    </div>

                    <div class="form-group">
                        <label for="last_name">Nachname:</label>
                        <input type="text" class="form-control" id="last_name" name="last_name" required value="<?php echo htmlspecialchars($last_name); ?>">
                    </div>

                    <div class="form-group">
                        <label for="email">E-Mail:</label>
                        <input type="email" class="form-control" id="email" name="email" required value="<?php echo htmlspecialchars($email); ?>">
                    </div>

                    <div class="form-group">
                        <label for="password">Passwort:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <button type="submit" class="btn btn-primary" id='register-btn'>Registrieren</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <?php include('footer.php');?>
</body>
</html>