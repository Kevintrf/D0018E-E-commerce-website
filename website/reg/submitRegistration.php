<?php
include '../connect.php';

//DB Login https://d0018e-232709.phpmyadmin.mysql.binero.se/
?>

<html>
<head>
<title>WebShop</title>
</head>
<body>

<?php

	$newUsername = $_POST["username"];
	$newPassword = $_POST["password"];		
	$newName = $_POST["name"];		
	$newEmail = $_POST["email"];		
	$newAdress = $_POST["adress"];
	$newPersonnummer = $_POST["personnummer"];
	$newPhone = $_POST["phone"];

try {		
	
	$query = $pdo->prepare("SELECT username FROM users WHERE username = ?");
	$query->execute([$newUsername]); //Executes pdo->prepare and replaces ? with $newUsername
	$query = $query->fetchColumn(); //Will be empty if username is not in use

	if (empty($query)){			
		$sql = "INSERT INTO customers (name, adress, phone_number, email, personnummer)		
		VALUES ('$newName', '$newAdress', '$newPhone', '$newEmail', '$newPersonnummer')";		
		$pdo->exec($sql);		
		$lastID = $pdo->lastInsertId();		
		$sql2 = "INSERT INTO users (position, username, password, user_id)    
		VALUES ('user', '$newUsername', '$newPassword', '$lastID');";		
		$pdo->exec($sql2);    
		echo "User successfully registered!";					
	}		
	else{		
		echo "User could not be registered! Username already in use.";	
		echo "<br><a href='javascript:history.back()'>Go back</a>";
	}
}

catch(PDOException $e)
    {
	echo "User could not be registered! <br>";
    echo $sql . "<br>" . $e->getMessage();
    }

?>

</body>
</html>

