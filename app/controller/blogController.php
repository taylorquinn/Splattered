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
			  	  $blogID = $_GET['pid'];
	 				  $this->viewBlog($blogID); //should send in the username as the id
	 				  break;

      case 'editBlog':
			  	  $blogID = $_GET['pid'];
	 				  $this->editBlog($blogID); //should send in the username as the id
	 				  break;

      case 'editBlogProcess':
			  	  $blogID = $_GET['pid'];
	 				  $this->editBlogProcess($blogID); //should send in the username as the id
	 				  break;

      case 'deleteBlogProcess':
            $blogID = $_GET['pid'];
            $this->deleteBlogProcess($blogID); //should send in the username as the id
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
  public function addBlogProcess() {
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

  //allows the user to edit a blog posts
  public function editBlog($id) {
    $pageName = 'Edit Blog';

    //load the appropriate product by id
    $b = Blog::loadById($id);

    include_once SYSTEM_PATH.'/view/header.tpl';
    include_once SYSTEM_PATH.'/view/editBlog.tpl';
    include_once SYSTEM_PATH.'/view/footer.tpl';
  }

  public function editBlogProcess($id) {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $full_post = $_POST['full_post'];
    $image_url = $_POST['image_url'];

    //load the Blog, make updates, and save to the database
    $b = Blog::loadById($id);
    $b->set('title', $title);
    $b->set('description', $description);
    $b->set('full_post', $full_post);
    $b->set('image_url', $image_url);
    $b->save();

    session_start();
  	$_SESSION['msg'] = "You edited the blog called ".$title;
  	header('Location: '.BASE_URL.'/blogs');
  }

  // processes the deletion of the product
  public function deleteBlogProcess($id)
  {
    $b = Blog::loadById($id);

    $host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$conn = mysql_connect($host, $username, $password)
			or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);

    // delete from the database
    $q = sprintf("DELETE FROM post WHERE id = %d ",
      mysql_real_escape_string($id)
    );
    mysql_query($q);

    session_start();
    $_SESSION['msg'] = "You deleted the blog called ".$title;
    header('Location: '.BASE_URL.'/blogs');
  }

}
