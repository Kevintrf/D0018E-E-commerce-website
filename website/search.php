<?php 
	include 'connect.php'; 
	include 'functions.php';
	include 'header.php';


?>
<div id="prod_body" class="body_wrap centring">
		<div id="prod_banner" class="banner_wrap">
<br>



<!-- IMPORANT SEARCH PART -->
<form action="" method="post">
    <input type="text" name="searchText" />
    <input type="submit" value="Search" />
</form>

<?php
	$search = $_POST['searchText'];
	
	if (!empty($search)){
		//Only works with exact matches currently
		$query = $pdo->prepare("SELECT * FROM products WHERE name = '$search'");
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
				<div id="prod_bread"class="banner_text"><p>' . $row['description'] .'</p></div>
				<div class="banner_header"><p>Price: '.$row['price'].' SEK</p></div>
				</div>			
				</a>';
			}
		}
	}
?>
<!-- IMPORANT SEARCH PART END-->

		</div>
	</div>
</body>