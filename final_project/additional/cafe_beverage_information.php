
<?php

require_once '../connect.php';

$q1 = "SELECT beverage_detail_id, fk_order_id, order_detail_id, beverage_name, milk_name, syrup_name, quantity
FROM beverage_detail
INNER JOIN order_detail ON order_detail.order_detail_id = beverage_detail.fk_order_detail_id
INNER JOIN beverage ON order_detail.fk_beverage_id = beverage.beverage_id
LEFT JOIN milk ON beverage_detail.fk_milk_id = milk.milk_id
LEFT JOIN syrup ON beverage_detail.fk_syrup_id = syrup.syrup_id
ORDER BY beverage_detail_id";
$stmt1 = $conn->prepare($q1);
$stmt1->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Beverage Order Details | Read Order</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Order - Beverage Order Details</h1> 
        <h5>This interface allows staff members to read cafe order information.</h5> 
        <hr/>
        <br><br>
        <h5>Beverage Details</h5>
        <table class="table">
                <thead>
                    <tr>
                    <th>Beverage Detail ID</th>
                    <th>Order ID</th>
                    <th>Order Detail ID</th>
                    <th>Beverage Name</th>
                    <th>Milk Name</th>
                    <th>Syrup Name</th>
                    <th>Quantity</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($beverage_detail = $stmt1->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $beverage_detail["beverage_detail_id"];?></td>
                        <td><?php echo $beverage_detail["fk_order_id"];?></td>
                        <td><?php echo $beverage_detail["order_detail_id"];?></td>
                        <td><?php echo $beverage_detail["beverage_name"];?></td>
                        <td><?php echo $beverage_detail["milk_name"];?></td>
                        <td><?php echo $beverage_detail["syrup_name"];?></td>
                        <td><?php echo $beverage_detail["quantity"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 