<?php

require_once 'db_connect.php';
// the function for creating a random ISBN code
function generateISBN($length = 10)
{
    $isbn = '';
    for ($i = 0; $i < $length; $i++) {
        $isbn .= rand(0, 9);
    }
    return $isbn;
}
// The function mysqli_real_escape_string() is used to prevent SQL injection from the user input and also allows special characters to be used in the input
if (isset($_POST['create'])) {
    $title = mysqli_real_escape_string($conn, $_POST['title']);
    $image = mysqli_real_escape_string($conn, $_POST['image']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $media_type = mysqli_real_escape_string($conn, $_POST['media_type']);
    $author_first_name = mysqli_real_escape_string($conn, $_POST['author_first_name']);
    $author_last_name = mysqli_real_escape_string($conn, $_POST['author_last_name']);
    $publisher_name = mysqli_real_escape_string($conn, $_POST['publisher_name']);
    $publisher_address = mysqli_real_escape_string($conn, $_POST['publisher_address']);
    $publish_date = mysqli_real_escape_string($conn, $_POST['publish_date']);
    $isbn_code = generateISBN();

    $sql = "INSERT INTO `media` 
        (`isbn_code`, `title`, `image`, `description`, `media_type`, `author_first_name`, `author_last_name`, `publisher_name`, `publisher_address`, `publish_date`) 
            VALUES 
        ('$isbn_code', '$title', '$image', '$description', '$media_type', '$author_first_name', '$author_last_name', '$publisher_name', '$publisher_address', '$publish_date')";

    if (mysqli_query($conn, $sql)) {
        echo "<div class='alert alert-success' role='alert'>
                <h4 class='alert-heading'>Product has been created Successfully!</h4>
                <hr>
                <p class='mb-0'>You will be redirected to the main page in a moment!</p>
            </div>";
        header("refresh:3; index.php");
    } else {
        echo "<div class='alert alert-danger' role='alert'>
                <h4 class='alert-heading'>Oops, something went wrong, please try again later!</h4>
                <p></p>
            </div>";
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <title>Document</title>
</head>

<body>
    <div class="container">
        <h1 class="text-center my-5">Create a product</h1>
        <hr>
        <form method="post">
            <label for="title">Title</label>
            <input type="text" class="form-control my-3" name="title" id="title" required>

            <label for="image">Image</label>
            <input type="text" class="form-control my-3" name="image" id="image">

            <label for="description">Description</label>
            <textarea type="text" class="form-control my-3" name="description" id="description" required></textarea>

            <label for="media_type">Media Type</label>
            <select class="form-control my-3" name="media_type" id="media_type" required>
                <option value="">-- Select Type --</option>
                <option value="book">Book</option>
                <option value="cd">CD</option>
                <option value="dvd">DVD</option>
            </select>

            <label for="author_first_name">Author first name</label>
            <input type="text" class="form-control my-3" name="author_first_name" id="author_first_name" required>

            <label for="author_last_name">Author last name</label>
            <input type="text" class="form-control my-3" name="author_last_name" id="author_last_name">

            <label for="publisher_name">Publisher name</label>
            <input type="text" class="form-control my-3" name="publisher_name" id="publisher_name" required>

            <label for="publisher_address">Address of publisher</label>
            <input type="text" class="form-control my-3" name="publisher_address" id="publisher_address">

            <label for="publish_date">Date Published</label>
            <input type="date" class="form-control my-3" name="publish_date" id="publish_date" required>

            <input type="submit" name="create" id="create" class="btn btn-primary mt-3" value="Create">
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>

</html>