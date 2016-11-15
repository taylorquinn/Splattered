<div id="content2">

  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

      <img class="large-img" alt = "the users profile picture" src="<?= BASE_URL ?>/public/img/<?= $p->get('profpic')?>" >

        <ul class="product-checkout">

          <li><p class="name"> <?= $p->get('first_name') ?> <?= $p->get('last_name') ?></p></li>
          <li><p class="name"> <?= $p->get('email') ?></p></li>
          <li><p class="name"> <?= $p->get('age') ?></p></li>
          <li style="margin-left: 40%; display: inline-block;">
          	<div id= "follower_button">
					 <!-- if the user is on their profile, display an edit button-->
						<?php if($_SESSION['user'] == $p->get('username')): ?>
						<button class="edit_profile"><a class = "buttonFollow buttonFollow2" href ="<?= BASE_URL ?>/profile/edit/<?= $_SESSION['user'] ?>">Edit</a></button>
						<?php endif; ?>
			        <?php if(isset($_SESSION['user'])): ?>
			          <?php if($_SESSION['user'] != $p->get('username')): ?>

			                <?php if($following == false): ?>
			                                <button class="buttonFollow buttonFollow2"><a class = "followLink" href = "<?= BASE_URL ?>/follow/<?= $p->get('id') ?>">Follow</a></button>
			                <?php endif; ?>
			                <?php if($following == true): ?>
			                                <button class="buttonFollow buttonFollow2"><a class = "followLink" href = "<?= BASE_URL ?>/unfollow/<?= $p->get('id') ?>">Unfollow</a></button>
			                <?php endif; ?>
			          <?php endif; ?>
			       <?php endif; ?>
          </div></li>
          <li><p class="checkout-price"></p><?= $p->get('bio') ?></li>
        </ul>



</div>



<div style="margin-bottom: 10px; height: 475px; overflow-x: hidden; width:50%;" id="activity_feed" >
	 <h2>Activity Feed</h2>
	  <h3>Your articles posted</h3>
	 <?php while($row = mysql_fetch_assoc($result)): ?>
	   <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> " > <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	 <?php endwhile; ?>

	  <h3>Your comments</h3>
	   <?php
	     $q = "SELECT * FROM postcomments WHERE user_name='$username' ";
	     $result = mysql_query($q);
	   ?>
	   <?php while($row = mysql_fetch_assoc($result)): ?>
	     <a href="<?= BASE_URL ?>/blogs/view/<?= $row['post_id'] ?> "> <p class = "blog-author"> <?= $row['comment'] ?></p> </a>
	   <?php endwhile; ?>


	   <h3>Products you added</h3>
	   <?php
	     $uid = $p->get('id');
	     $q = "SELECT * FROM product WHERE creator_id=$uid ";
	     $result = mysql_query($q);
	   ?>
	   <?php while($row = mysql_fetch_assoc($result)): ?>
	     <a href="<?= BASE_URL ?>/paintings/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	   <?php endwhile; ?>
</div>

<div id="follows">
	   <div style= "height: 200px;
    		overflow-y: scroll;
   	 		margin-left: 40px;
    		float: left;
    		width: 40%;
  	  		margin-bottom: 10px;"
    		class = "followed">
	     <h2 style="float: left; margin-left: 20px; font-size:24px; width:40%">Followed by:</h2>

		     <?php while($row = mysql_fetch_assoc($followed)): ?>
		       <?php
		       $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		         or die ('Error: Could not connect to MySql database');
		       mysql_select_db(DB_DATABASE);

		       $prof = User::loadById($row['followed_id']);
		       $followedUser = $prof->get('username');       ?>

		       <div class = "followcard" style="width:100%; float:left">

		     <!--  <span class =  "userFollowing">-->
		       <ul style="
		       		list-style: none;
					    margin-left: 0px;
					    display: inline;">
			       <li style= ""><a style="float: left; display: inline; margin-left: 20px; font-size:22px" href="<?= BASE_URL ?>/profile/<?= $followedUser ?> "><?= $followedUser?></a>
			       <a class = "followLink" href = "<?= BASE_URL ?>/unfollow/<?= $row['followed_id'] ?>"></li>

               <?php if($_SESSION['user'] == $p->get('username')): ?>

			       <li style="    display: inline;
   						 float: right;">
                     <a class = "followLink" href = "<?= BASE_URL ?>/unfollow/<?= $row['followed_id'] ?>"><button class = "buttonFollow buttonFollow2 bt">Unfollow</button></a>
             </div></li>
             <?php endif; ?>

		       </ul>
	    <?php endwhile; ?>
	   </div>
	   <div class = "follower" style= "height: 200px;
    		overflow-y: scroll;
   	 		margin-left: 40px;
    		float: left;
    		width: 40%;
  	  		margin-bottom: 10px;">
	     <h2 style="float: left; margin-left: 20px; font-size:24px; width:40%">Followers</h2>
	     <?php while($row1 = mysql_fetch_assoc($follower)): ?>
	       <?php
	       $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
	         or die ('Error: Could not connect to MySql database');
	       mysql_select_db(DB_DATABASE);

	       $prof = User::loadById($row1['follower_id']);
	       $followedUser1 = $prof->get('username');       ?>

	       <div class ="userFollowing">
	       <a style="float: left; width:100%; text-align: left; margin-left: 20px; font-size:22px" href="<?= BASE_URL ?>/profile/<?= $followedUser1 ?> "><?= $followedUser1 ?></a>
	       </div>
	   <?php endwhile; ?>


	<?php while($row = mysql_fetch_assoc($result)): ?>

	  <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	<?php endwhile; ?>
</div>
