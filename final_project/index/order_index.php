<!DOCTYPE HTML>
<html>
    <head>
        <title> Orders | Olive Pigeon Bookstore Caf&#233;</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 

        <div class="container p-5"> 
        <h1>Olive Pigeon Bookstore Caf&#233;</h1> 
        <h5>Staff Dashboard - Orders</h5> 
        <hr/>
       <table class="table">
                <thead>
                    <tr>
                    <th></th>
                    <th>Function</th>
                    <th>Description</th>
                    </tr>
                </thead>
                
                <tbody>
                <!-- Orders -->
                    <tr>
                        <th rowspan="5">ORDER</th>
                        <td><a href="../create/add_order.php">Create</a></td>
                        <td>New order entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_order.php">Read</a></td>
                        <td>View order information</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/orders_order_information.php">View</a></td>
                        <td>View orders with customer and staff information</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_order.php">Update</a></td>
                        <td>Edit existing order information</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_order.php">Delete</a></td>
                        <td>Remove order entry</td>
                    </tr>

                <!-- Order Details -->
                    <tr>
                        <th rowspan="5">ORDER DETAIL</th>
                        <td><a href="../create/add_order_detail.php">Create</a></td>
                        <td>New order detail entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_order_detail.php">Read</a></td>
                        <td>View order detail information</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/orders_details_categories.php">View</a></td>
                        <td>View order details by category</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_order_detail.php">Update</a></td>
                        <td>Edit existing order detail information</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_order_detail.php">Delete</a></td>
                        <td>Remove order detail entry</td>
                    </tr>

                <!-- Payment -->
                    <tr>
                        <th rowspan="4">PAYMENT</th>
                        <td><a href="../create/add_payment.php">Create</a></td>
                        <td>New payment entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_payment.php">Read</a></td>
                        <td>View payment information entry</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_payment.php">Update</a></td>
                        <td>Edit existing payment information entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_payment.php">Delete</a></td>
                        <td>Remove payment entry</td>
                    </tr>
                    
                </tbody>
                </table>     

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 