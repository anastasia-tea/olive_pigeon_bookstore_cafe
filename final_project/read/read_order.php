
<?php

require_once '../connect.php';

$q1 = "SELECT * FROM orders";
$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Read Order</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Order</h1> 
        <h5>This interface allows staff members to read order information in the database.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Ttotal Price</th>
                    <th>Store ID</th>
                    <th>Staff ID</th>
                    <th>Customer ID</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($orders = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $orders["order_id"];?></td>
                        <td><?php echo $orders["order_date"];?></td>
                        <td><?php echo $orders["order_total_price"];?></td>
                        <td><?php echo $orders["fk_store_id"];?></td>
                        <td><?php echo $orders["fk_staff_id"];?></td>
                        <td><?php echo $orders["fk_customer_id"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 