<div id="content2">

  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

      <img class="large-img" alt = "the users profile picture" src="<?= BASE_URL ?>/public/img/<?= $p->get('profpic')?>" >

        <ul class="product-checkout">

          <li><p class="name"> <?= $p->get('first_name') ?> <?= $p->get('last_name') ?></p></li>
          <li style="margin-left: 40%; display: inline-block;">    
          	<div id= "follower_button">
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


<<<<<<< HEAD


<div style="margin-bottom: 10px; height: 400px; overflow-x: hidden " id="activity_feed">
	 <h2>Activity Feed</h2>
	 <?php while($row = mysql_fetch_assoc($result)): ?>
	   <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> " class = "article"> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	 <?php endwhile; ?>
</div>

<div id="follows">
	 <?php if($_SESSION['user'] == $p->get('username')): ?>
	   <div class = "followed">
	     <h1>Followed</h1>

	     <?php while($row = mysql_fetch_assoc($followed)): ?>
	       <?php
	       $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
	         or die ('Error: Could not connect to MySql database');
	       mysql_select_db(DB_DATABASE);

	       $prof = Profile::loadById($row['followed_id']);
	       $followedUser = $prof->get('username');       ?>

	       <div class = "followcard"><span class =  "userFollowing"><a href="<?= BASE_URL ?>/profile/<?= $followedUser ?> "><?= $followedUser ?></a></span><a class = "followLink" href = "<?= BASE_URL ?>/unfollow/<?= $row['followed_id'] ?>"><button class = "buttonFollow buttonFollow2 bt">Unfollow</button></a></div>
	    <?php endwhile; ?>
	   </div>
	   <div class = "follower">
	     <h1>Followers</h1>
	     <?php while($row1 = mysql_fetch_assoc($follower)): ?>
	       <?php
	       $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
	         or die ('Error: Could not connect to MySql database');
	       mysql_select_db(DB_DATABASE);

	       $prof = Profile::loadById($row1['follower_id']);
	       $followedUser1 = $prof->get('username');       ?>

	       <div class ="userFollowing"><a href="<?= BASE_URL ?>/profile/<?= $followedUser1 ?> "><?= $followedUser1 ?></a></div>
	   <?php endwhile; ?>
=======
 <?php if($_SESSION['user'] == $p->get('username')): ?>
   <h2>Activity Feed</h2>
   <?php while($row = mysql_fetch_assoc($result)): ?>
     <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> " class = "article"> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
   <?php endwhile; ?>

   <div class = "followed">
     <h1>Followed</h1>

     <?php while($row = mysql_fetch_assoc($followed)): ?>
       <?php
       $prof = Profile::loadById($row['followed_id']);
       $followedUser = $prof->get('username');       ?>

       <div class = "followcard"><span class =  "userFollowing"><a href="<?= BASE_URL ?>/profile/<?= $followedUser ?> "><?= $followedUser ?></a></span><a class = "followLink" href = "<?= BASE_URL ?>/unfollow/<?= $row['followed_id'] ?>"><button class = "buttonFollow buttonFollow2 bt">Unfollow</button></a></div>
    <?php endwhile; ?>
   </div>
   <div class = "follower">
     <h1>Followers</h1>
     <?php while($row1 = mysql_fetch_assoc($follower)): ?>
       <?php
       $prof = Profile::loadById($row1['follower_id']);
       $followedUser1 = $prof->get('username');       ?>

       <div class ="userFollowing"><a href="<?= BASE_URL ?>/profile/<?= $followedUser1 ?> "><?= $followedUser1 ?></a></div>
   <?php endwhile; ?>
   </div>
>>>>>>> ac0464f6c9ac061a04f769856aa39fe2cf573292

   <h3>Your comments</h3>
   <?php
     $q = "SELECT * FROM postcomments WHERE user_name='$username' ";
     $result = mysql_query($q);
   ?>
   <?php while($row = mysql_fetch_assoc($result)): ?>
     <a href="<?= BASE_URL ?>/blogs/view/<?= $row['post_id'] ?> "> <p class = "blog-author"> <?= $row['comment'] ?></p> </a>
   <?php endwhile; ?>

<<<<<<< HEAD
	   </div>
=======
   <h3>Products you added</h3>
   <?php
     $uid = $p->get('id');
     $q = "SELECT * FROM product WHERE creator_id=$uid ";
     $result = mysql_query($q);
   ?>
   <?php while($row = mysql_fetch_assoc($result)): ?>
     <a href="<?= BASE_URL ?>/paintings/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
   <?php endwhile; ?>
>>>>>>> ac0464f6c9ac061a04f769856aa39fe2cf573292

	 <?php endif; ?>

	<?php while($row = mysql_fetch_assoc($result)): ?>

	  <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	<?php endwhile; ?>
</div>
