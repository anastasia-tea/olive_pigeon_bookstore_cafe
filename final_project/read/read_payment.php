
<?php

require_once '../connect.php';

$q1 = "SELECT * FROM payment";
$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Read Payment</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Payment</h1> 
        <h5>This interface allows staff members to read payment information in the database.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Payment Type</th>
                    <th>Order ID</th>
                    <th>Staff ID</th>
                    <th>Customer ID</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($payment = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $payment["payment_id"];?></td>
                        <td><?php echo $payment["payment_date"];?></td>
                        <td><?php echo $payment["payment_amount"];?></td>
                        <td><?php echo $payment["payment_type"];?></td>
                        <td><?php echo $payment["fk_order"];?></td>
                        <td><?php echo $payment["fk_staff_id"];?></td>
                        <td><?php echo $payment["fk_customer_id"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 