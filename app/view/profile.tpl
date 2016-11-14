<div id="content2">

  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

      <img class="large-img" alt = "the users profile picture" src="<?= BASE_URL ?>/public/img/<?= $p->get('profpic')?>" >

        <ul class="product-checkout">
          <li><p class="title"> <?= $p->get('first_name') ?> <?= $p->get('last_name') ?></p></li>
          <li><p class="checkout-price"></p><?= $p->get('bio') ?></li>
        </ul>

</div>


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

 <?php if($_SESSION['user'] == $p->get('username')): ?>

 <?php endif; ?>
<?php if(isset($_SESSION['user'])): ?>
  <?php while($row = mysql_fetch_assoc($result)): ?>
    <?php
    $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
      or die ('Error: Could not connect to MySql database');
    mysql_select_db(DB_DATABASE);

    $prof = Profile::loadById($row['followed_id']);
    $followedUser = $prof->get('username');

    $qtwo = "SELECT * FROM post WHERE username='$followedUser' ";
    $resulttwo = mysql_query($qtwo);
    ?>
    <?php while($row2 = mysql_fetch_assoc($resulttwo)): ?>
      <p><?= $row2['description'] ?></p>
    <?php endwhile; ?>
  <?php endwhile; ?>
<?php endif; ?>


  
