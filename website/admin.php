<?php
    include 'connect.php';
    include 'functions.php';
    include 'header.php';

    redirectIfNotLoggedIn();    
    redirectIfNotEmployeeOrAdmin($_SESSION["userId"],$pdo);
    
?>

<?php
if (isset($_GET['delete']))
    {
		$getID = $_GET['delete'];
		//Delete order_specifics first then orders
		$sql = "DELETE FROM order_specifics WHERE order_id = '$getID'";
		$pdo->exec($sql);
		
		$sql = "DELETE FROM orders WHERE order_id = '$getID'";
		$pdo->exec($sql);
	}
	
if (isset($_GET['moveComplete']))
    {
		$getID = $_GET['moveComplete'];
		
		$sql = "UPDATE orders SET status = '3' WHERE order_id = '$getID'";
		$pdo->exec($sql);
	}
	
if (isset($_GET['moveBasket']))
    {
		$getID = $_GET['moveBasket'];
		
		$sql = "UPDATE orders SET status = '1' WHERE order_id = '$getID'";
		$pdo->exec($sql);
	}
	
if (isset($_GET['moveActive']))
    {
		$getID = $_GET['moveActive'];
		
		$sql = "UPDATE orders SET status = '2' WHERE order_id = '$getID'";
		$pdo->exec($sql);
	}
?>

<div class="body_wrap centring">
	<div class = "admin-page">
		<h2>Admin page</h2>
		<a href="upload.php">Upload products</a>
		<h2>Active orders:</h2>
		<?php
		$query = $pdo->query("SELECT orders.shipping, orders.date_stamp, orders.user_id, orders.shipping_address, orders.payment_method, orders.order_id, orders.status FROM orders WHERE orders.status = 2");
		$result = $query->fetchAll();
		
		if (empty($result)){
			echo "No orders.<br>";
		}
	
		else{
			foreach($result as $rad){
				echo '
				<b>Order '.$rad[5].'</b>
				<br>Shipping: '.$rad[0].'
				<br>Date: '.$rad[1].'
				<br>UserID: '.$rad[2].'
				<br>Address: '.$rad[3].'
				<br>Payment method: '.$rad[4].'
				<br>Order ID: '.$rad[5].'
				<br>Order status: '.$rad[6].'<br>';
				
				$query2 = $pdo->query("SELECT order_specifics.amount, order_specifics.product_id FROM order_specifics WHERE order_specifics.order_id = '.$rad[5].'");
				$result2 = $query2->fetchAll();
				
				foreach($result2 as $rad2){
					echo '
					<br>Product ID '.$rad2[1].' x '.$rad2[0].'
					';
				}
				
				echo'
				
				<br><br>
				<a href="admin.php?delete='.$rad[5].'">Delete order</a><br>
				<a href="admin.php?moveComplete='.$rad[5].'">Move order to complete</a><br>
				';
			}

		}
		
		echo '<h2>Orders in basket:</h2>';
		$query = $pdo->query("SELECT orders.shipping, orders.date_stamp, orders.user_id, orders.shipping_address, orders.payment_method, orders.order_id, orders.status FROM orders WHERE orders.status = 1");
		$result = $query->fetchAll();
		
		if (empty($result)){
			echo "No orders.<br>";
		}
	
		else{
			foreach($result as $rad){
				echo '
				<b>Order '.$rad[5].'</b>
				<br>Shipping: '.$rad[0].'
				<br>Date: '.$rad[1].'
				<br>UserID: '.$rad[2].'
				<br>Address: '.$rad[3].'
				<br>Payment method: '.$rad[4].'
				<br>Order ID: '.$rad[5].'
				<br>Order status: '.$rad[6].'<br>';
				
				$query2 = $pdo->query("SELECT order_specifics.amount, order_specifics.product_id FROM order_specifics WHERE order_specifics.order_id = '.$rad[5].'");
				$result2 = $query2->fetchAll();
				
				foreach($result2 as $rad2){
					echo '
					<br>Product ID '.$rad2[1].' x '.$rad2[0].'
					';
				}
				
				echo'
				
				<br><br>
				<a href="admin.php?delete='.$rad[5].'">Delete order</a><br>
				<a href="admin.php?moveComplete='.$rad[5].'">Move order to complete</a><br>
				<a href="admin.php?moveActive='.$rad[5].'">Move order to active</a><br><br>
				';
			}

		}
		
		echo '<h2>Completed orders:</h2>';
		$query = $pdo->query("SELECT orders.shipping, orders.date_stamp, orders.user_id, orders.shipping_address, orders.payment_method, orders.order_id, orders.status FROM orders WHERE orders.status = 3");
		$result = $query->fetchAll();
		
		if (empty($result)){
			echo "No orders.<br>";
		}
	
		else{
			foreach($result as $rad){
				echo '
				<b>Order '.$rad[5].'</b>
				<br>Shipping: '.$rad[0].'
				<br>Date: '.$rad[1].'
				<br>UserID: '.$rad[2].'
				<br>Address: '.$rad[3].'
				<br>Payment method: '.$rad[4].'
				<br>Order ID: '.$rad[5].'
				<br>Order status: '.$rad[6].'<br>';
				
				$query2 = $pdo->query("SELECT order_specifics.amount, order_specifics.product_id FROM order_specifics WHERE order_specifics.order_id = '.$rad[5].'");
				$result2 = $query2->fetchAll();
				
				foreach($result2 as $rad2){
					echo '
					<br>Product ID '.$rad2[1].' x '.$rad2[0].'
					';
				}
				
				echo'
				
				<br><br>
				<a href="admin.php?delete='.$rad[5].'">Delete order</a><br>
				<a href="admin.php?moveActive='.$rad[5].'">Move order to active</a><br><br>
				';
			}

		}
		
		?>
		
	</div>
</div>