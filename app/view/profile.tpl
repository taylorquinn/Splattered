<div id="content2">

  <?php  echo var_dump($p->get('username'))?>
  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

        <p class="title"> <?= $p->get('first_name') ?></p>
          <p class = "text"> <?= $p->get('last_name') ?></p>




          <?php
           if(!isset($_SESSION['email'])): ?>
          <li class = "header-list"><a  class = "link" <?= isSelected($pageName, 'login') ?> href = "<?=BASE_URL ?>/login">Login</a>

          </li>
          <li class = "header-list"><a <?= isSelected($pageName, 'register') ?> href = "<?=BASE_URL ?>/register" class = "link">Register</a></li>
          <?php endif; ?>










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
