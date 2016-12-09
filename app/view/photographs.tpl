<style>

.bgimg-1{
  position: relative;
  opacity: 0.9;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}

.bgimg-1 {
  background-image: url("<?= BASE_URL ?>/public/img/photohead.jpeg");
  min-height: 500px;
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

</style>
<!--header image-->



<div class="bgimg-1">
  <div class="caption">
  
    <span class="border">PHOTOGRAPHS</span>

  </div>
</div>



<div id="content7">


<div id = "Instagram_feed" style="margin-top:10px">
        <?php
        // use this instagram access token generator http://instagram.pixelunion.net/
        $access_token="4243791441.1677ed0.7397dce5702e4c1a8403ba9217927a08";
        $photo_count=50;
             
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
</div>
