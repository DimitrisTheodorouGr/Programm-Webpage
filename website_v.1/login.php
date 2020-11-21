<!-- login.php: login page (accessible by all users) -->

<?php
	/* Attempt MySQL server connection. Assuming you are running MySQL
	server with default setting (user 'root' with no password) */
		$link = mysqli_connect("localhost", "root", "", "university_programm_v.1");
 
	// Check connection
		if($link === false)
		{
    		die("ERROR: Could not connect. " . mysqli_connect_error());
		}
	
	
	
	// check login information
	require 'config.php';
	if(isset($_POST['email'])){ /* if the email was provided */
		$email = $_POST['email'];
		$query = "SELECT ID FROM person WHERE EMAIL = '$email'";
		$result = mysqli_query($link,$query);
		//$query = "SELECT id FROM persons WHERE email = '".mysqli_real_escape_string($con, $email)."'";
		//$result = mysqli_query($con, $query);
		$num = mysqli_num_rows($result);
		
		if($num != 0){ /* email exists */
			$data = mysqli_fetch_array($result);
			$user = $data['EMAIL'];
			$id = $data['ID'];
			// redirect to main page or other pages for successful login
			session_start();
			$_SESSION['ID'] = $data['ID'];
			$_SESSION['EMAIL'] = $email;
			//$_SESSION['name'] = $data['name'];
			//$_SESSION['surname'] = $data['surname'];
			//$_SESSION['currentrole'] = $data['role']; // the current role that the user has (allows user to switch his role to author, reviewer, etc.)
				
			echo '<script language="javascript">document.location="main_website.php";</script>';
			
		}
		else{ // open page for wrong email
			echo '<script language="javascript">document.location="Error.php";</script>';
		}
    }
?>

<form name="form1" method="POST" action="login.php">
	<fieldset>
		<legend>Please enter the following</legend>
		<label for="email">Email:</label>
		<input name="email" type="email" class="form-control" id="email" placeholder="Email" required>
		<button type="submit">Login</button>
	</fieldset>
</form>