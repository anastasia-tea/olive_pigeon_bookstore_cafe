
<?php

require_once '../connect.php';

$q1 = "SELECT book_id, book_name, publisher_name FROM book
INNER JOIN book_publisher ON book_publisher.fk_book_id = book.book_id
INNER join publisher ON book_publisher.fk_publisher_id = publisher.publisher_id
ORDER BY publisher_name";

$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title> Publisher List | Read Publisher of Book</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Publisher of Book - Publisher List</h1> 
        <h5>This interface allows staff members to read the list of books with their publishers.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Publisher Name</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($book_publisher = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $book_publisher["book_id"];?></td>
                        <td><?php echo $book_publisher["book_name"];?></td>
                        <td><?php echo $book_publisher["publisher_name"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 