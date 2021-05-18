<?php 
    require_once "config.php"; 
    session_start();

    error_reporting(0);
    
    $error = '';
    if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])){
        $userID = trim($_POST["userID"]);
        $password = trim($_POST["password"]);

        if(empty($userID)){
            $error .= '<p class="on-error">Please enter your User ID!</p>';
        }

        if(empty($password)){
            $error .= '<p class="on-error">Please enter your Passowrd!</p>';
        }

        if(empty($error)){
            $md5Pasd = md5($password);
            echo $md5Pasd;
            $query = "SELECT * FROM users WHERE userid ='$userID' AND password='$md5Pasd'";

            $result = mysqli_query($db, $query );

            if($result->num_rows > 0){
                $row = mysqli_fetch_assoc($result);
                $_SESSION['username'] = $row['username'];
                $_SESSION['surname'] = $row['surname'];
                $_SESSION['userid'] = $row['userid'];
                $_SESSION['role'] = $row['role'];

                header("location: main.php");
            }

            
        } else {
            echo $error;
        }
        
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Online learning</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <?php include('login.php'); ?>
        </div>
    </body>
</html>