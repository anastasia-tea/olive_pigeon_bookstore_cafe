
<?php

if(isset($_POST["submit"])) {

    $user_data = [$_POST['staff_id'], $_POST['staff_fname'], $_POST['staff_initial'], $_POST['staff_lname'], $_POST['staff_email'], $_POST['staff_phone'], $_POST['staff_job_title'], $_POST['staff_hourly_wage'], $_POST['store_id']];

    require_once '../connect.php';
    $sql = "INSERT INTO staff (staff_id, staff_fname, staff_initial, staff_lname, staff_email, staff_phone, staff_job_title, staff_hourly_wage, fk_store_id) VALUES (?,?,?,?,?,?,?,?,?)";

    $stmt = $conn->prepare($sql);
    if ($stmt->execute($user_data)) {
        echo "Row added";
    } else {
        echo "Error";
    }
}

?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Add Staff Member</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body> 
    <div class="container p-5"> 
        <h1>Add Staff Member </h1> 
        <h5>This interface allows staff members to add a new staff member account to the database.</h5> 
        <hr/>
        <br><br>
        <form method="POST" action="#">
            <div class="mb-3">
                <label class="form-label">Staff ID</label>
                <input name="staff_id" type="number" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input name="staff_fname" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Middle Initial</label>
                <input name="staff_initial" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input name="staff_lname" type="text" class="form-control">
            </div>
           <div class="mb-3">
                <label class="form-label">Email</label>
                <input name="staff_email" type="email" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input name="staff_phone" type="tel" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Job Title</label>
                <input name="staff_job_title" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Hourly Wage</label>
                <input name="staff_hourly_wage" type="number" step="0.01" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Store ID</label>
                <input name="store_id" type="number" class="form-control">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </form>
            

    </div>  
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html> 