<?php
session_start();
include_once "db_connection.php";
include('header.php');

// Überprüfe, ob das Formular abgeschickt wurde
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Hole E-Mail-Adresse und Passwort aus dem Formular
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Überprüfe die Anmeldedaten in der Datenbank
    $statement = $pdo->prepare("SELECT * FROM users_details WHERE email = :email");
    $statement->execute(['email' => $email]);
    $user = $statement->fetch(PDO::FETCH_ASSOC);

    // Überprüfe, ob ein Benutzer mit den angegebenen Anmeldedaten gefunden wurde
    if ($user && password_verify($password, $user['password'])) {
        // Benutzer erfolgreich angemeldet
        // Hier könntest du Session-Variablen setzen oder andere Aktionen durchführen

        // Set session variables
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['email'] = $user['email'];

        // Setze die neue Session in der Datenbank
        $sessionId = uniqid(); // Eindeutige session_id generieren
        $userId = $user['user_id'];
        $lastActivity = time();

        // Überprüfe vor dem Einfügen auf Existenz der session_id
        $stmtCheck = $pdo->prepare("SELECT * FROM user_sessions WHERE session_id = ?");
        $stmtCheck->execute([$sessionId]);

        if ($stmtCheck->rowCount() == 0) {
            // Die session_id existiert noch nicht, also füge sie hinzu
            $stmtInsert = $pdo->prepare("INSERT INTO user_sessions (session_id, user_id, last_activity) VALUES (?, ?, ?)");
            $stmtInsert->execute([$sessionId, $userId, $lastActivity]);
        } else {
            // Die session_id existiert bereits
            // Hier kannst du entscheiden, wie du damit umgehen möchtest
        }

        // Setze session cookie lifetime (z.B. 7 Tage)
        $sessionLifetime = 7 * 24 * 60 * 60; // 7 Tage in Sekunden

        // Überprüfe, ob "Angemeldet bleiben" aktiviert ist
        $rememberMe = isset($_POST['remember']) ? true : false;

        // Setze session cookie lifetime basierend auf "Angemeldet bleiben" Checkbox
        $sessionLifetime = $rememberMe ? $sessionLifetime : 0; // 0 bedeutet, bis der Browser geschlossen wird

        // Setze session cookie parameters

        // Überprüfe, ob der Benutzer ein Administrator ist
        if ($user['is_admin'] == 1) {
            // Weiterleitung zum Admin-Bereich
            echo '<script>window.location.href = "admin.php";</script>';
            exit();
        } else {
            // Weiterleitung zum Benutzerprofil
            echo '<script>window.location.href = "profile.php";</script>';
            exit();
        }
    } else {
        // Fehlermeldung, wenn die Anmeldedaten nicht korrekt sind
        $error = "E-Mail-Adresse oder Passwort ungültig.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 100px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .login-header {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #007bff;
        }

        .login-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .brand-logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .brand-logo img {
            max-width: 100%;
            height: auto;
        }

        .form-check-label {
            cursor: pointer;
        }
    </style>
    <title>Login</title>
</head>
<body>

<div class="container">
    <div class="login-container">
        <div class="brand-logo">
            <img src="your_logo.png" alt="Your Logo">
        </div>

        <?php if (isset($error)): ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <div class="login-header">
            Login
        </div>

        <form action="login.php" method="post">
            <div class="form-group">
                <label for="email">E-Mail-Adresse:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Passwort:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="showPassword" onclick="togglePassword()">
                <label class="form-check-label" for="showPassword">Passwort anzeigen</label>
            </div>

            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="remember" name="remember">
                <label class="form-check-label" for="remember">Angemeldet bleiben</label>
            </div>

            <button type="submit" class="btn btn-primary btn-block login-btn">Einloggen</button>

            <p class="register-link">Noch kein Konto? <a href="register.php">Registrieren</a></p>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function togglePassword() {
        var passwordInput = document.getElementById("password");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }
</script>
  <?php include('footer.php');?>
</body>
</html>