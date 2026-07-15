
<?php

require_once '../connect.php';


$q1 = "SELECT fk_order_id, order_detail_id, fk_book_id, book_name, quantity_ordered, detail_total_price
FROM order_detail
INNER JOIN book ON book.book_id = order_detail.fk_book_id
WHERE fk_book_id != 'NULL' OR fk_book_id != '0'
ORDER BY fk_order_id";
$stmt1 = $conn->prepare($q1);
$stmt1->execute($i);

$q2 = "SELECT fk_order_id, order_detail_id, fk_pastry_id, pastry_name, quantity_ordered, detail_total_price
FROM order_detail
INNER JOIN pastry ON pastry.pastry_id = order_detail.fk_pastry_id
WHERE fk_pastry_id != 'NULL'
ORDER BY fk_order_id";
$stmt2 = $conn->prepare($q2);
$stmt2->execute($i);

$q3 = "SELECT fk_order_id, order_detail_id, fk_beverage_id, beverage_name, quantity_ordered, detail_total_price
FROM order_detail
INNER JOIN beverage ON beverage.beverage_id = order_detail.fk_beverage_id
WHERE fk_beverage_id != 'NULL'
ORDER BY fk_order_id";
$stmt3 = $conn->prepare($q3);
$stmt3->execute($i);


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
        <h5>This interface allows staff members to read order information focusing on book, pastry, and cafe orders.</h5> 
        <hr/>
        <br><br>
        <h5>Books</h5>
        <table class="table">
                <thead>
                    <tr>
                    <th>Order ID</th>
                    <th>Order Detail ID</th>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Quantity Ordered</th>
                    <th>Total Price</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($orders = $stmt1->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $orders["fk_order_id"];?></td>
                        <td><?php echo $orders["order_detail_id"];?></td>
                        <td><?php echo $orders["fk_book_id"];?></td>
                        <td><?php echo $orders["book_name"];?></td>
                        <td><?php echo $orders["quantity_ordered"];?></td>
                        <td><?php echo $orders["detail_total_price"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>

            <h5>Pastries</h5>
            <table class="table">
                <thead>
                    <tr>
                    <th>Order ID</th>
                    <th>Order Detail ID</th>
                    <th>Pastry ID</th>
                    <th>Pastry Name</th>
                    <th>Quantity Ordered</th>
                    <th>Total Price</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($orders = $stmt2->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $orders["fk_order_id"];?></td>
                        <td><?php echo $orders["order_detail_id"];?></td>
                        <td><?php echo $orders["fk_pastry_id"];?></td>
                        <td><?php echo $orders["pastry_name"];?></td>
                        <td><?php echo $orders["quantity_ordered"];?></td>
                        <td><?php echo $orders["detail_total_price"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>

            <h5>Beverages</h5>
            <table class="table">
                <thead>
                    <tr>
                    <th>Order ID</th>
                    <th>Order Detail ID</th>
                    <th>Beverage ID</th>
                    <th>Beverage Name</th>
                    <th>Quantity Ordered</th>
                    <th>Total Price</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($orders = $stmt3->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $orders["fk_order_id"];?></td>
                        <td><?php echo $orders["order_detail_id"];?></td>
                        <td><?php echo $orders["fk_beverage_id"];?></td>
                        <td><?php echo $orders["beverage_name"];?></td>
                        <td><?php echo $orders["quantity_ordered"];?></td>
                        <td><?php echo $orders["detail_total_price"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 