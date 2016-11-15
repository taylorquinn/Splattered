<div id="content2">

  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

      <img class="large-img" alt = "the users profile picture" src="<?= BASE_URL ?>/public/img/<?= $p->get('profpic')?>" >

        <ul class="product-checkout">
          <li><p class="name"> <?= $p->get('first_name') ?> <?= $p->get('last_name') ?></p></li>
          <li><p class="checkout-price"></p><?= $p->get('bio') ?></li>
        </ul>

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

</div>





 <h2>Activity Feed</h2>
 <?php while($row = mysql_fetch_assoc($result)): ?>
   <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> " class = "article"> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
 <?php endwhile; ?>

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


   </div>

 <?php endif; ?>

<?php while($row = mysql_fetch_assoc($result)): ?>

  <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
<?php endwhile; ?>
