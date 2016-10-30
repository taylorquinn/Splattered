<div id="content2">

<!-- the header image -->
  <div id="header_image2">
    <img class="head-image2" src="<?= BASE_URL ?>/public/img/placeholder_blog.jpg" alt="Header image" />
  </div>

<!-- this will be a place to add a blog -->

<?php
foreach ($blogs as $b)
{
  echo "<div id='banner'>
      <img class='blog_image' alt=".$b->get('title')." src=".BASE_URL."/public/img/".$b->get('image_url')."/>
      <a href=".BASE_URL."/blogs/view/".$b->get('id')."><div id='bannerText'>
        <p id='blog_title'>".$b->get('title')."
        </p>
      </div></a>
  </div>

  <div id='blog_description'>
    <h4>Description</h4>
    <p>".$b->get('description')."</p>
  </div>";
}
?>


</div>
