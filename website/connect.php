<?php
	//DB Login https://d0018e-232709.phpmyadmin.mysql.binero.se/
	$servername = "my62b.sqlserver.se";
	$username = "232709_dv35510";
	$password = "lol12345";
	$database = "232709-d0018e";

try {
    $pdo = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }
?> 