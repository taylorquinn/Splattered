<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a ProductController and route it
$pc = new ProductController();
$pc->route($action);


class ProductController {

	// route us to the appropriate class method for this action
	public function route($action) {
		if(!isset($_SESSION['user']) || $_SESSION['user'] == '') {
			session_start();
		}
		switch($action) {
			case 'products':
        $productType = $_GET['ptype'];
        if($productType == 'paintings') {
				    $this->paintings();
        }
         else if($productType == 'photographs') {
				    $this->photographs();
        }
				break;



			case 'viewProduct':
     		   $productID = $_GET['pid'];
				$this->viewProduct($productID);
				break;


			case 'deleteProduct':
			// $productID = $_GET['pid'];
				$this->deleteProduct();
				break;

			case 'editProduct':

					$productID = $_GET['pid'];
					$this->editProduct($productID);
					break;

			case 'deleteBlog':
				$blogID = $_POST['id'];
				$title = $_POST['title'];
				$this->deleteBlogProcess($blogID, $title);
				break;

			case 'popupProduct':

     		   $productID = $_GET['pid'];
				$this->viewProduct($productID);
				break;

			case 'editProductProcess':
				$productID = $_GET['pid'];
				$this->editProductProcess($productID);
				break;

			case 'addProduct':
					$this->addProduct();
					break;

			case 'addProductProcess':
			 	echo "CONNECTED";
				$this->addProductProcess();
				break;

			case 'checkout':
				$this->checkout();
				break;

			case 'follow':
					$id = $_GET['pid'];
					$this->followUser($id);
					break;

			case 'showComments':
					$id = $_GET['pid'];
					$this->showComments($id);
					break;

			case 'unfollow':
					$id = $_GET['pid'];
					$this->unfollowUser($id);
					break;

      case 'getVizData':
				$this->getVizData();
				break;

      case 'editTitleProcess':
				$blogID = $_POST['id'];
				$title = $_POST['title'];
				$this->editTitleProcess($blogID, $title);
				break;

      case 'addCommentProcess':
        $postID = $_POST['id'];
				$comment = $_POST['comment'];
				$this->addCommentProcess($postID, $comment);
				break;

      // redirect to home page if all else fails
     		default:
      		  	header('Location: '.BASE_URL);
      	 	 	exit();
			}

	}


	// this method essentially gives the $pid for the user to  follow and then we
	//carry this and essentially uses the users pid and person we are following
	//and use the pid and then query the follow table.
	public function followUser($pid) {
			$myUsername =  User::loadByUsername($_SESSION['user']);

			$followUser = User::loadById($pid);

			$userVariable = $pid;
			$myUser = $myUsername->get('id');
			$sql = "INSERT INTO `follow` (`follower_id`, `followed_id`)
			VALUES ('$myUser', '$userVariable')";
			$result = mysql_query($sql);

      if(isset($_SESSION['user'])) {

        $username = $_SESSION['user'];
        $q = "SELECT * FROM post WHERE username='$username' ";
        $result = mysql_query($q);
      }

			$_SESSION['msg'] = "You followed the user ".$followUser->get('username');
			header('Location: '.BASE_URL.'/profile/'.$followUser->get('username'));
	}


	// this method essentially gives the $pid for the user to  follow and then we
	//carry this and essentially uses the users pid and person we are following
	//and use the pid and then query the follow table.
	public function unfollowUser($pid) {
		$myUsername = User::loadByUsername($_SESSION['user']);
		$unfollowUser = User::loadById($pid);

		$userVariable = $pid;
		$myUser = $myUsername->get('id');
		$q = sprintf("DELETE FROM follow WHERE follower_id = %d AND followed_id = %d  ",
			mysql_real_escape_string($myUser), mysql_real_escape_string($userVariable));

	 mysql_query($q);

   if(isset($_SESSION['user'])) {

     $username = $_SESSION['user'];
     $q = "SELECT * FROM post WHERE username='$username' ";
     $result = mysql_query($q);
   }

	 $_SESSION['msg'] = "You unfollowed the user ".$unfollowUser->get('username');
	 header('Location: '.BASE_URL.'/profile/'.$unfollowUser->get('username'));

	}

	//returns the page for the paintings.
  public function paintings() {
		$pageName = 'Paintings';

		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$q = "SELECT * FROM product ORDER BY date_created; ";
		$result = mysql_query($q);

  //  $this->getVizData();

		include_once SYSTEM_PATH.'/view/header.tpl';
		 include_once SYSTEM_PATH.'/view/paintings.tpl';
		 include_once SYSTEM_PATH.'/view/footer.tpl';
  }


  	//returns the page for the paintings.
  public function photographs() {
		$pageName = 'Photographs';

		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$q = "SELECT * FROM product ORDER BY date_created; ";
		$result = mysql_query($q);

    // $this->getVizData();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/photographs.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function checkout() {
		$pageName = 'Checkout';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/checkout.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }


  public function working() {
		$pageName = 'Working';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/working.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

   public function blogvisualization() {
		$pageName = 'Working';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/blogvisualization.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function getVizData() {
		// get all blog posts
		$blogs = Blog::getAllProducts();

		$jsonBlogs = array(); // array to hold json blogs

		foreach($blogs as $blog) {
			// get comments for this post
			$comments = Comment::fetchByPostId($blog->get('id'));

			// $jsonComments = array(); // array to hold json comments
      //
			if(count($comments) > 0) {
			// 	foreach($comments as $comment) {
			// 		$commentText = $comment->get('comment');
			// 		// truncate if needed to fit into visualization
			// 		if(strlen($commentText) > 20)
			// 			$commentText = substr($commentText, 0, 20).'...';
      //
			// 		// the json comment object
			// 		$jsonComment = array(
			// 			'name' => $commentText,
			// 			'type' => 'comment',
			// 			'parent' => $blog->get('title')
			// 		);
			// 		$jsonComments[] = $jsonComment;
			// 	}

				// the json blog object w/ children
				$jsonBlog = array(
					'name' => $blog->get('title'),
					'type' => 'blog',
					'id' => $blog->get('id'),
          'size' => count($comments),
					'parent' => 'blogs',
					// 'children' => $jsonComments
				);

			} else {
				// the json shirt object w/ no children
				$jsonBlog = array(
					'name' => $blog->get('title'),
					'type' => 'blog',
					'id' => $blog->get('id'),
          'size' => 0,
					'parent' => 'blogs'
				);
			}

			$jsonBlogs[] = $jsonBlog;
		}

		// finally, the json root object
		$json = array(
			'name' => 'blogs',
			'parent' => 'null',
      'size' => count($blogs),
			'children' => $jsonBlogs
		);

		header('Content-Type: application/json');
		echo json_encode($json);
	}

  public function editTitleProcess($id, $title) {
		header('Content-Type: application/json');

		// title can't be blank
		if($title == '') {
			$json = array('error' => 'Title cannot be blank.');
			echo json_encode($json);
			exit();
		}

		$product = Blog::loadById($id);
		$product->set('title', $title);
		$product->save();

		// success! print the JSON
		$json = array('success' => 'success');
		echo json_encode($json);
		exit();
	}

	public function deleteBlogProcess($id, $title) {
		header('Content-Type: application/json');

		// title can't be blank
		if($title == '') {
			$json = array('error' => 'Title cannot be blank.');
			echo json_encode($json);
			exit();
		}

		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

    $conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);

		$query = "DELETE FROM `post` WHERE `title` = '$title'";

		mysql_query($query);

		// success! print the JSON
    $json = array('success' => 'success');
    echo json_encode($json);
    exit();
	}

	public function showComments($id) {
		$comments = Comment::fetchByPostId($id);
		$jsonComments = array(); // array to hold json blogs

		foreach($comments as $comment) {
			$commentText = $comment->get('comment');
			// truncate if needed to fit into visualization
			if(strlen($commentText) > 20)
				$commentText = substr($commentText, 0, 20).'...';

			// the json comment object
			$jsonComment = $commentText;
			$jsonComments[] = $jsonComment;

		}
		echo json_encode($jsonComments);

	}
  public function addCommentProcess($id, $comment) {
    header('Content-Type: application/json');

    $name = $_SESSION['user'];

    // name can't be blank
    if($name == '') {
      $json = array('error' => 'Username cannot be blank.');
      echo json_encode($json);
      exit();
    }

    // comment can't be blank
    if($comment == '') {
      $json = array('error' => 'Comment cannot be blank.');
      echo json_encode($json);
      exit();
    }

    // echo "$name ";
    // echo "$id ";
    // echo "$comment ";

    $host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);

    // $query = mysql_query("INSERT INTO postcomments(post_id, comment, user_name) values('$id', '$comment', '$name') ");
    $query = "INSERT INTO `postcomments` (`post_id`, `comment`, `user_name`) VALUES ('$id', '$comment', '$name')";
    mysql_query($query);

    // success! print the JSON
    $json = array('success' => 'success');
    echo json_encode($json);
    exit();
  }

	//when we add the product we add the fields, check them for validation and the products to
	//the database
  public function addProduct() {
  		$id = 1;
		$pageName = 'Add Product';

		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);

		$q = sprintf("SELECT * FROM product WHERE id = %d ",
			mysql_real_escape_string($id)
		);

		//The result query essentially helps us to

		$result = mysql_query($q);

		$product = array();
		while($row = mysql_fetch_assoc($result)) {
			$product['title'] = $row['title'];
			$product['description'] = $row['description'];
			$product['sizes'] = $row['sizes'];
			$product['price'] = $row['price'];
			$product['img_url'] = $row['img_url'];
		}

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/add.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';


	}

	public function deleteProduct() {
		$id = (int)$_POST['id_number'];



		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;




		$conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);


		$query = sprintf("DELETE FROM product WHERE id = %d", $id, $conn);
		mysql_query($query);

		header('LOCATION: '.BASE_URL."/paintings");
		}


		//view product based on the product id
	public function viewProduct($id) {
		$pageName = 'Product';
		$p = Product::loadById($id);
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/product.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }



	//edit pproduct page that changes the fields of the products
	//checks for data validation and also edits the product
	public function editProduct($id) {
		if(session_id() == '' || !isSet($_SESSION)){
			session_start();
		}


		$pageName = 'Edit Product';

		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);

		$q = sprintf("SELECT * FROM product WHERE id = %d ",
			mysql_real_escape_string($id)
		);
		$result = mysql_query($q);

		//array for the product info
		$product = array();
		while($row = mysql_fetch_assoc($result)) {
			$product['title'] = $row['title'];
			$product['description'] = $row['description'];
			$product['sizes'] = $row['sizes'];
			$product['price'] = $row['price'];
			$product['img_url'] = $row['img_url'];
		}

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}



	//edit product - queries the data and uses the id to post the
	//new product to the database
	public function editProductProcess($id) {
		$title = $_POST['title'];
		$description = $_POST['description'];
		$sizes = $_POST['sizes'];
		$price = $_POST['price'];
		$img_url = $_POST['img_url'];

		//edit product - queries the data and uses the id to post the
		//new product to the database
		if($title!=''&&$description!=''&&$sizes!=''&&$price!=''&&$img_url!=''){
		$p = Product::loadById($id);
		$p->set('title', $title);
		$p->set('description', $description);
		$p->set('sizes', $sizes);
		$p->set('price', $price);
		$p->set('img_url', $img_url);
		$p->save();
		}

		session_start();
		$_SESSION['msg'] = "You edited the product called ".$title;

		header('LOCATION: '.BASE_URL."/paintings");
		//$this->paintings();
	}

	//edit product - queries the data and uses the id to post the
	//new product to the database
	public function addProductProcess() {
		echo "CONNECTED";
		$id = 1;
		$title = $_POST['title'];
		$description = $_POST['description'];
		$sizes = $_POST['sizes'];
		$price = $_POST['price'];
		$img_url = $_POST['img_url'];

		//checks to see if the products are null
		if($title!=''&&$description!=''&&$sizes!=''&&$price!=''&&$img_url!=''){
		$newProduct2 = new Product(
			array(
				'title' => $title,
				'description' => $description,
				'price' => $price,
				'img_url' => $img_url,
				'creator_id'=>1

			)
		);


		$newProduct2->save();
	}
		session_start();
		$_SESSION['msg'] = "You edited the product called ".$title;
		header('Location: '.BASE_URL."/paintings");
		$this->paintings();
	}
}
