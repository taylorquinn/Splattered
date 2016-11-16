<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$pc = new SiteController();
$pc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		if(!isset($_SESSION['user']) || $_SESSION['user'] == '') {
					session_start();
				}
		switch($action) {

			case 'home':

				$this->home();
				break;

			case 'add':
				$this->add();
				break;

			case 'contact':
				$this->contact();
				break;

			case 'login':
				$this->login();
				break;

			case 'working':
				$this->working();
				break;

			case 'delete':
				$productID = $_GET['pid'];
				$this->deleteProduct($productID);
				break;

			case 'processLogout':
				$this->logout();
				break;


			case 'viewProfile':
				$urlparts = explode("/",$_SERVER["REDIRECT_URL"]);
				//echo var_dump($urlparts);
				//echo $urlparts[count($urlparts)-1];
				$this->viewProfile($urlparts[count($urlparts)-1]);
	 			break;

			case 'editProfile':
				$username = $_SESSION['user'];
				$this->editProfile($username);
		 		break;

			case 'editProfileProcess':
				$username = $_SESSION['user'];
				$this->editProfileProcess($username);
				break;

			case 'processLogin':
				$username = $_POST['un'];
				$password = $_POST['pw'];
				$this->processLogin($username, $password);
				break;

			case 'signup':
				$this->signup();
				break;

      case 'processSignup':
        $firstName = $_POST['fname'];
        $lastName = $_POST['lname'];
        $email = $_POST['email'];
				$username = $_POST['un'];
				$password = $_POST['pw'];
				$age = $_POST['age'];
				$this->processSignup($firstName, $lastName, $email, $username, $password, $age);
				break;

			// redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL);
        exit();

		}

	}


	public function viewProfile($username) {
		$pageName = 'Profile Page';

		$myUsername =  User::loadByUsername($_SESSION['user']);
		$p = User::loadByUsername($username);


		$userVariable = $p->get('id');
		$myUser = $myUsername->get('id');
		$q = "SELECT * FROM follow where follower_id = '$myUser' AND followed_id = '$userVariable'; ";
		$result = mysql_query($q);
		if (mysql_num_rows($result) == 0) {
				$following = false;
		 }
		 else {
			 $following = true;
		 }

		 $q = "SELECT * FROM follow WHERE follower_id='$username'";
		 $result = mysql_query($q);
		 $follow = array();
 		while($row = mysql_fetch_assoc($result)) {
 			$follow['followed_id'] = $row['followed_id'];
 		}

    $p = User::loadByUsername($username);

    $q = "SELECT * FROM post WHERE username='$username' ";
    $result = mysql_query($q);

		$l = "SELECT * FROM follow WHERE follower_id = '$userVariable'";

		$followed = mysql_query($l);

		$b = "SELECT * FROM follow WHERE followed_id = '$userVariable'";

		$follower = mysql_query($b);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProfile($username) {
		$pagename = 'Edit Profile Page';
		$u =  User::loadByUsername($username);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProfile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProfileProcess($username) {
		$first_name = $_POST['first_name'];
		$last_name = $_POST['last_name'];
		$email = $_POST['email'];
		$bio = $_POST['bio'];
		$age = $_POST['age'];
		$profpic = $_POST['profpic'];
		$pw = $_POST['pw'];

		//load the product, record updates, and save to the database
		$u = User::loadByUsername($username);
		$u->set('first_name', $first_name);
		$u->set('last_name', $last_name);
		$u->set('email', $email);
		$u->set('bio', $bio);
		$u->set('age', $age);
		$u->set('profpic', $profpic);
		$u->set('pw', $pw);
		$u->save();

		session_start();
		$_SESSION['msg'] = "You edited the profile called ".$title;
		header('Location: '.BASE_URL.'/profile/'.$_SESSION['user']);

	}

  public function home() {
		$pageName = 'Home';

    if(isset($_SESSION['user'])) {
      $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
  			or die ('Error: Could not connect to MySql database');
  		mysql_select_db(DB_DATABASE);

      $username = $_SESSION['user'];
      $q = "SELECT * FROM post WHERE username='$username' ";
      $result = mysql_query($q);
    }


		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }




	public function contact() {
		$pageName = 'Contact';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/contact.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }


	public function login() {
		$pageName = 'Log In';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }

	public function signup() {
		$pageName = 'Sign Up';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }


	public function working() {
		$pageName = 'Working';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/working.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function logout() {
		 session_start();
        unset($_SESSION['user']);

        session_destroy(); // for good measure
        // redirect to home page
        	header('Location: '.BASE_URL);

  	}

	// public function processLogin($u, $p) {
	// 	$adminUsername = 'admin';
	// 	$adminPassword = 'password';
	// 	if(($u == $adminUsername) && ($p == $adminPassword)) {
	// 		session_start();
	// 		$_SESSION['user'] = $u;
	// 		echo 'Hooray! Access is granted.';
  //
	// 		header('Location: '.BASE_URL);
	// 			echo 'Hooray! Access is granted.';
  //
	// 		exit();
	// 	// } else {
	// 	//
	// 	} else {
  //
	// 		echo 'Access denied.';
	// 		// send them back
	// 		header('Location: '.BASE_URL);
	// 			echo 'Hooray! Access is granted.';
  //
	// 		exit();
	// 	}
  //
	// }

  public function processLogin($u, $p) {
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
      or die ('Error: Could not connect to MySql database');
    mysql_select_db(DB_DATABASE);

    $q = "SELECT * FROM user WHERE username='$u' && pw='$p' ";
    $result = mysql_query($q);

    $numberOfRows = mysql_num_rows($result);

    if($numberOfRows == 1) {
			//starts a session

      session_start();
			$_SESSION['user'] = $u;
			header('Location: '.BASE_URL);
			exit();
    } else {
      // send them back
			header('Location: '.BASE_URL);
      $this->login();
			exit();
    }

	}


	// When the signup button is pressed
  public function processSignup($firstName, $lastName, $email, $username, $password, $age) {
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		//checks if each of the of the fields are empty or not
		if(!isset($email) || trim($email) == '' || !isset($firstName) || trim($firstName) == '' || !isset($lastName) || trim($lastName) == ''
		|| !isset($username) || trim($username) == '' || !isset($password) || trim($password) == '') {

			$this->home();
			exit();
		}
		//inserts the data into the database
    $q = sprintf("INSERT INTO user (first_name, last_name, email, username, pw, age) VALUES ('$firstName','$lastName','$email', '$username', '$password', '$age')");
		mysql_query($q);


		//starts a session

    session_start();
    $_SESSION['user'] = $username;
    header('Location: '.BASE_URL);
    exit();
	}

}
