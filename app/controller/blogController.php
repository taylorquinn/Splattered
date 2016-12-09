<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a ProductController and route it
$pc = new BlogController();
$pc->route($action);


class BlogController {

	// route us to the appropriate class method for this action
	public function route($action) {
		if(!isset($_SESSION['user']) || $_SESSION['user'] == '') {
					session_start();
				}
		switch($action) {
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

    // redirect to home page if all else fails
   		default:
    		  	header('Location: '.BASE_URL);
    	 	 	exit();
		}

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
