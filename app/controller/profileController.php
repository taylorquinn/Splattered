<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$pc = new ProfileController();
$pc->route($action);

class ProfileController {

	// route us to the appropriate class method for this action
	public function route($action) {
		if(!isset($_SESSION['user']) || $_SESSION['user'] == '') {
					session_start();
				}
    switch($action) {
        case 'viewProfile':
  				$urlparts = explode("/",$_SERVER["REDIRECT_URL"]);
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

  			case 'changeStatusProcess':
  				$urlparts = explode("/",$_SERVER["REDIRECT_URL"]);
  				$this->changeStatusProcess($urlparts[count($urlparts)-2]);
  				break;

        case 'deleteProfileProcessAdmin':
          $urlparts = explode("/",$_SERVER["REDIRECT_URL"]);
          $this->deleteProfileProcessAdmin($urlparts[count($urlparts)-1]);
          break;

        case 'deleteProfileProcessUser':
          $urlparts = explode("/",$_SERVER["REDIRECT_URL"]);
          $this->deleteProfileProcessUser($urlparts[count($urlparts)-1]);
          break;

  	// redirect to home page if all else fails
        default:
          header('Location: '.BASE_URL);
          exit();

      }

}

  //THis page we view the profile page, we query  the profile of the user
	//following and we include a view where we can see the posts of everybody we follow and
	//the posts of them
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

		 //query for the follower
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

	//edits the profile of the user by changing any of the fields
	public function editProfile($username) {
		$pagename = 'Edit Profile Page';
		$u =  User::loadByUsername($username);
		//redirects back to home
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProfile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

//edits the profile and changes the mentioned fields in the database and resets all of the
//changed fields themselves
public function editProfileProcess($username) {
  $first_name = $_POST['first_name'];
  $last_name = $_POST['last_name'];
  $email = $_POST['email'];
  $bio = $_POST['bio'];
  $age = $_POST['age'];
  $profpic = $_POST['profpic'];
  $pw = $_POST['pw'];
  //checks for data validation
  if(!isset($first_name) || trim($first_name) == '' || !isset($last_name) || trim($last_name) == '' || !isset($email) || trim($email) == ''
  || !isset($bio) || trim($bio) == '' || !isset($age) || trim($age) == '' || !isset($profpic) || trim($profpic) == '' || !isset($pw) || trim($pw) == '') {

  	header('Location: '.BASE_URL.'/error');
    exit();

  }

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

//edits the profile and changes the mentioned fields in the database and resets all of the
//changed fields themselves
public function changeStatusProcess($username) {
  $status = $_POST['status'];

  //load the product, record updates, and save to the database
  $u = User::loadByUsername($username);
  $u->set('status', $status);
  $u->save();

  session_start();
  $_SESSION['msg'] = "You edited the profile called ".$title;
  header('Location: '.BASE_URL.'/profile/'.$username);

  }


/* the admin will be able to delete any users profile
   nothing will happen to their current session*/
public function deleteProfileProcessAdmin($id){

	// delete user from the database
	$q = sprintf("DELETE FROM user WHERE id = %d",
		mysql_real_escape_string($id)
	);
	mysql_query($q);

	//FROM `user` WHERE `user`.`id` = 8"?

	session_start();
	$_SESSION['msg'] = "You deleted the profile called ".$title;
	header('Location: '.BASE_URL.'/paintings');
}

/*the user may delete their own profile (including the admin).
  their session will termiante and their username and other data
	will be removed from the database */
public function deleteProfileProcessUser($id){
	$p = User::loadById($id);

	// If it's desired to kill the session, also delete the session cookie.
	// Note: This will destroy the session, and not just the session data!
	if (ini_get("session.use_cookies")) {
	    $params = session_get_cookie_params();
	    setcookie(session_name(), '', time() - 42000,
	        $params["path"], $params["domain"],
	        $params["secure"], $params["httponly"]
	    );
	}
	// Finally, destroy the session.
	session_destroy();

	// delete user from the database
	$q = sprintf("DELETE FROM user WHERE id = %d ",
		mysql_real_escape_string($id)
	);
	mysql_query($q);

	session_start();
	$_SESSION['msg'] = "You deleted the profile called ".$title;
	header('Location: '.BASE_URL.'');
	}
}
