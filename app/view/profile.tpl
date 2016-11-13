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



                    <button id="followButton">Blue</button>

  <?php endif; ?>

<div id="random">hello</div>
