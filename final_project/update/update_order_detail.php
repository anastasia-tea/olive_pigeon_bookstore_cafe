
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['order_id'], $_POST['book_id'], $_POST['pastry_id'], $_POST['beverage_id'], $_POST['quantity_ordered'], $_POST['total_price'], $_POST['order_detail_id']];

    require_once '../connect.php';
    $sql = "UPDATE order_detail SET fk_order_id = ?, fk_book_id = ?, fk_pastry_id = ?, fk_beverage_id = ?, quantity_ordered = ?, detail_total_price = ? WHERE order_detail_id LIKE ?";

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
        <title>Update Order Details</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Update Order Details</h1> 
        <h5>This interface allows staff members to update customer order details in the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Order Details ID</label>
                <input name="order_detail_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Order ID</label>
                <input name="order_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Book ID</label>
                <input name="book_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Pastry ID</label>
                <input name="pastry_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Beverage ID</label>
                <input name="beverage_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Quantity Ordered</label>
                <input name="quantity_ordered" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Total Price</label>
                <input name="total_price" type="number" step="0.01" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 