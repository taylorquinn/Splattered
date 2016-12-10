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

			case 'contact':
				$this->contact();
				break;

			case 'login':
				$this->login();
				break;

			case 'working':
				$this->working();
				break;

			case 'error':
				$this->error();
				break;

			case 'blogvisualization':
				$this->blogvisualization();
				break;

			case 'processLogout':
				$this->logout();
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
        $confirm = $_POST['confirmpw'];
				$age = $_POST['age'];
				$profpic = "default.jpg";
        $this->processSignup($firstName, $lastName, $email, $username, $password, $confirm, $age, $profpic);
				break;

			// redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL);
        exit();

		}

	}


	//redirects to home page, if logged in includes the side bar containing info.
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

 
	public function error(){
		$pageName = 'Error';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/error.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	//this page provides the contact info for the user
	public function contact() {
		$pageName = 'Contact';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/contact.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }

	//where the user logs in to the
	public function login() {
		$pageName = 'Log In';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }
	//signup for the user. This is used to display a pop-up
	public function signup() {
		$pageName = 'Sign Up';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

  }


public function blogvisualization() {
		$pageName = 'Working';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/blogvisualization.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }
	//working page


	public function working() {
		$pageName = 'Working';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/working.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//logs the user out
	public function logout() {
		 session_start();
        unset($_SESSION['user']);

        session_destroy(); // for good measure
        // redirect to home page
        	header('Location: '.BASE_URL);

  	}


		// process's the login, then the path of the page
  public function processLogin($u, $p) {
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
      or die ('Error: Could not connect to MySql database');
    mysql_select_db(DB_DATABASE);

    if(!isset($u) || trim($u) == '' || !isset($p) || trim($p) == '') {

 			 header('Location: '.BASE_URL.'/error');
        exit();

		}

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
			// header('Location: '.BASE_URL);
      // $this->login();
			// exit();
    header('Location: '.BASE_URL.'/error');

   
      exit();
    }

	}

  public function processSignup($firstName, $lastName, $email, $username, $password, $confirm, $age, $profpic) {
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		 $q = "SELECT * FROM user WHERE username='$username'";
    	$result = mysql_query($q);
    	 $numberOfRows = mysql_num_rows($result);

    	 echo($numberOfRows);

		
		//checks if each of the of the fields are empty or not
		if(!isset($email) || trim($email) == '' || !isset($firstName) || trim($firstName) == '' || !isset($lastName) || trim($lastName) == ''

		|| !isset($username) || trim($username) == '' || !isset($password) || trim($password) == '' || !isset($confirm) || trim($confirm) == ''
    || $confirm!=$password) {

  			header('Location: '.BASE_URL.'/error');



      exit();

		}

		else if(trim($confirm) != trim($password) || $numberOfRows != 0 ){
			header('Location: '.BASE_URL.'/error');



     		 exit();
		}

		//starts a session
    $q = sprintf("INSERT INTO user (first_name, last_name, email, username, pw, age, profpic) VALUES ('$firstName', '$lastName', '$email', '$username', '$password', '$age', '$profpic')");
		mysql_query($q);

    session_start();
    $_SESSION['user'] = $username;
    header('Location: '.BASE_URL);

    echo($numberOfRows);
    exit();
	}

}
