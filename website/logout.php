 
<?php
        session_start();
        session_unset();
        session_destroy();
?>

<!DOCTYPE html>
<html>
<head>
  <title>Lagom bra Shopping</title>
</head>

<body>
  <a href="index.php">Home</a>
  <a href="login.php">Login</a>
  <h1>You are now logged out!</h1>
</body>
</html>

