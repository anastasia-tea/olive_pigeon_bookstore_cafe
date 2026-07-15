
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['payment_date'], $_POST['payment_amount'], $_POST['payment_type'], $_POST['order_id'], $_POST['staff_id'], $_POST['customer_id'], $_POST['payment_id']];

    require_once '../connect.php';
    $sql = "UPDATE payment SET payment_name = ?, payment_amount = ?, payment_type = ?, fk_order = ?, fk_staff_id = ?, fk_customer_id = ? WHERE payment_id LIKE ?";

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
        <title>Update Payment</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Update Payment</h1> 
        <h5>This interface allows staff members to update order payment details in the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Payment ID</label>
                <input name="payment_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Payment Date</label>
                <input name="payment_date" type="date" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Payment Amount</label>
                <input name="payment_amount" type="number" step="0.01"  class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Payment Type</label>
                <input name="payment_type" type="text"  class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Order ID</label>
                <input name="order_Id" type="number" class="form-control">
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