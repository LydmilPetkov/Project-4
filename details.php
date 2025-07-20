<?php

require_once 'db_connect.php';

$id = $_GET['id'];
$sql = "SELECT * FROM media WHERE id = $id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
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

$layout = "
<div class='container my-5'>
    <a href='index.php' class='btn btn-outline-secondary mb-4'>← Back to Home</a>

    <div class='row g-4'>
        <div class='col-md-5 text-center'>
            <img src='{$row['image']}' class='img-fluid media-image {$mediaType}' alt='{$row['title']}'>
        </div>

        <div class='col-md-7'>
            <h2 class='mb-3 fs-3'>{$row['title']}</h2>
            <p><span class='label'>Category:</span> {$row['media_type']}</p>
            <p><span class='label'>Published on:</span> {$row['publish_date']}</p>
            <p><span class='label'>Author:</span> {$row['author_first_name']} {$row['author_last_name']}</p>
            <p><span class='label'>Publisher:</span> {$row['publisher_name']}</p>";

if (!empty($row['publisher_address'])) {
    $layout .= "<p><span class='label'>Publisher Address:</span> {$row['publisher_address']}</p>";
}

$layout .= "
            <p><span class='label'>ISBN:</span> {$row['isbn_code']}</p>
            <hr>
            <p><span class='label fs-5'>Description:</span><br><br>{$row['description']}</p>
            <div class='mt-4'>
                <a href='mediaType.php?media_type={$row['media_type']}' class='btn btn-warning me-2'>More " . $formattedType . "s</a>
            </div>
        </div>
    </div>
</div>";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <title><?= $row['title'] ?></title>
</head>

<body>
    <div class="container">
        <h1 class="text-center my-5 fs-1"><?= $row['title'] ?></h1>
        <hr>
        <div class="row row-cols-1"><?= $layout ?></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>