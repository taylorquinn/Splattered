<div id="content3">

<svg></svg>
<form id="editShirtTitleForm" method="POST" action="<?= BASE_URL ?>/blogs/editTitle/">
  <label>Edit Title: <input type="text" id="editShirtTitle" name="title" value=""></label>
  <input type="hidden" id="editPostID" name="productID" value="">
  <input type="submit" name="submit" value="Edit">
  <button type="button" name="cancel">Cancel</button>
</form>
<form id="addCommentForm" method="POST" action="<?= BASE_URL ?>/blogs/addComment/">
  <label>Add Comment: <input type="text" id="addedComment" name="title" value=""></label>
  <input type="submit" name="submit" value="Edit">
  <button type="button" name="cancel">Cancel</button>
</form>

<!-- the header image -->

<?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {?>
    <div id="header_image2">
  <?php  echo '<img class="head-image2" src="',BASE_URL,'/public/img/blog.jpg" alt="Header image" />
 <!-- <a class = "editButton" href ="',BASE_URL,'/paintings"><button class="button3" src="',BASE_URL,'/public/img/plus.jpg"></button></a>-->
  <a class = "editButton" href ="',BASE_URL,'/paintings"><img class="add-button2" src="',BASE_URL,'/public/img/circles.jpg" alt="plus"
    style="width: 50px;
    padding: 10px;
    float: right;" /></a>

  <a class = "editButton" onclick="blogAppear()"><img class="add-button2" src="',BASE_URL,'/public/img/plus.jpg" alt="plus"
    style="width: 50px;
    padding: 10px;
    float: right;" />'; ?></a>


  <!--<a onclick="logoutAppear()"><u name = "log_in">Log out</u></a> -->


  </div>

  <?php }


  else {?>

      <div id="header_image2">
        <?php  echo '<img class="head-image2" src="',BASE_URL,'/public/img/blog.jpg" alt="Header image" />'; ?>

        </div>

  <?php } ?>





<!-- this will be a place to add a blog -->

<?php
if(isset($_SESSION['user']))
{
 $p = User::loadByUsername($_SESSION['user']);
  if($p->get('status') != 0) {
  echo '<div id="add_blog">

  

</div>';
}
}
?>

<div id="addBlogPopup" class="popup" style="height:100%; z-index:99; margin-top:-50px; overflow:scroll">

      <div class="popup-content">
            <span class="close" onclick="blogDisappear()">×</span>
              <h2 style="color:black">Add a Blog Post</h2>
            <!--the form for submitting the information about a new prodcut including a title, description
      price and image url -->
       <form id="add_post" action="<?= BASE_URL ?>/blogs/add/process" method="POST">

         <label>Title: <input type="text" name="title" value=""></label>

         <label>Full Post: <textarea rows="10" name="full_post" cols="50"> </textarea></label> 

       <label>Description: <textarea rows="3" name="description" cols="50"> </textarea></label> 

        <label>Image URL: <input type="text" name="image_url" value=""></label> 
        <input type="submit" value = "Add Blog Post">
        </form>

    </div>

</div>



 



<!-- loop through all of the blogs and display them
     uses the blog model class-->
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
    <p style="text-transform:none">'.$b->get("description").'</p>
  </div>';
}
?>


</div>