<!DOCTYPE HTML>
<html>
    <head>
        <title> Caf&#233; | Olive Pigeon Bookstore Caf&#233;</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 

        <div class="container p-5"> 
        <h1>Olive Pigeon Bookstore Caf&#233;</h1> 
        <h5>Staff Dashboard - Caf&#233;</h5> 
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
                <!-- Pastry -->
                    <tr>
                        <th rowspan="4">PASTRY</th>
                        <td><a href="../create/add_pastry.php">Create</a></td>
                        <td>New pastry entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_pastry.php">Read</a></td>
                        <td>View pastry entry details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_pastry.php">Update</a></td>
                        <td>Edit existing pastry entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_pastry.php">Delete</a></td>
                        <td>Remove pastry entry</td>
                    </tr>

                <!-- Beverage -->
                    <tr>
                        <th rowspan="4">BEVERAGE</th>
                        <td><a href="../create/add_beverage.php">Create</a></td>
                        <td>New beverage entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_beverage.php">Read</a></td>
                        <td>View beverage entry details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_beverage.php">Update</a></td>
                        <td>Edit existing beverage entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_beverage.php">Delete</a></td>
                        <td>Remove beverage entry</td>
                    </tr>

                <!-- Milk -->
                    <tr>
                        <th rowspan="4">MILK</th>
                        <td><a href="../create/add_milk.php">Create</a></td>
                        <td>New milk type</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_milk.php">Read</a></td>
                        <td>View milk type details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_milk.php">Update</a></td>
                        <td>Edit milk type details</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_milk.php">Delete</a></td>
                        <td>Remove milk type</td>
                    </tr>

                <!-- Syruo -->
                    <tr>
                        <th rowspan="4">SYRUP</th>
                        <td><a href="../create/add_syrup.php">Create</a></td>
                        <td>New syrup type</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_syrup.php">Read</a></td>
                        <td>View syrup type details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_syrup.php">Update</a></td>
                        <td>Edit syrup type details</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_syrup.php">Delete</a></td>
                        <td>Remove syrup type</td>
                    </tr>

                <!-- Beverage Order Details -->
                    <tr>
                        <th rowspan="5">BEVERAGE DETAILS</th>
                        <td><a href="../create/add_beverage_detail.php">Create</a></td>
                        <td>New beverage detail entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_beverage_detail.php">Read</a></td>
                        <td>View beverage detail information</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/cafe_beverage_information.php">View</a></td>
                        <td>IN PROGRESS - View beverage orders with milk and syrup details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_beverage_detail.php">Update</a></td>
                        <td>Edit existing beverage order information</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_beverage_detail.php">Delete</a></td>
                        <td>Remove beverage detail entry</td>
                    </tr>
                    
                </tbody>
                </table>     

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 