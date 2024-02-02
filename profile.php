<?php
session_start();

// Überprüfe, ob die Sitzung gestartet wurde
if (!isset($_SESSION['user_id'])) {
    // Benutzer ist nicht angemeldet, leite zur Login-Seite weiter oder handle es entsprechend
    header("Location: login.php");
    exit();
}

include("db_connection.php");
include('header.php');

$user_id = $_SESSION['user_id'];

try {
    $stmt_get_user = $pdo->prepare("SELECT * FROM users_details WHERE user_id = :user_id");
    $stmt_get_user->bindParam(':user_id', $user_id);
    $stmt_get_user->execute();

    $user = $stmt_get_user->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        // Benutzer nicht gefunden
        echo "Benutzer nicht gefunden.";
        var_dump($_SESSION); // Debug-Ausgabe
        exit();
    }
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="profile.css">
    <title>Profil</title>
</head>
<body>
    <div class="container mt-5">
        <?php if ($user): ?>
            <h2 class="mb-4">Profil von <?php echo htmlspecialchars($user['first_name'] . ' ' . $user['last_name']); ?></h2>
            <p><i class="fas fa-envelope"></i> E-Mail: <?php echo htmlspecialchars($user['email']); ?></p>
            <!-- Weitere Benutzerinformationen hier einfügen -->

            <a class='btn btn-primary mr-2' href="edit_profile.php"><i class="fas fa-edit"></i> Profil bearbeiten</a>
            <a class='btn btn-danger' href="logout.php"><i class="fas fa-sign-out-alt"></i> Ausloggen</a>
        <?php else: ?>
            <p>Benutzer nicht gefunden.</p>
        <?php endif; ?>
    </div>

    <!-- Bootstrap JS und jQuery einbinden -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <?php include('footer.php');?>
</body>
</html>