
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['book_id'], $_POST['book_name'], $_POST['book_quantity'], $_POST['book_price'], $_POST['book_isbn'], $_POST['book_pub']];

    require_once '../connect.php';
    $sql = "INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES (?,?,?,?,?,?)";

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
        <title>Add Book</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Add Book</h1> 
        <h5>This interface allows staff members to add a book to the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Book ID</label>
                <input name="book_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input name="book_name" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Quantity in Stock</label>
                <input name="book_quantity" type="number" class="form-control">
            </div>
           <div class="mb-3">
                <label class="form-label">Price of Book</label>
                <input name="book_price" type="number" step="0.01" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">ISBN</label>
                <input name="book_isbn" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Publication Date</label>
                <input name="book_pub" type="date" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 