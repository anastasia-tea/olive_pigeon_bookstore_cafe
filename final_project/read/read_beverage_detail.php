
<?php

require_once '../connect.php';

$q1 = "SELECT * FROM beverage_detail";
$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Read Beverage Details</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Beverage Details</h1> 
        <h5>This interface allows staff members to read beverage order details in the database.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>ID</th>
                    <th>Order Detail ID</th>
                    <th>Beverage ID</th>
                    <th>Milk ID</th>
                    <th>Syrup ID</th>
                    <th>Quantity</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($beverage_detail = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $beverage_detail["beverage_detail_id"];?></td>
                        <td><?php echo $beverage_detail["fk_order_detail_id"];?></td>
                        <td><?php echo $beverage_detail["fk_beverage_id"];?></td>
                        <td><?php echo $beverage_detail["fk_milk_id"];?></td>
                        <td><?php echo $beverage_detail["fk_syrup_id"];?></td>
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