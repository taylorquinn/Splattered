<div id="content2">
  <!-- the blog image with its title -->
  <div class="banner">
      <img class="blog_image" src="<?= BASE_URL ?>/public/img/<?= $b->get('image_url') ?> " alt="image relating to the blog" />
      <div class="bannerText">
        <p class="blog_title"> <?= $b->get('title') ?></p>
      </div>
  </div>

  <!-- the description of the blog -->
  <div class="blog_description">
    <h4>Full Post</h4>
    <p> <?= $b->get('description') ?></p>
  </div>
   <head>

       <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>

       <script type="text/javascript">
               $(document).ready(function(){
                 function showComment(){
                   var post_id = <?= $b->get('id') ?>;

                   $.ajax({
                     type:"post",
                     url:"<?= BASE_URL ?>/app/comment.php",
                     data:"action=showcomment"+"&post_id="+post_id,
                     success:function(data){
                          $("#comment").html(data);
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
                              url:"<?= BASE_URL ?>/app/comment.php",
                              data:"name="+name+"&message="+message+"&action=addcomment"+"&post_id="+post_id,
                              success:function(data){
                                 $("#info").html(data);
                                 showComment();
                              }

                          });

                    });

               });
       </script>
   </head>

   <body>
     <br>
     <h1 id = "comment"> Comments </h1>
        <form>

               name : <input type="text" name="name" id="name"/>
               </br>
               message : <input type="text" name="message" id="message" />
               </br>
               <input type="button" value="Send Comment" id="button">

               <div id="info" />
        </form>
   </body>

</div>
