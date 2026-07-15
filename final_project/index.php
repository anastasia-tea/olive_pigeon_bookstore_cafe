<!DOCTYPE HTML>
<html>
    <head>
        <title>Olive Pigeon Bookstore Caf&#233;</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 

        <div class="container p-5"> 
        <h1>Olive Pigeon Bookstore Caf&#233;</h1> 
        <h5>Staff Dashboard - Home</h5> 
        <hr/>
       <table class="table">
                <thead>
                    <tr>
                    <th></th>
                    <th>Database</th>
                    <th>Description</th>
                    </tr>
                </thead>
                
                <tbody>
                <!-- Accounts -->
                    <tr>
                        <th rowspan="3"><a href="index/account_index.php">ACCOUNTS</a></th>
                        <td>Customer</td>
                        <td>Accounts of registered customers</td>
                    </tr>
                    <tr>
                        <td>Staff</td>
                        <td>Accounts of staff members at the store</td>
                    </tr>
                    <tr>
                        <td>Store</td>
                        <td>Different store locations</td>
                    </tr>

                <!-- Orders -->
                    <tr>
                        <th rowspan="3"><a href="index/order_index.php">ORDERS</a></th>
                        <td>Order</td>
                        <td>Information on completed customer orders</td>
                    </tr>
                    <tr>
                        <td>Order Detail</td>
                        <td>Details of completed orders, including a breakdown of purchases</td>
                    </tr>
                    <tr>
                        <td>Payment</td>
                        <td>Details of customer payments for store orders</td>
                    </tr>

                <!-- Bookstore -->
                    <tr>
                        <th rowspan="4"><a href="index/bookstore_index.php">BOOKSTORE</a></th>
                        <td>Book</td>
                        <td>Information on books in the store's inventory</td>
                    </tr>
                    <tr>
                        <td>Author</td>
                        <td>Details about authors of books</td>
                    </tr>
                    <tr>
                        <td>Genre</td>
                        <td>Details about genres of books</td>
                    </tr>
                    <tr>
                        <td>Publisher</td>
                        <td>Details about publishers of books</td>
                    </tr>

                <!-- Cafe &#233; &#201; -->
                    <tr>
                        <th rowspan="4"><a href="index/cafe_index.php">CAF&#201;</a></th>
                        <td>Pastry</td>
                        <td>Information about caf&#233; pastries</td>
                    </tr>
                    <tr>
                        <td>Beverage</td>
                        <td>Information about caf&#233; beverages</td>
                    </tr>
                    <tr>
                        <td>Milk</td>
                        <td>Different types of milk for caf&#233; beverages</td>
                    </tr>
                    <tr>
                        <td>Syrup</td>
                        <td>Different types of syrup for caf&#233; beverages</td>
                    </tr>
                    
                </tbody>
                </table>     

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 