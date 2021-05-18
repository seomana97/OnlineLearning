<?php
    require_once "config.php"; 

    session_start();
    $_SESSION['URL'] = "https://".$_SERVER['HTTP_HOST'];

    $modules = array();
    $mlesson = array();
    $assessments = array();
    $_SESSION['module'] = '';
    if(!isset($_SESSION['username'])){
        header("location: index.php");
    }

    $uid = trim($_SESSION['userid']);

    $query = "SELECT * FROM student_modules WHERE userid ='$uid'";
    $result = mysqli_query($db, $query );
    
    if($result->num_rows > 0){
        while ($row = mysqli_fetch_array($result)) { 
            array_push($modules, $row['module_code']);
        }
    }

    $query = "SELECT * FROM lesson";
    $result = mysqli_query($db, $query );
    
    if($result->num_rows > 0){
        while ($row = mysqli_fetch_array($result)) { 
            $mlesson[$row['mcode']] = $row;
        }
    }

    $query = "SELECT * FROM assessment";
    $result = mysqli_query($db, $query );
    
    if($result->num_rows > 0){
        while ($row = mysqli_fetch_array($result)) { 
            $assessments[] = $row;
        }
    }

    if(isset($_POST['module'])){
        $_SESSION['module'] = $_POST['module'];
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Online learning: main</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="wrapper">
            <header class="top-bar js-top-bar top-bar__network">
                <?php 
                    echo "
                        <span class='username'>Welcome " .$_SESSION['username']. ", ". $_SESSION['surname'] . "</span>
                        <span><a href='logout.php'>logout</a></span>
                        ";
                
                ?>

                <div class="menu">
                    <span class="menu-icon"></span>
                    <ul class="dropdown-content">
                    
                    </ul>
                </div>
            </header>

            <section class="content">
                <div class="content-item-01">
                    <button class="accordion">Modules</button>
                    <form method="post" class="panel">
                            <?php 
                                foreach ($modules as $data) {
                                    echo "<button class='action-button' id='module' name='module' value='$data'>" .$data. "</button>"; 
                                }
                            ?>
                        
                            </form>
                   
                    <button class="accordion">Personal Information</button>
                    <div class="panel">
                        <p>Personal info to go here</p>
                    </div>

                    <button class="accordion">Academic record</button>
                    <div class="panel">
                        <p>Academic record to go here</p>
                    </div>
                    
                </div>
                <ul class="tabs">
                    <li class="tab">
                        <input type="radio" name="tabs" checked="checked" id="tab1" />
                        <label for="tab1">Lesson</label>
                        <div id="tab-content1" class="content">
                        <?php
                            echo "
                                <p>".$mlesson[$_SESSION['module']][0]."</p>
                                <h1>".$mlesson[$_SESSION['module']][1]."</h1><br/>
                                <video controls=''  name='media'>
                                    <source src='".$_SESSION['URL'].$mlesson[$_SESSION['module']][3]."' type='video/mp4'>
                                </video>
                                <p>".$mlesson[$_SESSION['module']][2]."</p>
                            ";
                        ?>
                        </div>
                    </li>
                    
                    <li class="tab">
                        <input type="radio" name="tabs" id="tab2" />
                        <label for="tab2">Assessment</label>   
                        <div id="tab-content2" class="content">
                        <?php
                            echo "<h3>".$_SESSION['module']."</h3>";

                            foreach ($assessments as $data) {
                                if(in_array($_SESSION['module'], $data))
                                    echo "
                                        <p><a href='".$_SESSION['URL'].$data[3]."' target='_blank'>Download: ".$data[2]."</a></p>
                                        <hr/>
                                    ";
                            }
                        ?>
                        </div>
                    </li>
                </ul>
            </section>

        </div>

        <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
            panel.style.display = "none";
            } else {
            panel.style.display = "block";
            }
        });
        }
        </script>
    </body>
</html>