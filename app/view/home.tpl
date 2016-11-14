
<div id ="activity_feed">
  <h2>Activity Feed</h2>
  <?php if(isset($_SESSION['user'])): ?>
    <h3>Your posts</h3>
    <?php while($row = mysql_fetch_assoc($result)): ?>
      <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
    <?php endwhile; ?>
    <?php
    $username = $_SESSION['user'];
    $uid = -1; // if the uid stays negative -1, there is no one logged in

    $q = "SELECT * FROM user WHERE username='$username' ";
    $result = mysql_query($q);

    $numberOfRows = mysql_num_rows($result);

    if($numberOfRows == 1) {
      $p = Profile::loadByUsername($username);
      $uid = $p->get('id');

      $q = "SELECT * FROM follow WHERE follower_id=$uid ";
      $result = mysql_query($q);
    } else {
      echo "NO USER IS LOGGED IN";
    }
    ?>
    <h3>People you follow</h3>
    <?php while($row = mysql_fetch_assoc($result)): ?>
      <?php
      $puser = Profile::loadById($row['followed_id']);
      ?>
      <a href="<?= BASE_URL ?>/profile/<?= $puser->get('username') ?> "> <p class = "blog-author"> <?= $puser->get('username') ?></p> </a>
    <?php endwhile; ?>
    <h3>Followers</h3>
    <?php
      $q = "SELECT * FROM follow WHERE followed_id=$uid ";
      $result = mysql_query($q);
    ?>
    <?php while($row = mysql_fetch_assoc($result)): ?>
      <?php
      $puser = Profile::loadById($row['follower_id']);
      ?>
      <a href="<?= BASE_URL ?>/profile/<?= $puser->get('username') ?> "> <p class = "blog-author"> <?= $puser->get('username') ?></p> </a>
    <?php endwhile; ?>
    <h3>Your comments</h3>
    <h3>Products you added</h3>
    <h3>Posts from people you follow</h3>
    <?php
    // $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
    //   or die ('Error: Could not connect to MySql database');
    // mysql_select_db(DB_DATABASE);
    $q = "SELECT * FROM follow WHERE follower_id=$uid ";
    $result = mysql_query($q);
    ?>
    <?php while($row = mysql_fetch_assoc($result)): ?>
      <?php
      // $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
      //   or die ('Error: Could not connect to MySql database');
      // mysql_select_db(DB_DATABASE);

      $prof = Profile::loadById($row['followed_id']);
      $followedUser = $prof->get('username');

      $qtwo = "SELECT * FROM post WHERE username='$followedUser' ";
      $resulttwo = mysql_query($qtwo);
      ?>
      <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
        <a href="<?= BASE_URL ?>/blogs/view/<?= $row2['id'] ?> "> <p class = "blog-author"> <?= $row2['title'] ?></p> </a>
      <?php endwhile; ?>
    <?php endwhile; ?>
    <h3>Comments on your posts</h3>
    <h3>People who follow your followers</h3>
    <h3>Comments made by people you follow</h3>
    <h3>Products added by people you follow</h3>
  <?php endif; ?>
</div>

<div id="header_image">
				<img class="head-image" src="<?= BASE_URL ?>/public/img/site_header.jpg" alt="Header image" />

				 <input type="button" class="shopnewarrivals" onclick="location.href='paintings'" value="Shop New Arrivals" />
			</div>
		</div>

	<div id= "tileImages">
		<ul id="tiles">

					<li><a href="paintings"> <img class="tile" src="<?= BASE_URL ?>/public/img/necklace.jpg" alt="Necklace" /> </a> </li>
						<!--edited from the image found here: https://www.google.com/search?sa=G&hl=en&q=side+braid&tbm=isch&tbs=simg:CAQSlQEJoIMPJccrmF0aiQELEKjU2AQaAggDDAsQsIynCBpiCmAIAxIo6RmGD7cPyhnJELQPoQ_1UEIoP1w_1eMNkw3zDgMOEwyCXiMPM71S7bMBowfjlhgnYthk6MjBxNqmzMtdnOX039F_18vRhoU7RcO-UtPcjMMStEtTzbhNEEa_1j24IAQMCxCOrv4IGgoKCAgBEgQ_1pMqMDA&ved=0ahUKEwjt1MnGia7PAhXEez4KHQD9CHgQwg4IGygA-->
					<li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/painting1.jpg" alt="Painting pic" /></a> </li>
						<!--edited from the image found here: https://lh3.googleusercontent.com/OCWLteVrjHjzDUVIRRIbIrbYZuYXXzTSz0a0akUn0V1u4WPICt3dmR8X28sen953deeSTFQ=s85-->
					<li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/stairs.jpg" alt="Home Decor" /></a> </li>
						<!--edited from the image found here: https://lh3.googleusercontent.com/7S9F_10_tSqAwFJNUV3a0KJ0e8c-XZxTp_hxWP-DBHmocVRL7yXbwzIrLPCJjm-zgLdRmA=s85-->

		</ul>
	</div>

			<div id="header_image2">
				<img class="head-image2" src="<?= BASE_URL ?>/public/img/cover_photo.jpg" alt="Header image" />
				 <input type="button" class="shopfavorites" onclick="location.href='paintings'" value="Shop Our Favorites" />
				 <!--edited from the image found here:  https://www.google.com/imgres?imgurl=http%3A%2F%2F67.media.tumblr.com%2Fac1a5aee391576c9bb410bd93d57550e%2Ftumblr_ndx3yvFet41qc91i1o1_1280.jpg&imgrefurl=http%3A%2F%2Fartistandstudio.tumblr.com%2Fpage%2F3&docid=Eun42Gye6mFtzM&tbnid=CmwQOamtM-yBFM%3A&w=1000&h=667&hl=en&bih=475&biw=1262&ved=0ahUKEwj__fKDia7PAhXEFj4KHZODDX0QMwgfKAEwAQ&iact=mrc&uact=8 -->
			</div>

	<div id="Favorites">

	<h2>Most Popular Items</h2>
	<div id="popular">
		<ul id="popular">

					<li><a href="paintings"> <img class="tile" src="<?= BASE_URL ?>/public/img/necklace.jpg" alt="Necklace" /> </a> </li>
					<li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/painting1.jpg" alt="Painting pic" /></a> </li>
					<li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/stairs.jpg" alt="Home Decor" /></a> </li>
					<li><a href="paintings"> <img class="tile" src="<?= BASE_URL ?>/public/img/necklace.jpg" alt="Necklace" /> </a> </li>
					<li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/painting1.jpg" alt="Painting pic" /></a> </li>

		</ul>
		</div>
		</div>
