
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['beverage_detail_id'], $_POST['order_detail_id'], $_POST['beverage_id'], $_POST['milk_id'], $_POST['syrup_id'], $_POST['quantity']];

    require_once '../connect.php';
    $sql = "INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES (?,?,?,?,?,?)";

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
        <title>Add Beverage Details</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Add Beverage Details</h1> 
        <h5>This interface allows staff members to add order details of beverages to the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Beverage Detail ID</label>
                <input name="beverage_detail_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Order Details ID</label>
                <input name="order_detail_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Beverage ID</label>
                <input name="beverage_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Milk ID</label>
                <input name="milk_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Syrup ID</label>
                <input name="syrup_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Quantity</label>
                <input name="quantity" type="number" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 