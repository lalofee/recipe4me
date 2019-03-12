<?php
 ob_start();
 session_start(); // start a new session or continues the previous
 if( isset($_SESSION['user'])!="" ){
  header("Location: home.php"); // redirects to home.php
 }
 include_once 'dbconnect.php';
 $error = false;
 if ( isset($_POST['btn-signup']) ) {
 
  // sanitize user input to prevent sql injection
  $name = trim($_POST['name']);
  $name = strip_tags($name);
  $name = htmlspecialchars($name);
    $lastname = trim($_POST['lastname']);
  $lastname = strip_tags($lastname);
  $lastname = htmlspecialchars($lastname);
 
  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);
 
  $pass = trim($_POST['pass']);
  $pass = strip_tags($pass);
  $pass = htmlspecialchars($pass);
 
  // basic name validation
  if (empty($name)) {
   $error = true;
   $nameError = "Please enter your first name.";
  } else if (strlen($name) < 3) {
   $error = true;
   $nameError = "Name must have at least 3 characters.";
  } else if (!preg_match("/^[a-zA-Z ]+$/",$name)) {
   $error = true;
   $nameError = "Name must contain alphabets and space.";
  }
  if (empty($lastname)) {
   $error = true;
   $lastnameError = "Please enter your last name.";
  } else if (strlen($lastname) < 3) {
   $error = true;
   $lastnameError = "Name must have atleat 3 characters.";
  } else if (!preg_match("/^[a-zA-Z ]+$/",$lastname)) {
   $error = true;
   $lastnameError = "Name must contain alphabets and space.";
  }
 
  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = true;
   $emailError = "Please enter valid email address.";
  } else {
   // check whether the email exist or not
   $query = "SELECT useremail FROM users WHERE useremail='$email'";
   $result = mysqli_query($conn, $query);
   $count = mysqli_num_rows($result);
   if($count!=0){
    $error = true;
    $emailError = "Provided Email is already in use.";
   }
  }
  // password validation
  if (empty($pass)){
   $error = true;
   $passError = "Please enter password.";
  } else if(strlen($pass) < 6) {
   $error = true;
   $passError = "Password must have atleast 6 characters.";
  }
 
  // password encrypt using SHA256();
  $password = hash('sha256', $pass);
 
  // if there's no error, continue to signup
  if( !$error ) {
   
   $query = "INSERT INTO users(username,userlastname, useremail,userpass) VALUES('$name','$lastname','$email','$password')";
   $res = mysqli_query($conn, $query);
   
   if ($res) {
    $errTyp = "success";
    $errMSG = "Successfully registered, you may login now";
    unset($name);
    unset($lastname);
    unset($email);
    unset($pass);
   } else {
    $errTyp = "danger";
    $errMSG = "Something went wrong, try again later...";
   }
   
  }
 
 
 }
?>

<!DOCTYPE html>

<html>

<head>

  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="styles.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  

<title>Sign Up!</title>

</head>

<body id="registerbody">


    <div class="container" id="regcontainer">
      <div class="row">
        <div class="col-lg-8 col-md-8 col-xs-12  col-md-offset-10">
    <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off" id="registerform">

    <h2 class="text-center" id="registertxt">Sign Up.</h2>

         <hr />


      <?php
   if ( isset($errMSG) ) {
   
    ?>


             <div class="alert">

 <?php echo $errMSG; ?>

             </div>

 <?php
   }
   ?>

           <input type="text" name="name" class="form-control" placeholder="Enter First Name" maxlength="50" value="<?php echo $name ?>" />

       

                <span class="text-danger"><?php echo $nameError; ?></span>


           

           <input type="text" name="lastname" class="form-control" placeholder="Enter Last Name" maxlength="50" value="<?php echo $lastname ?>" />

       

                <span class="text-danger"><?php echo $lastnameError; ?></span>

       

   

             <input type="email" name="email" class="form-control" placeholder="Enter Your Email" maxlength="40" value="<?php echo $email ?>" />

     

                <span class="text-danger"><?php echo $emailError; ?></span>

         <input type="password" name="pass" class="form-control" placeholder="Enter Password" maxlength="15" />

             

                <span class="text-danger"><?php echo $passError; ?></span>

       

             <hr />

 

           


             <button type="submit" class="btn btn-block btn-primary" name="btn-signup">Sign Up</button>


             <hr />

           </form></div></div>


           


             <nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">Recip-me</a>
        </div>
        <!-- Collection of nav links and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.php" id="register"><button type="submit" class="navbar-form navbar-right btn-info" id="logoutbtn">Sign in</button></a></li>
            </ul>
        </div>
    </div>
</nav>

     

   

    </form>

</div>



</body>

</html>

<?php ob_end_flush(); ?>