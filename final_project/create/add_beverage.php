
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['bev_id'], $_POST['bev_name'], $_POST['bev_desc'], $_POST['bev_price'], $_POST['bev_size']];

    require_once '../connect.php';
    $sql = "INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES (?,?,?,?,?)";

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
        <title>Add Beverage</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Add Beverage</h1> 
        <h5>This interface allows staff members to add a beverage to the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Beverage ID</label>
                <input name="bev_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input name="bev_name" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <input name="bev_desc" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Price</label>
                <input name="bev_price" type="number" step="0.01" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Size</label>
                <input name="bev_size" type="number" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 