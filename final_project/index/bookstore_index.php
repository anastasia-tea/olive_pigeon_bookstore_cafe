<!DOCTYPE HTML>
<html>
    <head>
        <title> Bookstore | Olive Pigeon Bookstore Caf&#233;</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 

        <div class="container p-5"> 
        <h1>Olive Pigeon Bookstore Caf&#233;</h1> 
        <h5>Staff Dashboard - Bookstore</h5> 
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
                <!-- Book -->
                    <tr>
                        <th rowspan="5">BOOK</th>
                        <td><a href="../create/add_book.php">Create</a></td>
                        <td>New book entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_book.php">Read</a></td>
                        <td>View book entry details</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/bookstore_count.php">View</a></td>
                        <td>View book quantity details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_book.php">Update</a></td>
                        <td>Edit existing book entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_book.php">Delete</a></td>
                        <td>Remove book entry</td>
                    </tr>

                <!-- Author -->
                    <tr>
                        <th rowspan="4">AUTHOR</th>
                        <td><a href="../create/add_author.php">Create</a></td>
                        <td>New author entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_author.php">Read</a></td>
                        <td>View author entry details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_author.php">Update</a></td>
                        <td>Edit existing author entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_author.php">Delete</a></td>
                        <td>Remove author entry</td>
                    </tr>

                <!-- Book's Author -->
                    <tr>
                        <th rowspan="4">AUTHOR OF BOOK</th>
                        <td><a href="../create/adds_book_author.php">Create</a></td>
                        <td>New author-book link</td>
                    </tr>
                    <tr>
                        <td><a href="../read/reads_book_author.php">Read</a></td>
                        <td>View author-book links</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/bookstore_author.php">View</a></td>
                        <td>View books listed with authors</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/deletes_book_author.php">Delete</a></td>
                        <td>Remove author-book link</td>
                    </tr>

                <!-- Genre -->
                    <tr>
                        <th rowspan="4">GENRE</th>
                        <td><a href="../create/add_genre.php">Create</a></td>
                        <td>New genre entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_genre.php">Read</a></td>
                        <td>View genre entry details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_genre.php">Update</a></td>
                        <td>Edit existing genre entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_genre.php">Delete</a></td>
                        <td>Remove genre entry</td>
                    </tr>

                <!-- Book's Genre -->
                    <tr>
                        <th rowspan="4">GENRE OF BOOK</th>
                        <td><a href="../create/adds_book_genre.php">Create</a></td>
                        <td>New genre-book link</td>
                    </tr>
                    <tr>
                        <td><a href="../read/reads_book_genre.php">Read</a></td>
                        <td>View genre-book links</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/bookstore_genre.php">View</a></td>
                        <td>View books listed with genres</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/deletes_book_genre.php">Delete</a></td>
                        <td>Remove genre-book link</td>
                    </tr>

                <!-- Publisher -->
                    <tr>
                        <th rowspan="4">PUBLISHER</th>
                        <td><a href="../create/add_publisher.php">Create</a></td>
                        <td>New publisher entry</td>
                    </tr>
                    <tr>
                        <td><a href="../read/read_publisher.php">Read</a></td>
                        <td>View publisher entry details</td>
                    </tr>
                    <tr>
                        <td><a href="../update/update_publisher.php">Update</a></td>
                        <td>Edit existing publisher entry</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/delete_publisher.php">Delete</a></td>
                        <td>Remove publisher entry</td>
                    </tr>

                <!-- Book's Publisher -->
                    <tr>
                        <th rowspan="4">PUBLISHER OF BOOK</th>
                        <td><a href="../create/adds_book_publisher.php">Create</a></td>
                        <td>New publisher-book link</td>
                    </tr>
                    <tr>
                        <td><a href="../read/reads_book_publisher.php">Read</a></td>
                        <td>View publisher-book links</td>
                    </tr>
                    <tr>
                        <td><a href="../additional/bookstore_publisher.php">View</a></td>
                        <td>View books listed with publishers</td>
                    </tr>
                    <tr>
                        <td><a href="../delete/deletes_book_publisher.php">Delete</a></td>
                        <td>Remove publisher-book link</td>
                    </tr>
                    
                </tbody>
                </table>     

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 