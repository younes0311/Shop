<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.21.0/font/bootstrap-icons.css">
    <title>dein_titel</title>
    <style>
        #nav {
            background-color: #3498db; /* Blau */
            padding: 15px 20px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        #nav a {
            text-decoration: none;
            color: #fff; /* Weiß */
            margin-right: 20px;
        }

        #nav .navbar-brand {
            font-size: 24px;
            color: #fff; /* Weiß */
        }

        #status-indicator {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 5px;
        }

        /* Stil für den grünen Kreis (eingeloggt) */
        #status-indicator.logged-in {
            background-color: #2ecc71; /* Grün */
        }

        /* Stil für den roten Kreis (nicht eingeloggt) */
        #status-indicator.not-logged-in {
            background-color: #e74c3c; /* Rot */
        }

        .nav-link i {
            margin-right: 5px;
            font-size: 20px;
        }

        .search-form {
            display: flex;
            align-items: center;
        }

        .search-input {
            flex: 1;
        }

        .search-label {
            color: #fff;
            margin-right: 10px;
        }

        .search-btn {
            background-color: #fff;
            color: #3498db;
            border: 1px solid #3498db;
        }

        @media (max-width: 768px) {
            #nav {
                padding: 10px 15px;
            }

            #nav a {
                margin-bottom: 10px;
            }

            #nav .navbar-brand {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" id="nav">
        <a class="navbar-brand" href="#">dein_titel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.php"><i class="bi bi-house-door"></i>Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.php"><i class="bi bi-person"></i>Mein Konto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.php"><i class="bi bi-cart"></i>Warenkorb</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="wishlist.php"><i class="bi bi-heart"></i>Wünschliste</a>
                </li>
            </ul>

            <form class="form-inline my-2 my-lg-0 search-form" action="user_search.php" method="GET">
                <input class="form-control mr-sm-2 search-input" type="text" name="search_query" id="search_query" placeholder="Suchen...">
                <button class="btn btn-outline-light my-2 my-sm-0 search-btn" type="submit">Suchen</button>
            </form>
    
        </div>
    </nav>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>