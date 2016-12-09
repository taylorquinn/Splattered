<!--If logged in, show an activity feed on the right, with all of the interactions-->

      <?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {?>
        <div id="activity_feed">
          <h2>Activity Feed</h2>

          <!--posts you've posted-->
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
                $p = User::loadByUsername($username);
                $uid = $p->get('id');

                $q = "SELECT * FROM follow WHERE follower_id=$uid ";
                $result = mysql_query($q);
              } else {
                echo "NO USER IS LOGGED IN";
              }
              ?>

          <!--people you follow-->
              <h3>People you follow</h3>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <?php
                $puser = User::loadById($row['followed_id']);
                ?>
                <a href="<?= BASE_URL ?>/profile/<?= $puser->get('username') ?> "> <p class = "blog-author"> <?= $puser->get('username') ?></p> </a>
              <?php endwhile; ?>

          <!-- people following you-->
            <h3>Followers</h3>
            <?php
              $q = "SELECT * FROM follow WHERE followed_id=$uid ";
              $result = mysql_query($q);
            ?>
            <?php while($row = mysql_fetch_assoc($result)): ?>
              <?php
              $puser = User::loadById($row['follower_id']);
              ?>
              <a href="<?= BASE_URL ?>/profile/<?= $puser->get('username') ?> "> <p class = "blog-author"> <?= $puser->get('username') ?></p> </a>
            <?php endwhile; ?>

          <!--your comments-->
              <h3>Your comments</h3>
              <?php
                $q = "SELECT * FROM postcomments WHERE user_name='$username' ";
                $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <a href="<?= BASE_URL ?>/blogs/view/<?= $row['post_id'] ?> "> <p class = "blog-author"> <?= $row['comment'] ?></p> </a>
              <?php endwhile; ?>

          <!--products you've added-->
              <h3>Products you added</h3>
              <?php
                $q = "SELECT * FROM product WHERE creator_id=$uid ";
                $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <a href="<?= BASE_URL ?>/paintings/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
              <?php endwhile; ?>

          <!--posts from people you follow-->
              <h3>Posts from people you follow</h3>
              <?php
              $q = "SELECT * FROM follow WHERE follower_id=$uid ";
              $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <?php
                $prof = User::loadById($row['followed_id']);
                $followedUser = $prof->get('username');

                $qtwo = "SELECT * FROM post WHERE username='$followedUser' ";
                $resulttwo = mysql_query($qtwo);
                ?>
                <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
                  <a href="<?= BASE_URL ?>/blogs/view/<?= $row2['id'] ?> "> <p class = "blog-author"> <?= $row2['title'] ?></p> </a>
                <?php endwhile; ?>
              <?php endwhile; ?>

          <!--comments on your posts-->
              <h3>Comments on your posts</h3>
              <?php
              $q = "SELECT * FROM post WHERE username='$username' ";
              $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <?php
                $postid = $row['id'];

                $qtwo = "SELECT * FROM postcomments WHERE post_id=$postid ";
                $resulttwo = mysql_query($qtwo);
                ?>
                <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
                  <a href="<?= BASE_URL ?>/blogs/view/<?= $row2['post_id'] ?> "> <p class = "blog-author"> <?= $row2['comment'] ?></p> </a>
                <?php endwhile; ?>
              <?php endwhile; ?>

          <!--People followed by people you follow-->
              <h3>People followed by people you follow</h3>
              <?php
              $q = "SELECT * FROM follow WHERE follower_id=$uid ";
              $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <?php
                $followedId = $row['followed_id'];
                $qtwo = "SELECT * FROM follow WHERE follower_id=$followedId ";
                $resulttwo = mysql_query($qtwo);
                ?>
                <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
                  <?php
                    $prof = User::loadById($row2['followed_id']);
                    $followedUser = $prof->get('username');
                  ?>
                  <a href="<?= BASE_URL ?>/profile/<?= $followedUser ?> "> <p class = "blog-author"> <?= $followedUser ?></p> </a>
                <?php endwhile; ?>
              <?php endwhile; ?>


          <!--comments by people you follow-->
              <h3>Comments made by people you follow</h3>
              <?php
              $q = "SELECT * FROM follow WHERE follower_id=$uid ";
              $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <?php
                $prof = User::loadById($row['followed_id']);
                $followedUser = $prof->get('username');

                $qtwo = "SELECT * FROM postcomments WHERE user_name='$followedUser' ";
                $resulttwo = mysql_query($qtwo);
                ?>
                <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
                  <a href="<?= BASE_URL ?>/blogs/view/<?= $row2['post_id'] ?> "> <p class = "blog-author"> <?= $row2['comment'] ?></p> </a>
                <?php endwhile; ?>
              <?php endwhile; ?>

          <!--products added by people you follow-->
              <h3>Products added by people you follow</h3>
              <?php
              $q = "SELECT * FROM follow WHERE follower_id=$uid ";
              $result = mysql_query($q);
              ?>
              <?php while($row = mysql_fetch_assoc($result)): ?>
                <?php
                $followedId = $row['followed_id'];
                $qtwo = "SELECT * FROM product WHERE creator_id=$followedId ";
                $resulttwo = mysql_query($qtwo);
                ?>
                <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
                  <a href="<?= BASE_URL ?>/paintings/view/<?= $row2['id'] ?> "> <p class = "blog-author"> <?= $row2['title'] ?></p> </a>
                <?php endwhile; ?>
              <?php endwhile; ?>

            </div>

          <?php } ?>


<!--if user is set, make the width of the header image smaller to account for the activity feed-->
  <?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {?>
  <div id="header_image" style="width: 66%">


   <img class="head-image" src="<?= BASE_URL ?>/public/img/photographer.jpeg" alt="Header image"/>
    <input type="button" class="shopnewarrivals" onclick="location.href='paintings'" value="Shop New Arrivals" />
  </div>

  <?php }



  else {?>

  <div id="header_image" style="width: 100%">


   <img class="head-image" src="<?= BASE_URL ?>/public/img/photographer.jpeg"  alt="Header image"/>
    <input type="button" class="shopnewarrivals" onclick="location.href='paintings'" value="Shop New Arrivals" />
  </div>


  <?php } ?>


<!--tile images across the screen-->
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

  <!--second header-->

      <div id="header_image2">
        <img class="head-image2" src="<?= BASE_URL ?>/public/img/paint.jpeg" alt="Header image" />
         <input type="button" class="shopfavorites" onclick="location.href='paintings'" value="Shop Our Favorites" />
         <!--edited from the image found here:  https://www.google.com/imgres?imgurl=http%3A%2F%2F67.media.tumblr.com%2Fac1a5aee391576c9bb410bd93d57550e%2Ftumblr_ndx3yvFet41qc91i1o1_1280.jpg&imgrefurl=http%3A%2F%2Fartistandstudio.tumblr.com%2Fpage%2F3&docid=Eun42Gye6mFtzM&tbnid=CmwQOamtM-yBFM%3A&w=1000&h=667&hl=en&bih=475&biw=1262&ved=0ahUKEwj__fKDia7PAhXEFj4KHZODDX0QMwgfKAEwAQ&iact=mrc&uact=8 -->
      </div>


<!--popular item tiles-->
  <!--<div id="Favorites">

  
  <div id="popular">
    <ul id="popular">

          <li><a href="paintings"> <img class="tile" src="<?= BASE_URL ?>/public/img/necklace.jpg" alt="Necklace" /> </a> </li>
          <li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/painting1.jpg" alt="Painting pic" /></a> </li>
          <li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/stairs.jpg" alt="Home Decor" /></a> </li>
          <li><a href="paintings"> <img class="tile" src="<?= BASE_URL ?>/public/img/necklace.jpg" alt="Necklace" /> </a> </li>
          <li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/painting1.jpg" alt="Painting pic" /></a> </li>

    </ul>
    </div>-->

    <h2>Follow our adventures on Instagram!</h2>
    <div id = "Instagram_feed">
        <?php
        // use this instagram access token generator http://instagram.pixelunion.net/
        $access_token="4243791441.1677ed0.7397dce5702e4c1a8403ba9217927a08";
        $photo_count=5;
             
        $json_link="https://api.instagram.com/v1/users/self/media/recent/?";
        $json_link.="access_token={$access_token}&count={$photo_count}";


        $json = file_get_contents($json_link);
        $obj = json_decode($json, true, 512, JSON_BIGINT_AS_STRING);

        foreach ($obj['data'] as $post) {
     
          $pic_text=$post['caption']['text'];
          $pic_link=$post['link'];
          $pic_like_count=$post['likes']['count'];
          $pic_comment_count=$post['comments']['count'];
          $pic_src=str_replace("http://", "https://", $post['images']['standard_resolution']['url']);
          $pic_created_time=date("F j, Y", $post['caption']['created_time']);
          $pic_created_time=date("F j, Y", strtotime($pic_created_time . " +1 days"));
           
          echo "<div id='image' class='image' style='display: inline;'>        
                              
               <a href='{$pic_link}'>
                <img class='insta' src='{$pic_src}' alt='{$pic_text}' style='width:19.5%' >
                     
                </a>

                </div>";
       }

        ?>



    </div>
    </div>
