<?php
// Connecting to the database
require_once 'db_connect.php';

// Setting the layout variable
$layout = '';

// Check if a search term is provided
if (isset($_GET['search']) && !empty(trim($_GET['search']))) {
    $search = $_GET['search'];
    $sql = "SELECT * FROM media WHERE 
            title LIKE '%$search%' OR 
            author_first_name LIKE '%$search%' OR 
            author_last_name LIKE '%$search%'";
} else {
    $sql = "SELECT * FROM media";
}

// pushing the go button
$result = mysqli_query($conn, $sql);
// get all results as an associative array
$rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
// Loop through the results
if (mysqli_num_rows($result) > 0) {
    foreach ($rows as $row) {
        $mediaType = strtolower($row['media_type']); # Get the media type (cd or book or dvd)
        // switch to make certain letters uppercase
        switch ($mediaType) {
            case 'book':
                $formattedType = 'Book';
                break;
            case 'cd':
                $formattedType = 'CD';
                break;
            case 'dvd':
                $formattedType = 'DVD';
                break;
            default:
                $formattedType = ucfirst($mediaType);
        }

        $layout .= "<div class='col mb-4'>
            <div class='card h-100 card shadow-lg'>
                <img src='{$row['image']}' class='card-img-top media-image {$mediaType}' alt='{$row['title']}'>
                <div class='border-top m-4 mb-2'></div>
                <div class='card-body'>
                    <h5 class='card-title'>{$row['title']}</h5>
                    <p class='card-text'>Published on: {$row['publish_date']}</p>
                    <p class='card-text'>
                        Published by:
                        <a href='publisher.php?publisher_name=" . urlencode($row['publisher_name']) . "' class='text-decoration-underline text-muted'>
                            {$row['publisher_name']}
                        </a>
                    </p>
                    <p class='card-text'>Category: {$formattedType}s</p>
                </div>
                <div class='card-footer bg-transparent border-top-0 d-flex justify-content-between'>
                    <a href='details.php?id={$row['id']}' class='btn btn-primary btn-lg'>Details</a>
                    <a href='mediaType.php?media_type={$mediaType}' class='btn btn-warning btn-lg'>Category</a>
                </div>
            </div>
        </div>";
    }
} else {
    $layout = "<p>No media found.</p>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>All Media</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Some additional styling for the images to look better in the cards -->
    <style>
        .media-image.book,
        .media-image.dvd {
            width: 100%;
            height: 70%;
            object-fit: contain;
        }

        .media-image.cd {
            width: 100%;
            aspect-ratio: 1 / 1;
            object-fit: cover;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">All Media</h1>
        <hr>
        <div class="d-flex justify-content-between">
            <!-- Add new media button -->
            <div class="mb-3">
                <a href="create.php" class="btn btn-success btn-lg">+ Add New Media</a>
            </div>
            <!-- Search Form -->
            <form method="GET" class="mb-4">
                <div class="input-group">
                    <input type="text" name="search" class="form-control form-control-lg" placeholder="Search by title or author..." value="<?= isset($_GET['search']) ? $_GET['search'] : '' ?>">
                    <button class="btn btn-outline-secondary btn-lg" type="submit">Search</button>
                </div>
            </form>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <?= $layout ?>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>