<!DOCTYPE HTML>
<html>
    <head>
        <title> Accounts | Olive Pigeon Bookstore Caf&#233;</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 

        <div class="container p-5"> 
        <h1>Olive Pigeon Bookstore Caf&#233;</h1> 
        <h5>Staff Dashboard - Accounts</h5> 
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
                <!-- Customer -->
                    <tr>
                        <th rowspan="5">CUSTOMER</th>
                        <td><a href="../create/add_customer.php">Create</a></td>
                        <td>New customer account</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_customer.php">Read</a></td>
                        <td>View customer account</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/account_customer_alphabet.php">View</a></td>
                        <td>View customer accounts in alphabetical order</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_customer.php">Update</a></td>
                        <td>Edit existing customer account</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_customer.php">Delete</a></td>
                        <td>Remove customer account</td>
                    </tr>

                <!-- Staff -->
                    <tr>
                        <th rowspan="5">STAFF</th>
                        <td><a href="../create/add_staff.php">Create</a></td>
                        <td>New staff account</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_staff.php">Read</a></td>
                        <td>View staff account</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/account_staff_job.php">View</a></td>
                        <td>View staff accounts ordered by job title</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_staff.php">Update</a></td>
                        <td>Edit existing staff account</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_staff.php">Delete</a></td>
                        <td>Remove staff account</td>
                    </tr>

                <!-- Store -->
                    <tr>
                        <th rowspan="4">STORE</th>
                        <td><a href="../create/add_store.php">Create</a></td>
                        <td>New store record</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_store.php">Read</a></td>
                        <td>View store record</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_store.php">Update</a></td>
                        <td>Edit existing store record</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_store.php">Delete</a></td>
                        <td>Remove store record</td>
                    </tr>
                    
                </tbody>
                </table>     

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 