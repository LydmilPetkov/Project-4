<?php
require_once 'db_connect.php';

$publisher_name = $_GET['publisher_name'];
$sql = "SELECT * FROM media WHERE publisher_name = '$publisher_name'";
$result = mysqli_query($conn, $sql);
$rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
$layout = '';

if (mysqli_num_rows($result) > 0) {
    foreach ($rows as $row) {
        $mediaType = strtolower($row['media_type']);
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
                        <a href='publisher.php?publisher_name={$row['publisher_name']}' class='text-decoration-underline text-muted'>
                            {$row['publisher_name']}
                        </a>
                    </p>
                    <p class='card-text'>Category: {$formattedType}s</p>
                </div>
                <div class='card-footer bg-transparent border-top-0 d-flex justify-content-between'>
                    <a href='details.php?id={$row['id']}' class='btn btn-outline-primary btn-lg'>Details</a>
                    <a href='index.php' class='btn btn-outline-secondary btn-lg'>← Back to Home</a>
                </div>
            </div>
        </div>";
    }
} else {
    $layout = "<p>No media found for this publisher.</p>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?= $publisher_name ?> Media</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <h1 class="text-center mb-4">Media from <?= $publisher_name ?></h1>
        <hr>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <?= $layout ?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>