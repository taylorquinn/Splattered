<div id="content2">

  <!-- the blog image with its title -->

      <!--<img class="blog_image" src="<?= BASE_URL ?>/public/img/ ?> " alt="image relating to the blog" />-->

      <img class="large-img" alt = "the users profile picture" src="<?= BASE_URL ?>/public/img/<?= $p->get('profpic')?>" >

        <ul class="product-checkout">
          <li><p class="name"> <?= $p->get('first_name') ?> <?= $p->get('last_name') ?></p></li>
          <li><p class="checkout-price"></p><?= $p->get('bio') ?></li>
        </ul>

</div>

<h2>Activity Feed</h2>
<?php while($row = mysql_fetch_assoc($result)): ?>
  <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
<?php endwhile; ?>

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
<?php while($row = mysql_fetch_assoc($result)): ?>
  <a href="<?= BASE_URL ?>/blogs/view/<?= $row['id'] ?> "> <p class = "blog-author"> <?= $row['title'] ?></p> </a>
<?php endwhile; ?>
