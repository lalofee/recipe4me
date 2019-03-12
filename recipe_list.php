<?php 
session_start();
 
require_once 'actions/dbconnect.php';

//select logged-in users detail
 // $res=mysqli_query($conn, "SELECT * FROM users WHERE userid=".$_SESSION['user']);

 // $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);


?>
 
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- custom css -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- custom google font -->
    <link href="https://fonts.googleapis.com/css?family=Berkshire+Swash|Noto+Sans" rel="stylesheet">
    <title>Recipe Me</title>

    <style>
    .card{
    max-height: 600px; 
    min-height: 600px; 
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); 
    transition: 0.3s;
    margin-bottom: 100px; 
    text-align: center;
    }
      
    .card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    }

    .card img{
      max-height: 220px;
    }

    .card-button{

    margin-bottom: 10px;

    }
    </style>

  </head>

  </head>
    

  <body data-spy="scroll" data-target=".navbar" data-offset="50">
    
<!-- #####################    FIXED NAVBAR     ############################ -->
    <nav class="navbar navbar-custom navbar-expand-md fixed-top">
      <a class="navbar-brand" href="index.php" id="brand_text">Recipe 4 Me</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon rounded-circle" style="background-color: white; opacity:0.3"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="home.php">Home</a>
          </li>
             <!--  <li class="nav-item">
            <a class="nav-link" href="recipe_list.php">All Recipes</a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="search.php">Search</a>
          </li>
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
  <div class="container-full-bg" style="background-image:url('img/fruits.jpg'); padding:10px 0px 150px 0;">
    <div class="container special" style="opacity: 0.1">
      <div class="jumbotron">
        <div class="container">
          <div class="row">
            <div class="col-s-12 col-md-12">
          <h1 class="display-3" style="color:solid black;">Recipes</h1>
          </div>
          </div>
      </div>
    </div>
  </div>
</div>

<!-- #####################    2nd NAVIGATION     ############################ -->
  <div>
     <!--  <ul class="nav nav-pills red flex-column flex-sm-row justify-content-center nav-fill mt-3">
    <li class="nav-item pill-1">
      <a class="nav-link active" href="#">Summery</a>
    </li>
    <li class="nav-item pill-2">
      <a class="nav-link" href="#">Ingredients</a>
    </li>
    <li class="nav-item pill-3">
      <a class="nav-link" href="#">Recipe</a>
    </li>
    </ul> -->
  </div>

<div><hr class="style5"></div>

<!-- #####################    View: all recipes as cards     ############################ -->
<div class="row">
    <!-- <h3 class="text-center">All our recipes</h3>   -->
</div>

<div class="row" id="recipe">
  <?php 
      $sql = "SELECT `recipe`.`idRecipe`, `images`.`image`, `recipe`.`name` FROM `images`
    LEFT JOIN `recipe` ON `recipe`.`fk_idImage` = `images`.`idImage` ORDER BY `recipe`.`idRecipe` ASC
      ";
      $sql1 = "SELECT `recipe`.`idRecipe`, `tags`.`category` FROM `recipe`
      LEFT JOIN `recipe_tags` ON `recipe_tags`.`fk_idRecipe` = `recipe`.`idRecipe`
      LEFT JOIN `tags` ON `recipe_tags`.`fk_idTag` = `tags`.`idTag` WHERE (`recipe`.`idRecipe` IS NOT NULL)
  ";
      $result = $conn->query($sql);
            while($row = $result->fetch_assoc()) {
      echo"
      <div class='col-sm-4'>
        <div class='card'>
          <img  src='img/".$row["image"]."'alt='image loading failed'>
          <div class='container1 card-body'>
            <h5 class='card-title'>".$row['name']."</h5>
            <a href='#'class='card-button btn btn-primary'>View Recipe</a>
            <p class='card-text'>Tags: </p><span>
        ";

      $result1 = $conn->query($sql1);
        while($row1 = $result1->fetch_assoc()) {
          echo "
          ".$row1['category']."&nbsp;&nbsp;&nbsp;</span>
 
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





 


<!-- scroll to top button  -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
 
  

<script>

  window.onscroll = function() {scrollFunction()};
  function scrollFunction(){
      if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
          document.getElementById("myBtn").style.display = "block";
      } else {
          document.getElementById("myBtn").style.display = "none";
      }
  }
  function topFunction() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
  }
</script>
<!-- endof scroll to top button -->
 
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
























