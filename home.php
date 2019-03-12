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

    <style>
    

   /*.img {
    max-height: 100%;
    max-width: 100%;
   }
   .card-img-top: {
    height: 80px;
   }*/

  .wrapper {
  
}



.wrapper img {
  display: block;
  max-width:500px;
  max-height:350px;
  width: auto;
  height: auto;
}
    
    </style>
  </head>
  <body>
    
<!-- #####################    FIXED NAVBAR     ############################ -->
    <nav class="navbar navbar-custom navbar-expand-md fixed-top">
      <a class="navbar-brand" href="index.php" id="brand_text">Recipe 4 Me</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon rounded-circle" style="background-color: white; opacity:0.3"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="home.php">Home<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="search.php">Search</a>
         <!--  </li>
              <a class="nav-link" href="recipe_list.php">All recipes</a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="recipe_create.php">New Recipe</a>
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
              <h1 class='display-3 text-center' id='brand_text'>All our recipes</h1>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div><hr class="style5 mt-4"></div>

<!-- #####################    View: all recipes as cards     ############################ -->

<div class="row" id="recipe">
  
  <?php 
      $sql = "SELECT `recipe`.`idRecipe`, `images`.`image`, `recipe`.`name`
FROM `recipe`
    LEFT JOIN `images` ON `recipe`.`fk_idImage` = `images`.`idImage`
WHERE (`recipe`.`idRecipe` IS NOT NULL)  
ORDER BY `recipe`.`idRecipe` ASC
      ";

      $result = $conn->query($sql);
            while($row = $result->fetch_assoc()) {
      echo"
      <div class='col-lg-4 col-sm-6 d-flex justify-content-center'>
        <div class='card text-center'>
        <div class='wrapper'>
          <img class='card-img-top img-fluid' src='img/".$row['image']."' alt='Card image cap'>
        </div>
          <div class='container1 card-body'>
            <h4 class='card-title'>".$row['name']."</h4>
             <form action='' method='get'>
             <a href='recipe.php?id=".$row['idRecipe']."'><button type='button' class='btn btn-success green-background white'>View Recipe</button></a>
             </form>
             <br>
            <p class='card-text'>Tags: </p><span>
        ";

      $sql1 = "SELECT `recipe`.`idRecipe`, `tags`.`category` FROM `recipe`
      LEFT JOIN `recipe_tags` ON `recipe_tags`.`fk_idRecipe` = `recipe`.`idRecipe`
      LEFT JOIN `tags` ON `recipe_tags`.`fk_idTag` = `tags`.`idTag` WHERE (`recipe`.`idRecipe` IS NOT NULL)
  ";

      $result1 = $conn->query($sql1);
        while($row1 = $result1->fetch_assoc()) {
          echo "
          ".$row1['category']."&nbsp;&nbsp;&nbsp;</span>
          <br>
 
       ";
      }
      echo"
              </div>
            </div>
          </div>
          ";   
         }    
  ?> 
  
</div> <!--<div class="row" id="recipe"> -->




</main>
<footer class="footer">
      <div class="container text-center mt-5 mb-4">
        <span class="text-muted font-weight-bold">created by   <a href="https://github.com/sabkiha"><i class="fa fa-github"> Sabine</i></a></span>
                                           <a href="https://github.com/ninjamoni"><i class="fa fa-github"> Nina</i></a></span>
                                           <a href="https://github.com/tpatkos"><i class="fa fa-github"> Theo</i></a></span>
                                           <a href="https://github.com/lalofee"><i class="fa fa-github"> Angela</i></a></span>
      </div>
    </footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>