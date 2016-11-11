<div id="content2">

  <?php  echo var_dump($p->get('first_name'))?>
  <!-- the blog image with its title -->
  <div class="banner">
      <img class="blog_image" src="<?= BASE_URL ?>/public/img/<?= $b->get('image_url') ?> " alt="image relating to the blog" />
      <div class="bannerText">
        <p class="blog_title"> <?= $p->get('first_name') ?></p>

      </div>
  </div>

  <!-- the description of the blog -->
  <div class="blog_description">
   <!-- <h4>Full Post</h4>-->
    <p class = "blog-text"> <?= $p->get('last_name') ?></p>
  </div>

<!--<div id="myDeletePopup" class="popup">

 		<div class="popup-content">
	  		    <span class="close" onclick="deleteClose()">×</span>


	  		   <form  method="POST">



				</form>

	  		    <form  action="<?= BASE_URL ?>/paintings/delete" method="POST">
	  		  	  <h2>Are you sure you want to delete this?</h2>


	  		   	 <input type="id_number" value="15" id="id_number" name= "id_number"/>


				  <input class= "close1" type="submit" value="Delete" />

				</form>
				  <button class= "close" onclick="deleteClose()">Cancel</button>



		</div>

</div>-->
