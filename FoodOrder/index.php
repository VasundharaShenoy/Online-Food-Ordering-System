<?php
    session_start();
    require_once('./includes/DbConnection.php');
    $message1="";
	if(isset($_POST)&& !empty($_POST)){
        print_r($_POST);
        $user=stripslashes(mysqli_real_escape_string($connection,trim($_POST['user'])));
        $pass=stripslashes(mysqli_real_escape_string($connection,trim($_POST['pass'])));
        $sql="select * from user where email = '{$user}' limit 1";
        $result=mysqli_query($connection,$sql);
        if($row=mysqli_fetch_assoc($result)){
            if($row['password']==$pass){
                session_unset();
                $_SESSION['userid']=$row['id'];
                $_SESSION['name']=$row['name'];
                $_SESSION['email']=$row['email'];
                $_SESSION['type']=$row['type'];
                if($row['type']==0){
                    $_SESSION['type']=0;
                    header("Location: admin/index.php");
                    die();
                }
                if($row['type']==2){
                    $_SESSION['type']=2;
                    header("Location: customer/index.php");
                    die();
                }
            }else{
                    $message1="Wrong Password";
            }
        }else{
            $message1="User with Email-ID {$user} does not exist";
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login to DoorDelights</title>
        
        <link href="assets/css/sign.css" rel="stylesheet">
    </head>
    <body>
    <center><div class="container">
          <form class="form-signin" role="form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
          <h2 style="color:white; padding-top:10px;" >Welcome To DoorDelights</h2>
            <h2 style="color:white;">Please sign in</h2>
            <input type="email" name="user" placeholder="Email address" required autofocus>
            <input type="password"  name="pass" placeholder="Password" required>
            <span style="color:red"><?= $message1 ?></span>
            <div >
                <div><button class="button-59"  type="submit">Sign in</button></div> 
                <div><button class="button-59"><a href="signup.php">Register</a></button></div>  
            </div>  
          </form>
        </div></center> 


        <script src="assets/js/jquery-1.9.0.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>