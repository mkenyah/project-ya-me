<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Register.css">
    <title>Login</title>
</head>

<body>
    <form action="login.php" method="POST" class="Login_form" id="Login_form">
        <h1>Log In</h1>
        <input class="input" type="text" id="username" name="username" placeholder="UserName" required>
        <input class="input" type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Log in" class="login_button">
        <h5>Don't have an Account? <a href="./index.php">Register</a></h5>
    </form>

    <?php
    session_start();

    $servername = "localhost";
    $db_username = "root";
    $db_password = "";
    $dbname = "PROJECTLIGHT";


    $conn = new mysqli($servername, $db_username, $db_password, $dbname);


    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }


    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        if (!empty($_POST['username']) && !empty($_POST['password'])) {

            $login_username = $conn->real_escape_string($_POST['username']);
            $login_password = $_POST['password'];


            $sql = "SELECT * FROM users WHERE USER_NAME='$login_username'";
            $result = $conn->query($sql);

            //FETCHING THEM 
            if ($result && $result->num_rows > 0) {
                $row = $result->fetch_assoc();

                //INFO VERIFICATION

                if (password_verify($login_password, $row['PASSWORD'])) {
                    
                    $_SESSION['loggedin'] = true;

                    //WLECOME USERNAME
                    $_SESSION['username'] = $login_username;

                   echo"<h1>login succesful</h1>";

                    header("Location: dashboard.php");
                    
                    exit();
                } else {
                    //WHEN THE PASSWORD IS NOT MATCHING
                    echo "<p style='color:red;'>Incorrect password  OR username ⚠!! Please check and try again</p>";
                }
            } else {

                echo "<p class='errors' style='color:red; margin-bottom:270px; text-align:center'position: relative; left:20px;>Incorrect password  OR username ⚠!! Please check and try again</p>";
            }
        } else {
            echo "<p style='color:red;'>Please enter both username and password.</p>";
        }
    }

    $conn->close();
    ?>
</body>

</html>