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

			// handles blog section
			case 'blogs':
	 			$this->blogs();
	 			break;


			case 'addBlogProcess':
			    $this->addBlogProcess();
					break;

			case 'viewBlog':
			  	  $productID = $_GET['pid'];
	 				$this->viewBlog($productID); //should send in the username as the id
	 				break;
			case 'follow':
					$id = $_GET['pid'];
					$this->followUser($id);
					break;
			case 'unfollow':
					$id = $_GET['pid'];
					$this->unfollowUser($id);
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

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/paintings.tpl';
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

	public function getVizData() {
		// get all blog posts
		$blogs = Product::getAllProducts();

		$blogs = array(); // array to hold json shirts

		foreach($blogs as $blog) {
			// get comments for this post
			$reviews = Comment::fetchByPostId($blog->get('id'));

			$jsonReviews = array(); // array to hold json reviews

			if(count($reviews) > 0) {
				foreach($reviews as $review) {
					$reviewText = $review->get('comment');
					// truncate if needed to fit into visualization
					if(strlen($reviewText) > 20)
						$reviewText = substr($reviewText, 0, 20).'...';

					// the json review object
					$jsonReview = array(
						'name' => $reviewText,
						'type' => 'review',
						'parent' => $shirt->get('title')
					);
					$jsonReviews[] = $jsonReview;
				}

				// the json shirt object w/ children
				$jsonShirt = array(
					'name' => $shirt->get('title'),
					'type' => 'shirt',
					'id' => $shirt->get('id'),
					'parent' => 'shirts',
					'children' => $jsonReviews
				);

			} else {
				// the json shirt object w/ no children
				$jsonShirt = array(
					'name' => $shirt->get('title'),
					'type' => 'shirt',
					'id' => $shirt->get('id'),
					'parent' => 'shirts'
				);
			}

			$jsonShirts[] = $jsonShirt;
		}

		// finally, the json root object
		$json = array(
			'name' => 'shirts',
			'parent' => 'null',
			'children' => $jsonShirts
		);

		header('Content-Type: application/json');
		echo json_encode($json);
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

		//header('Location: '.BASE_URL);


						/*
		mysql_select_db($database);

		$q = sprintf("SELECT * FROM product WHERE id = %d ",
			mysql_real_escape_string($id)
		);
		$result = mysql_query($q);

		$product = array();
		while($row = mysql_fetch_assoc($result)) {
			$product['title'] = $row['title'];
			$product['description'] = $row['description'];
			$product['sizes'] = $row['sizes'];
			$product['price'] = $row['price'];
			$product['img_url'] = $row['img_url'];
		}

*/
		}


		//view product based on the product id
	public function viewProduct($id) {
		$pageName = 'Product';

		$p = Product::loadById($id);

		// $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		// 	or die ('Error: Could not connect to MySql database');
		// mysql_select_db(DB_DATABASE);
		//
		// $q = sprintf("SELECT * FROM product WHERE id = %d; ",
		// 	$id
		// 	);
		// $result = mysql_query($q);

		//while($row = mysql_fetch_assoc($result)) {
			// $product['title'] = $p->get('title');
			// $product['description'] = $p->get('description');
			// $product['sizes'] = $p->get('sizes');
			// $product['price'] = $p->get('price');
			// $product['img_url'] = $p->get('img_url');
		//}


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


		// create product
		/*$newProduct = new Product();
		$newProduct->set('title','Sweatshirt');*/


		/*	$newProduct2 = new Product(
			array(
				'title' => $title,
				'description' => $description,
				'price' => $price,
				'img_url' => $img_url,
				'creator_id'=>1

			)
		);
		$newProduct2->save();*/

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
		//
		//
		// // connect to DATABASE FIRST
		// $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		// 	or die ('Error: Could not connect to MySql database');
		// mysql_select_db(DB_DATABASE);
		//
		// $q = sprintf("UPDATE product
		// 		SET title = '%s', description = '%s', sizes = '%s', price = %d, img_url = '%s'
		// 		WHERE id = %d ",
		// 		$title,
		// 		$description,
		// 		$sizes,
		// 		$price,
		// 		$img_url,
		// 		$id
		// 	);
		// 	echo $q;
		// 	mysql_query($q);

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


	// create product
	/*	$newProduct = new Product();
		$newProduct->set('title','Sweatshirt');*/

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


		$newProduct2->save();}


/*
		$p = Product::loadById($id);
		$p->set('title', $title);
		$p->set('description', $description);
		$p->set('sizes', $sizes);
		$p->set('price', $price);
		$p->set('img_url', $img_url);
		$p->save();
*/
		//
		//
		// // connect to DATABASE FIRST
		// $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		// 	or die ('Error: Could not connect to MySql database');
		// mysql_select_db(DB_DATABASE);
		//
		// $q = sprintf("UPDATE product
		// 		SET title = '%s', description = '%s', sizes = '%s', price = %d, img_url = '%s'
		// 		WHERE id = %d ",
		// 		$title,
		// 		$description,
		// 		$sizes,
		// 		$price,
		// 		$img_url,
		// 		$id
		// 	);
		// 	echo $q;
		// 	mysql_query($q);

		session_start();
		$_SESSION['msg'] = "You edited the product called ".$title;
		header('Location: '.BASE_URL);
		$this->paintings();
	}

	//adds the blogs to the database
	public function blogs() {
		$pageName = 'Blogs';

    $blogs = Blog::getAllProducts();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/blogs.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	//views the blogs of the database
	public function viewBlog($id) {
		$pageName = 'Single Blog';

   		$b = Blog::loadById($id);


		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/single_blog.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}


	//adds the blog to the database and then we will
	// move the data and basically change the data
	public function addBlogProcess()
	{
		$title = $_POST['title'];
		$description = $_POST['description'];
		$full_post = $_POST['full_post'];
		$image_url = $_POST['image_url'];


		$b = new Blog();

		//load the product, make updates, and save to the database
		$b->set('title', $title);
		$b->set('description', $description);
		$b->set('full_post', $full_post);
		$b->set('id', $id);
		$b->set('image_url', $image_url);
		$b->set('username', $_SESSION['user']);

		$b->save();

		session_start();
		$_SESSION['msg'] = "You added the blog called ".$title;
		header('Location: '.BASE_URL.'/blogs');
	}

}
