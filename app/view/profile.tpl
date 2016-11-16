<div id="content2">

  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

      <img class="large-img" alt = "the users profile picture" src="<?= BASE_URL ?>/public/img/<?= $p->get('profpic')?>" style="width:35%; padding: 20px 40px;" >

        <ul class="product-checkout">

          <li><p class="name"> <?= $p->get('first_name') ?> <?= $p->get('last_name') ?></p></li>

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
             <!-- display email, age and bio of the person-->

          </div></li>

          <li> <div id="user_status">
          	<?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {
           	 $b = User::loadByUsername($_SESSION['user']);

           	 $userstatus = $p->get('status');
             $curr_username = $p->get('username');

			 if(($b->get('status') == 2) && ($curr_username != ($_SESSION['user']))) {

            echo'

            <form id="change-status" action="',BASE_URL,'/profile/changeStatus/',$curr_username,'/process" method="POST">
              <select name="status">
                <option selected="selected">
                  ',$userstatus,'
                </option>
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
              </select>
            <input type="submit" class="edit-button" value="Change status" id="button" style="margin-left: 20%;
                      margin-top: 2px;
                      display: block;
                      margin-bottom: 20px;
                      margin-left:0px;"/>
profile/changeStatus/(.*)/process?$
			</form>';

		 }} ?>


		</div></li>

           <li><p class="checkout-price" style="font-weight:bold; font-style:oblique"> <?= $p->get('email') ?></p></li>
          <li><p class="checkout-price" style="font-weight:bold"> <?= $p->get('age') ?></p></li>
          <li><p class="checkout-price"></p><?= $p->get('bio') ?></li>
        </ul>



</div>



<div style="margin-bottom: 10px; height: 475px; overflow-x: hidden; width:50%;" id="activity_feed" >
	 <h2>Activity Feed</h2>

	  <h3><?= $p->get('first_name') ?>'s articles posted</h3>
	 <?php while($row = mysql_fetch_assoc($result)): ?>
	   <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> " > <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	 <?php endwhile; ?>


	  <h3><?= $p->get('first_name') ?>'s comments</h3>
	   <?php
	     $q = "SELECT * FROM postcomments WHERE user_name='$username' ";
	     $result = mysql_query($q);
	   ?>
	   <?php while($row = mysql_fetch_assoc($result)): ?>
	     <a href="<?= BASE_URL ?>/blogs/view/<?= $row['post_id'] ?> "> <p class = "blog-author"> <?= $row['comment'] ?></p> </a>
	   <?php endwhile; ?>

     <!-- This displays  the user's products and the profile feed for the user-->

	   <h3>Products <?= $p->get('first_name') ?> added</h3>
	   <?php
	     $uid = $p->get('id');
	     $q = "SELECT * FROM product WHERE creator_id=$uid ";
	     $result = mysql_query($q);
	   ?>
	   <?php while($row = mysql_fetch_assoc($result)): ?>
	     <a href="<?= BASE_URL ?>/paintings/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	   <?php endwhile; ?>
</div>

<!-- The logic to display the people following the user and their followers-->

<div id="follows">
	   <div style= "height: 200px;
    		overflow-y: scroll;
   	 		margin-left: 40px;
    		float: left;
    		width: 40%;
  	  		margin-bottom: 10px;"
    		class = "followed">
	     <h2 style="float: left; margin-left: 20px; font-size:24px; width:40%">Following:</h2>

       <!-- Display the info for each of the people that follow you -->

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

               <li style="    display: inline;
     						 float: right;">

                 <!-- Display the button to unfollow if you are the user and this is your profile-->

               <?php if($_SESSION['user'] == $p->get('username')): ?>


			       <li style="    display: inline;
   						 float: left;">
                     <a class = "followLink" href = "<?= BASE_URL ?>/unfollow/<?= $row['followed_id'] ?>"><button class = "buttonFollow buttonFollow2 bt">Unfollow</button></a>

             </li>
             <?php endif; ?>
           </div>


		       </ul>
	    <?php endwhile; ?>
	   </div>

     <!-- Display the logic for the people that follow you-->

	   <div class = "follower" style= "height: 200px;
    		overflow-y: scroll;
   	 		margin-left: 40px;
    		float: left;
    		width: 40%;
  	  		margin-bottom: 10px;">
	     <h2 style="float: left; margin-left: 20px; font-size:24px; width:40%">Followers</h2>
       <!-- Display the logic for the people that follow you, go throught each of the peoples data-->

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

     <!-- Display the blogs hyperlinked to their pages-->

	<?php while($row = mysql_fetch_assoc($result)): ?>

	  <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
	<?php endwhile; ?>
</div>
