<div id="content3">

<!-- the header image -->
  <div id="header_image2">
  <?php  echo '<img class="head-image2" src="',BASE_URL,'/public/img/blog.jpg" alt="Header image" />'; ?>
  </div>



<!-- this will be a place to add a blog -->

<?php
if(isset($_SESSION['user']))
{
 $p = User::loadByUsername($_SESSION['user']);
  if($p->get('status') != 0) {
  echo '<div id="add_blog">

  <h2>Add a Blog Post</h2>

  <!--the form for submitting the information about a new prodcut including a title, description
      price and image url -->
  <form id="add_post" action="',BASE_URL,'/blogs/add/process" method="POST">

  <label>Title: <input type="text" name="title" value=""></label> <br><br>

  <label>Full Post: <textarea rows="10" name="full_post" cols="50"> </textarea></label> <br><br>

  <label>Description: <textarea rows="10" name="description" cols="50"> </textarea></label> <br><br>

  <label>Image URL: <input type="text" name="image_url" value=""></label> <br><br>





  <br><input type="submit" value = "Add Blog Post">



  </form>

</div>';
}
}
?>

<?php
foreach ($blogs as $b)
{
  echo '<div class="banner">
      <img class="blog_image" alt="'.$b->get("title").'" src="'.BASE_URL.'/public/img/'.$b->get("image_url").'">
      <a href="'.BASE_URL.'/blogs/view/'.$b->get("id").'"><div class="bannerText">
        <p class="blog_title">'.$b->get("title").'
        </p>
      </div></a>
  </div>

  <div class="blog_description">
    <h4>Description</h4>
    <p>'.$b->get("description").'</p>
  </div>';
}
?>


</div>
