<?php 
	include 'connect.php'; 
	include 'functions.php';
?>

<?php
// Attempt search query execution
try{
	$search = $_REQUEST["term"];
	
	if (!empty($search)){
		//Only works with exact matches currently
		$query = $pdo->prepare("SELECT * FROM products WHERE name LIKE '%$search%'");
		$query->execute();
		
		if (empty($query->fetch(PDO::FETCH_ASSOC))){
			echo "<br>No results found.";
		}
		
		else{
			$query->execute();
			echo "Results for: " . $search . "<br>";
			while ($row = $query->fetch(PDO::FETCH_ASSOC)){
				/*echo "<br> Product: " . $row['name'];
				echo "<br> Product ID: " . $row['product_id'];
				echo "<br> Price: " . $row['price'];
				echo "<br> Stock: " . $row['stock'];
				echo "<br> Description : " . $row['description'];
				echo "<br> Picture: " . $row['picture'];
				echo "<br>";*/
				echo'
				<a href="pr.php?id='.$row['product_id'].'">
				<div id="prod_first_item" class="banner box" >
				<div id="prod_img" class="banner_imgwrap"><img src="'.$row['picture'].'" alt="destiny"></div>
				<div id="prod_bread"class="banner_text"><p>' . $row['name'] .'</p></div>
				<div class="banner_header"><p>Price: '.$row['price'].' SEK</p></div>
				</div>			
				</a>';
			}
		}
	}
} catch(PDOException $e){
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}
?>