<?php 
    session_start();
    require_once('./includes/DbConnection.php');
    $message1="";
    $message2="";
    if(isset($_POST)&& !empty($_POST)){
        $name=stripslashes(mysqli_real_escape_string($connection,trim($_POST['name'])));
        $email=stripslashes(mysqli_real_escape_string($connection,trim($_POST['email'])));
        $pass=stripslashes(mysqli_real_escape_string($connection,trim($_POST['pass'])));
        $conpass=stripslashes(mysqli_real_escape_string($connection,trim($_POST['conpass'])));
        if($pass==$conpass){
            $sql="INSERT INTO `user`(`name`,`email`,`password`, `type`)VALUES( \"$name\", \"$email\", \"$pass\", 2)";
            if(mysqli_query($connection,$sql)){
                $message2="Account created successfully. Click login to login";    
            }
        }else{
            $message1="Passwords did not match. Please try again";
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Welcome to DoorDelights</title>
        
        <link href="assets/css/newsignup.css" rel="stylesheet">
    </head>
    <body>
        <center>
        <div >
          <form class="form-signin" role="form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <h2 style="color:white; padding:10px;" >Welcome To DoorDelights</h2>
            <h3 style="color:white;">Craving for good food?<br> Sign up now </h3>
            <input type="text"  name="name" placeholder="Full Name" required autofocus>
            <input type="email"  name="email" placeholder="Email address" required >
            <input type="password" name="pass" placeholder="Password" required>
            <input type="password"  name="conpass" placeholder="Confirm Password" required>
            <span style="color:red"><?= $message1 ?></span>
            <span style="color:green"><?= $message2 ?></span>
            <div >
                <div ><button class="button-59"  type="submit" >Sign up</button></div>  
                <div ><button class="button-59"><a  href="index.php" >Log in</a></button></div>  
            </div>  
          </form>
        </div>
</center> 

        
        <script src="assets/js/jquery-1.9.0.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>