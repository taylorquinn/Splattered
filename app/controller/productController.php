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
				$this->addProductProcess();
				break;

			case 'checkout':
				$this->checkout();
				break;

			// handles blog section
			case 'blogs':
	 			$this->blogs();
	 			break;

	 		case 'viewBlog':
			    $productID = $_GET['pid'];
	 				$this->viewBlog($productID);
	 				break;

			case 'addBlogProcess':
			    $this->addBlogProcess();
					break;



      // redirect to home page if all else fails
     		default:
      		  	header('Location: '.BASE_URL);
      	 	 	exit();
			}

	}



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

	public function addProductProcess() {
		//echo "CONNECTED";
		$id = 1;
		$title = $_POST['title'];
		$description = $_POST['description'];
		$sizes = $_POST['sizes'];
		$price = $_POST['price'];
		$img_url = $_POST['img_url'];


	// create product
	/*	$newProduct = new Product();
		$newProduct->set('title','Sweatshirt');*/


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

	public function blogs() {
		$pageName = 'Blogs';

    $blogs = Blog::getAllProducts();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/blogs.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function viewBlog($id) {
		$pageName = 'Single Blog';

    $b = Blog::loadById($id);
		

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/single_blog.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

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
		$b->save();

		session_start();
		$_SESSION['msg'] = "You added the blog called ".$title;
		header('Location: '.BASE_URL.'/blogs');
	}

}
