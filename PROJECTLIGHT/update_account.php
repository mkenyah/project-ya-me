<?php
session_start();

// Database connection
$servername = "localhost";
$dbname = "PROJECTLIGHT";
$dbusername = "root";
$dbpassword = "";

// Create connection
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the user is logged in
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SESSION['username'])) {
    $full_name = $_POST['full_name'];
    $email = $_POST['email'];
    $contact = $_POST['contact'];
    $username = $_SESSION['username']; // Username from session

    // Update the user's details
    $sql = "UPDATE users SET FULL_NAME = ?, EMAIL = ?, CONTACT = ? WHERE USER_NAME = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('ssss', $full_name, $email, $contact, $username);

    if ($stmt->execute()) {
        // Redirect to myaccount.php with a success message
        $_SESSION['success_message'] = "Account updated successfully!";
        header("Location: myaccount.php");
        exit();
    } else {
        echo "Error updating account: " . $conn->error;
    }
} else {
    // Redirect to login if the user is not logged in or invalid request
    header("Location: login.php");
    exit();
}
?>
