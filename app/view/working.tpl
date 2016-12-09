
<!DOCTYPE html>
<html>
<head>
<style>
body, html {
  height: 100%;
  margin: 0;
  font: 400 15px/1.8 "Lato", sans-serif;
  color: #777;
}

.bgimg-0, .bgimg-1, .bgimg-2, .bgimg-3 {
  position: relative;
  opacity: 0.9;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}

.bgimg-0 {
  background-image: url("<?= BASE_URL ?>/public/img/background1.jpeg");
  min-height: 500px;
}
.bgimg-1 {
  background-image: url("<?= BASE_URL ?>/public/img/photographer.jpeg");
  min-height: 500px;
}

.bgimg-2 {
  background-image: url("<?= BASE_URL ?>/public/img/desk.jpeg");
  min-height: 400px;
}

.bgimg-3 {
  background-image: url("<?= BASE_URL ?>/public/img/photographer.jpeg");
  min-height: 400px;
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

h3 {
  letter-spacing: 5px;
  text-transform: uppercase;
  font: 20px "Lato", sans-serif;
  color: #111;
}
</style>
</head>
<body>

<?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {?>
<div class="bgimg-0">
  <div class="caption">
  <a href="<?= BASE_URL ?>/paintings" style="text-decoration:none">
    <span class="border">WELCOME BACK!</span>
    </a>
  </div>
</div>


<div style="position:relative;">
	<div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: center; font-size:25px">

 
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
 </div>

 <?php } ?>






<div class="bgimg-1">
  <div class="caption">
  <a href="<?= BASE_URL ?>/paintings" style="text-decoration:none">
    <span class="border">SHOP NEW ARRIVALS</span>
    </a>
  </div>
</div>


   <div id= "tileImages" style="color: #777; background-color:white; text-align:center; text-align: center;">
    <ul id="tiles">

          <li><a href="paintings"> <img class="tile" src="<?= BASE_URL ?>/public/img/necklace.jpg" alt="Necklace" /> </a> </li>
            <!--edited from the image found here: https://www.google.com/search?sa=G&hl=en&q=side+braid&tbm=isch&tbs=simg:CAQSlQEJoIMPJccrmF0aiQELEKjU2AQaAggDDAsQsIynCBpiCmAIAxIo6RmGD7cPyhnJELQPoQ_1UEIoP1w_1eMNkw3zDgMOEwyCXiMPM71S7bMBowfjlhgnYthk6MjBxNqmzMtdnOX039F_18vRhoU7RcO-UtPcjMMStEtTzbhNEEa_1j24IAQMCxCOrv4IGgoKCAgBEgQ_1pMqMDA&ved=0ahUKEwjt1MnGia7PAhXEez4KHQD9CHgQwg4IGygA-->
          <li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/painting1.jpg" alt="Painting pic" /></a> </li>
            <!--edited from the image found here: https://lh3.googleusercontent.com/OCWLteVrjHjzDUVIRRIbIrbYZuYXXzTSz0a0akUn0V1u4WPICt3dmR8X28sen953deeSTFQ=s85-->
          <li><a href="paintings"><img class="tile" src="<?= BASE_URL ?>/public/img/stairs.jpg" alt="Home Decor" /></a> </li>
            <!--edited from the image found here: https://lh3.googleusercontent.com/7S9F_10_tSqAwFJNUV3a0KJ0e8c-XZxTp_hxWP-DBHmocVRL7yXbwzIrLPCJjm-zgLdRmA=s85-->

    </ul>
  </div>

 <a href="<?= BASE_URL ?>/blog" style="text-decoration:none">
<div class="bgimg-2">
  <div class="caption">
 
    <span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;">CHECK OUT NEW POSTS</span>
    
  </div>
</div>
</a>

<div style="position:relative;">
  <div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: center; font-size:25px">
    <p>FOLLOW OUR ADVENTURES ON INSTAGRAM</p>
  </div>
   <div id = "Instagram_feed" style="background-color:white;">
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


<!--
<div class="bgimg-3">
  <div class="caption">
    <span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;">SCROLL UP</span>
  </div>
</div>

<div style="position:relative;">
  <div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: justify;">
    <p>Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
  </div>
</div>

<div class="bgimg-1">
  <div class="caption">
    <span class="border">COOL!</span>
  </div>
</div>
-->

</body>
</html>