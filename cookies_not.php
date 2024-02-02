<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.21.0/font/bootstrap-icons.css">
    <title>dein_titel</title>
    <style>
        /* Stil für die Cookie-Benachrichtigung */
        #cookie-notification {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #3498db; /* Blau */
            padding: 10px;
            color: #fff; /* Weiß */
            text-align: center;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: none;
        }

        #cookie-notification button {
            background-color: #fff;
            color: #3498db;
            border: 1px solid #3498db;
            padding: 5px 10px;
            margin-left: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- Cookie-Benachrichtigung -->
    <div id="cookie-notification">
        Diese Website verwendet Cookies, um sicherzustellen, dass du die beste Erfahrung auf unserer Website erhältst.
        <button id="accept-cookie-btn">Cookies akzeptieren</button>
    </div>

    <!-- Restlicher Header-Code -->
    <nav class="navbar navbar-expand-lg navbar-light" id="nav">
        <!-- ... (dein bestehender Header-Code) ... -->
    </nav>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // JavaScript für die Cookie-Benachrichtigung
        $(document).ready(function(){
            // Überprüfen, ob der Benutzer die Benachrichtigung bereits akzeptiert hat
            if (localStorage.getItem('cookieAccepted') !== 'true') {
                // Wenn nicht, zeige die Benachrichtigung an
                $('#cookie-notification').show();
            }

            // Event-Handler für den "Cookies akzeptieren"-Button
            $('#accept-cookie-btn').on('click', function(){
                // Speichere den Akzeptanz-Status in localStorage
                localStorage.setItem('cookieAccepted', 'true');
                // Verstecke die Benachrichtigung
                $('#cookie-notification').hide();
            });
        });
    </script>
</body>
</html>