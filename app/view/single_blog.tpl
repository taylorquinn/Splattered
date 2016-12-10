<div id="content2">
  <!-- the blog image with its title -->
  <div class="banner">
      <img class="blog_image" src="<?= BASE_URL ?>/public/img/<?= $b->get('image_url') ?> " alt="image relating to the blog" />
      <div class="bannerText">
        <p class="blog_title"> <?= $b->get('title') ?></p>
      </div>
  </div>

<!--author-->


  <!-- the description of the blog -->
  <div class="blog_description">
   <!-- <h4>Full Post</h4>-->


<?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') {?>

     <a href="<?= BASE_URL ?>/profile/<?= $b->get('username') ?> "> <p class = "blog-author"> <?= $b->get('username') ?></p> </a>

      <?php } else {?>
     <p class = "blog-author"> <?= $b->get('username') ?></p>
      <?php } ?>


    <p class = "blog-text" style="text-transform:none; letter-spacing:.5px; "> <?= $b->get('full_post') ?></p>

<!-- the user may edit or delete their own post, any admin may also edit or delete a post -->

<?php if(isset($_SESSION['user']) == $b->get('username')) {?>
    <a class = "editButton" href ="<?= BASE_URL ?>/blogs/edit/<?= $b->get('id') ?>"><button class="edit-button2">Edit</button></a>
    <a class = "editButton" href ="<?= BASE_URL ?>/blogs/delete/<?= $b->get('id') ?>/process"><button class="edit-button2">Delete</button></a>
<?php } ?>
  </div>

       <script type="text/javascript">
               $(document).ready(function(){
                 function showComment(){
                   var post_id = <?= $b->get('id') ?>;

                   $.ajax({
                     type:"post",
                     url:"<?= BASE_URL ?>/app/controller/comment.php",
                     data:"action=showcomment"+"&post_id="+post_id,
                     success:function(data){
                          $("#comment").html(data);
                          $("#new_comment")[0].reset();
                     }
                   });
                 }
                 showComment();
                    $("#button").click(function(){
                          var name=$("#name").val();
                          var message=$("#message").val();
                          var post_id = <?= $b->get('id') ?>;



                          $.ajax({
                              type:"post",
                              url:"<?= BASE_URL ?>/app/controller/comment.php",
                              data:"name="+name+"&message="+message+"&action=addcomment"+"&post_id="+post_id,
                              success:function(data){
                                 $("#info").html(data);
                                 showComment();
                              }

                          });

                    });

               });
       </script>
<?php
if(isset($_SESSION['user']))
{
$user = $_SESSION['user'];

echo'<br> <h1 id = "comment"  style= "list-style: none; margin-left: 20%; font-size: 20px;" > Please Comment</h1><form id="new_comment">


               </br>

              <input type="text" name="name" id="name" value=',$user,' readonly="readonly"  style="margin-left: 5px;
                      visibility: hidden;
                      display: inline-block;
                      height: 0px;
                      margin-left: 20%;
                      border:none"
                      />
           <!--    <p style = "    width: 60%; margin-left: 20%;  font-size: 18px; display: inline; margin-bottom: 20px;" >:</p> -->
              <!--<p style= "margin-left: 40px; display:inline-block;"> Comment: </p>-->
              <textarea style = "width:60%; height:100px; margin-left: 20%;" class="add-textbox"  name="message" id="message" placeholder = "Join the conversation, ',$user,'! Enter a new comment." name="description"></textarea>





             <!-- <p name="name" id= "name" style="margin-left: 5px;
                      display: inline-block;
                      margin-bottom: 20px;
                      font-size: 15px;">',$user,'</p>-->

              <input type="button" class="edit-button" value="POST" id="button" style=" margin-left: 20%;
                      margin-top: 2px;
                      display: block;
                      margin-bottom: 20px;">


               <div id="info" />
               </form>';
}
?>

</div>
