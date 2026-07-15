
<?php

require_once '../connect.php';

$q1 = "SELECT genre_name, COUNT(*) AS Count FROM book
INNER JOIN book_genre ON book_genre.fk_book_id = book.book_id
INNER join genre ON book_genre.fk_genre_id = genre.genre_id
GROUP BY genre_name
ORDER BY Count DESC";

$stmt1 = $conn->prepare($q1);
$stmt1->execute($i);

$q2 = "SELECT book_id, book_name, genre_name FROM book
INNER JOIN book_genre ON book_genre.fk_book_id = book.book_id
INNER join genre ON book_genre.fk_genre_id = genre.genre_id
WHERE genre_name != 'nonfiction' AND genre_name != 'fiction'
ORDER BY genre_name";

$stmt2 = $conn->prepare($q2);
$stmt2->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title> Genre List | Read Author of Book</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Author of Book - Genre List</h1> 
        <h5>This interface allows staff members to read the list of books with their genres.</h5> 
        <hr/>
        <br><br>
        <h5>Genre Count</h5>
        <table class="table">
                <thead>
                    <tr>
                    <th>Genre Name</th>
                    <th>Count</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($book_genre = $stmt1->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $book_genre["genre_name"];?></td>
                        <td><?php echo $book_genre["Count"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            
            <h5>Book Genres</h5>
            <table class="table">
                <thead>
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Genre Name</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($book_genre = $stmt2->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $book_genre["book_id"];?></td>
                        <td><?php echo $book_genre["book_name"];?></td>
                        <td><?php echo $book_genre["genre_name"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 