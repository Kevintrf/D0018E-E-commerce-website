<?php
	include 'connect.php';
	include 'functions.php';
	include 'header.php';

	$id = $_GET['id'];
	$row = selProdID($pdo, $id);
?>
	
	<div class="body_wrap centring box">
		<!-- Rubrik !-->
		
	<?php
		
echo'
	<div id="header" class="centring"><h1>'.$row[3].'</h1></div>
		
		
		<!-- Skapar bild !-->
		<div class="review_img">
			<img src="'.$row[5].'" alt="">
		</div>
		<!-- Två textfält !-->
		<div class="text_wrap">
			<p>'.$row[4].'</p>
		</div>
		<div class="text_wrap">
			<p>'.$row[4].'</p>
		</div>
	</div>';
	?>
	
<!-- Reviews -->
	<div class="body_wrap centring box">
	<div id="header" class="centring"><h1>Reviews</h1></div>
	<div class="text_wrap">
	<?php
	$currentUserID = $_SESSION['userId']; //Behövs annars får jag en massa errors
	$currentUser;
	
	if(empty($_SESSION['userId'])){ //If logged out
		echo "<br>Please <a href='login.php'>log in</a> to leave a review.";
	}
	else{ //If logged in
		
		$query = $pdo->prepare("SELECT username FROM users WHERE user_id = $currentUserID");
		$query->execute();
		$query = $query->fetch(PDO::FETCH_ASSOC);
		$currentUser = $query['username'];

	
	
		$query = $pdo->prepare("SELECT * FROM reviews WHERE username = '$currentUser' && product_id = $id");
		$query->execute();
		$query = $query->fetchColumn(); //Will be empty if user has not left a review
		if (!empty($query) || isset($_POST['submit'])){
			//Lägg till möjlighet att kunna redigera din review
			echo "<br>You have already left a review on this product.";
		}
		
		else{
		echo "<br>Leave a review<br><form action='' method='post'>
		Rating: <input type='number' min='1' max='5' name='rating'><br>
		Review text: <input type='text' name='reviewText'><br>
		<input name='submit' type='submit' />
		</form>";
		}
	}
	
    if (isset($_POST['submit']) && empty($query)) {
		$rating = $_POST['rating'];
		$reviewText = $_POST['reviewText'];
		
		try {
			$sql = "INSERT INTO reviews (username, product_id, rating, review_text)
			VALUES ('$currentUser', '$id', '$rating', '$reviewText')";
			$pdo->exec($sql);
		}
		
		catch(PDOException $e)
		{
			echo "<br>Could not submit review: " . $e->getMessage();
		}
	}
	
	
	
	//Find reviews if they exist and then show them
	$query = $pdo->prepare("SELECT * FROM reviews WHERE product_id = $id");
	$query->execute();
	
	if (empty($query->fetch(PDO::FETCH_ASSOC))){
		echo "<br>There are no reviews yet.";
	}
	
	else{
		$query->execute();
		echo "<br>";
		while ($row = $query->fetch(PDO::FETCH_ASSOC)){
			echo "<br> Review by: " . $row['username'];
			echo "<br>" . $row['rating'] . " out of 5 stars.";
			echo "<br>" . $row['review_text'];
			echo "<br>";
		}
	}
	?>
	</div></div></div>
	
	
	
	<!-- Förslag på andra artiklar !-->
	<div id="suggested" class="centring">
		<div id="sug_ban"><p>Suggested content:</p></div>
		<div class="banner_wrap">
			<!-- Länk samt containrar för bild och text !-->
			<?php
				for($x=0; $x<2; $x++){
					echo '
						<a href="read_ea.html">
							<div class="banner box">
								<div class="banner_imgwrap"><img src="'.$row[5].'" alt=""></div>
								<div class="banner_header"><p>'.$row[3].'</p></div>
								<div class="banner_text"><p>'.$row[1].'</p></div>
					
							</div>
						</a>
					';
				}
			?>

		</div>
	</div>
</body>
	