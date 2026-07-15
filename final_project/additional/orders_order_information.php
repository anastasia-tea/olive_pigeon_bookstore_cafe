
<?php

require_once '../connect.php';

$q1 = "SELECT orders.order_id, orders.order_date, staff.staff_lname, staff.staff_fname, customer.customer_lname, customer.customer_fname
FROM orders
INNER JOIN staff ON orders.fk_staff_id = staff.staff_id
INNER JOIN customer ON orders.fk_customer_id = customer.customer_id
ORDER BY order_id";
$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Order Information | Read Order</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Order - Order Information</h1> 
        <h5>This interface allows staff members to read order information including staff and customer names in the database.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Staff Last Name</th>
                    <th>Staff First Name</th>
                    <th>Customer Last Name</th>
                    <th>Customer First Name</th>

                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($orders = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $orders["order_id"];?></td>
                        <td><?php echo $orders["order_date"];?></td>
                        <td><?php echo $orders["staff_lname"];?></td>
                        <td><?php echo $orders["staff_fname"];?></td>
                        <td><?php echo $orders["customer_lname"];?></td>
                        <td><?php echo $orders["customer_fname"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 