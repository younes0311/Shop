<?php include('admin_check.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Your Admin Panel</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>

<?php include("admin_header.php"); ?>

<div class="container-fluid mt-4">
    <div class="row">

        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="add_ad.php">
                            <i class="fas fa-plus fa-2x"></i> Add Ad
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ads_mng.php">
                            <i class="fas fa-cogs fa-2x"></i> Ads Management
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="all_categories.php">
                            <i class="fas fa-list fa-2x"></i> All Categories
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="category_create.php">
                            <i class="fas fa-folder-plus fa-2x"></i> Create Category
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lieferanten.php">
                            <i class="fas fa-truck fa-2x"></i> Suppliers
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="products_analyse.php">
                            <i class="fas fa-chart-bar fa-2x"></i> Products Analysis
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="products_mng.php">
                            <i class="fas fa-box fa-2x"></i> Products Management
                        </a>
                    </li>
                    <!-- Add similar links for other pages -->
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <!-- Your content goes here -->
        </main>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>