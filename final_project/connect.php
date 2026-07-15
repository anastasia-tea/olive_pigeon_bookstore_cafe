
<?php
$server = 'localhost'; // change if your server is remote
$username = 'ana'; // Enter your username
$password = 'abc'; // Enter your username
$database = 'bookstore_cafe'; // Enter your database name you want to access

try { // Try the following code
    $conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
} catch (PDOException $e) { //If try doesn't work, run the code in catch
    die("Connection failed: " . $e->getMessage());
}
?>