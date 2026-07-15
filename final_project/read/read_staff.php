
<?php

require_once '../connect.php';

$q1 = "SELECT * FROM staff";
$stmt = $conn->prepare($q1);
$stmt->execute($i);

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Read Staff</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
    <div class="container p-5"> 
        <h1>Read Staff</h1> 
        <h5>This interface allows staff members to read staff information in the database.</h5> 
        <hr/>
        <br><br>
        <table class="table">
                <thead>
                    <tr>
                    <th>ID</th>
                    <th>Last Name</th>
                    <th>Middle Intial</th>
                    <th>First Name</th>
                    <th>Email Address</th>
                    <th>Phone Number</th>
                    <th>Job Title</th>
                    <th>Hourly Wage</th>
                    <th>Store ID</th>
                    </tr>
                </thead>
                
                <tbody>
                <?php

                    while($staff = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr>
                        <td><?php echo $staff["staff_id"];?></td>
                        <td><?php echo $staff["staff_lname"];?></td>
                        <td><?php echo $staff["staff_initial"];?></td>
                        <td><?php echo $staff["staff_fname"];?></td>
                        <td><?php echo $staff["staff_email"];?></td>
                        <td><?php echo $staff["staff_phone"];?></td>
                        <td><?php echo $staff["staff_job_title"];?></td>
                        <td><?php echo $staff["staff_hourly_wage"];?></td>
                        <td><?php echo $staff["fk_store_id"];?></td>
                    </tr>
    
                <?php
                    } ?>

                </tbody>
                </table>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 