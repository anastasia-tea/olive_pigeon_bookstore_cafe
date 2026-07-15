
<?php

require_once '../connect.php';

$q1 = "SELECT book_id, book_name, author_lname, author_fname FROM book
INNER JOIN book_author ON book_author.fk_book_id = book.book_id
INNER join author ON book_author.fk_author_id = author.author_id
ORDER BY author_lname";

$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title> Author List | Read Author of Book</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Author of Book - Author List</h1> 
        <h5>This interface allows staff members to read the list of books with their authors.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Author Last Name</th>
                    <th>Author First Name</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($book_author = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $book_author["book_id"];?></td>
                        <td><?php echo $book_author["book_name"];?></td>
                        <td><?php echo $book_author["author_lname"];?></td>
                        <td><?php echo $book_author["author_fname"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 