<style>

.bgimg-1{
  position: relative;
  opacity: 0.9;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}

.bgimg-1 {
  background-image: url("<?= BASE_URL ?>/public/img/blogheader.jpg");
  min-height: 500px;
}

.caption {
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  text-align: center;
  color: #000;
}

.caption span.border {
  background-color: #111;
  color: #fff;
  padding: 18px;
  font-size: 25px;
  letter-spacing: 10px;
}

</style>





<div id="content3">


<!-- the header image -->

<?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {?>
    <div id="header_image2">
  <?php  echo '

  <div class="bgimg-1">
  <div class="caption">
  
    <span class="border">BLOGS</span>

  </div>
</div>

 <!-- <a class = "editButton" href ="',BASE_URL,'/paintings"><button class="button3" src="',BASE_URL,'/public/img/plus.jpg"></button></a>-->
  <a class = "editButton" href ="',BASE_URL,'/blogvisualization"><img class="add-button2" src="',BASE_URL,'/public/img/circles.jpg" alt="circles"
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
        <?php  echo '

         <div class="bgimg-1">
            <div class="caption">
            
              <span class="border">BLOGS</span>

            </div>
          </div>

        <a class = "editButton" href ="',BASE_URL,'/blogvisualization"><img class="add-button2" src="',BASE_URL,'/public/img/circles.jpg" alt="circles"
      style="width: 50px;
     padding: 10px;
     float: right;" /></a>


        </div>'; ?>

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
