
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['author_id'], $_POST['author_fname'], $_POST['author_initial'], $_POST['author_lname']];

    require_once '../connect.php';
    $sql = "INSERT INTO author (author_id, author_fname, author_initial, author_lname) VALUES (?,?,?,?)";

    $stmt = $conn->prepare($sql);
    if ($stmt->execute($user_data)) {
        echo "Row added";
    } else {
        echo "Error";
    }
}

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Add Author</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Add Author</h1> 
        <h5>This interface allows staff members to add a book's author to the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Author ID</label>
                <input name="author_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input name="author_fname" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Middle Initial</label>
                <input name="author_initial" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input name="author_lname" type="text" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 