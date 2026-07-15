
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['publisher_name'], $_POST['publisher_id']];

    require_once '../connect.php';
    $sql = "UPDATE publisher SET publisher_name = ? WHERE publisher_id LIKE ?";

    $stmt = $conn->prepare($sql);
    if ($stmt->execute($user_data)) {
        echo "Row updated";
    } else {
        echo "Error";
    }
}

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Update Publisher</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Update Publisher</h1> 
        <h5>This interface allows staff members to update a book publisher in the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Publisher ID</label>
                <input name="publisher_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input name="publisher_name" type="text" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 