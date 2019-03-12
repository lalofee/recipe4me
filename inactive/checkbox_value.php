<?php
if(isset($_POST['submit'])){
if(!empty($_POST['categories'])) {
// Counting number of checked checkboxes.
$checked_count = count($_POST['categories']);

// Loop to store and display values of individual checked checkbox.
foreach($_POST['categories'] as $selected) {
echo "<p>".$selected ."</p>";
}

}
else{
echo "<b>Please Select at least one Option.</b>";
}
}
?>
