<?php 
session_start();
 
require_once 'actions/dbconnect.php';

//select logged-in users detail
 $res=mysqli_query($conn, "SELECT * FROM users WHERE userid=".$_SESSION['user']);

 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

 ?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- custom google font -->
    <link href="https://fonts.googleapis.com/css?family=Berkshire+Swash|Noto+Sans" rel="stylesheet">
  </head>
    <title>Recipe 4 Me</title>
  </head>
  <body>
    
<!-- #####################    FIXED NAVBAR     ############################ -->
    <nav class="navbar navbar-custom navbar-expand-md fixed-top">
      <a class="navbar-brand" href="index.php" id="brand_text">Recipe 4 Me</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="home.php">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="filter.php">Search</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="recipe_create.php">New Recipe<span class="sr-only">(current)</span></a>
          </li>
        </ul>
        <ul class="navbar-nav navbar-right">
          <li class="nav-item"><span class="nav-link">Welcome - <?php echo $userRow['username']; ?></span></li>
          <li class="nav-item"><a class="nav-link" href="logout.php?logout">Sign Out</a></li>
        </ul>
      </div>
    </nav>

  
    


<main role="main" class="container">  <!-- MAIN CONTAINER  -->

  <!-- #####################    JUMBOTRON HEADER     ############################ -->
<div class='container-full-bg' style='background-image:url(img/header.jpg);'>
    <div class='container special'>
      <div class='jumbotron' id='jumbotron-bg-image'>
        <div class='container'>
          <div class='row'>
            <div class='col-s-12 col-md-12' id='bg_text'>
              <h1 class='display-3 text-center' id='brand_text'>Add New Recipe</h1>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div><hr class="style5 mt-4"></div>

<?php  
if($_POST) {
    $recipeName = $_POST['rName'];
    $recipeMethod = $_POST['cMethod'];
    $cookingInstructions = $_POST['cInstructions'];
    $recipeOrigin = $_POST['rOrigin'];
    $recipeImage = $_POST['rImage'];


    $sql = "INSERT INTO recipe (name, cookingMethod, instructions, origin) VALUES ('$recipeName', '$recipeMethod', '$cookingInstructions', '$recipeOrigin')";
    if($conn->query($sql) === TRUE) {
        echo "<p>New Recipe Successfully Created</p>";
        echo "<a href='addingredients.php'><button type='button' class='btn btn-info'>Continue to Ingredients List</button></a> &nbsp;";

        echo "<a href='home.php'><button type='button' class='btn btn-success'>Home</button></a>";
    } else {
        echo "Error " . $sql . ' ' . $conn->connect_error;
    }

    $conn->close();
}
?>
</body>
</html>
