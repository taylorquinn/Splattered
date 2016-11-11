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
				$this->processSignup($firstName, $lastName, $email, $username, $password);
				break;

			// redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL);
        exit();

		}

	}


	public function viewProfile($username) {
		$pageName = 'Profile Page';

        $p = Profile::loadByUsername($username);//should be username??		
		
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';

		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

  public function home() {
		$pageName = 'Home';
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

  public function processSignup($firstName, $lastName, $email, $username, $password) {
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

    $q = sprintf("INSERT INTO user (first_name, last_name, email, username, pw) VALUES ('$firstName','$lastName','$email', '$username', '$password')");
		mysql_query($q);

    session_start();
    $_SESSION['user'] = $username;
    header('Location: '.BASE_URL);
    exit();
	}

}
