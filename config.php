<?php
    $host = "127.0.0.1";
    $username = "root";
    $pass = "";
    $db = mysqli_connect($host, $username, $pass, "online_learning_db");

    if(!$db == true)
    {
        mysql_close($db);
    }
    else
    {
       // echo "Success";
    }
?>
