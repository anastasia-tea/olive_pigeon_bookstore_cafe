
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['customer_fname'], $_POST['customer_initial'], $_POST['customer_lname'], $_POST['customer_email'], $_POST['customer_phone'], $_POST['store_id'], $_POST['customer_id']];

    require_once '../connect.php';
    $sql = "UPDATE customer SET customer_fname = ?, customer_initial = ?, customer_lname = ?, customer_email = ?, customer_phone = ?, fk_store_id = ? WHERE customer_id LIKE ?";

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
        <title>Update Customer</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 
    <div class="container p-5"> 
        <h1>Update Customer</h1> 
        <h5>This interface allows staff members to update a customer profile in the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Customer ID</label>
                <input name="customer_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input name="customer_fname" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Middle Initial</label>
                <input name="author_initial" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input name="customer_lname" type="text" class="form-control">
            </div>
           <div class="mb-3">
                <label class="form-label">Email</label>
                <input name="customer_email" type="email" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input name="customer_phone" type="tel" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Store ID</label>
                <input name="store_id" type="number" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 