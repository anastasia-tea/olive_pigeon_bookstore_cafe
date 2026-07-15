
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['order_id'], $_POST['order_date'], $_POST['total_price'], $_POST['store_id'], $_POST['staff_id'], $_POST['customer_id']];

    require_once '../connect.php';
    $sql = "INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES (?,?,?,?,?,?)";

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
        <title>Add Order</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Add Order</h1> 
        <h5>This interface allows staff members to add a customer order to the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Order ID</label>
                <input name="order_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Order Date</label>
                <input name="order_date" type="date" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Total Price</label>
                <input name="total_price" type="number" step="0.01" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Store ID</label>
                <input name="store_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Staff ID</label>
                <input name="staff_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Customer ID</label>
                <input name="customer_id" type="number" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 