<?php	include '../connect.php';	?>	<html><head><title>WebShop</title></head><body>	<?php			$newUsername = $_POST["username"];			$newPassword = $_POST["password"];		$newName = $_POST["name"];		$newEmail = $_POST["email"];		$newAddress = $_POST["address"];	$newNin = $_POST["nin"];	$newPhone = $_POST["phone"];		try {  $sql = "INSERT INTO customers (name, address, phone, email, nin) VALUES ('$newName', '$newAddress', '$newPhone', '$newEmail', '$newNin')";
		$pdo->exec($sql);			$lastID = $pdo->lastInsertId();	
		$sql2 = "INSERT INTO users (role, username, password, user_id) VALUES (1, '$newUsername', '$newPassword', '$lastID');";			$pdo->exec($sql2);    		echo 'User successfully registered!';    }catch(PDOException $e)    {	echo 'User could not be registered! <br>';    echo $sql . '<br>' . $e->getMessage();    }	?>	</body></html>