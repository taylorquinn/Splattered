<div id="content2">
  <!-- the blog image with its title -->
  <div id="banner">
      <img class="blog_image" src="<?= BASE_URL ?>/public/img/logov2.png" alt="image relating to the blog" />
      <div id="bannerText">
        <p id="blog_title">PLACEHOLDER TITLE</p>
      </div>
  </div>

  <!-- the description of the blog -->
  <div id="blog_description">
    <h4>Full Post</h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      Integer porta euismod risus nec sagittis. Integer rutrum nisi
      at lorem tincidunt aliquam. Vestibulum auctor molestie quam,
      ac viverra justo accumsan at. Pellentesque et bibendum eros,
      quis pulvinar ligula. Ut porttitor tincidunt nisi id hendrerit.</p>
  </div>
  <html>
   <head>

       <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>

       <script type="text/javascript">
               $(document).ready(function(){
                    $("#button").click(function(){

                          var name=$("#name").val();
                          var message=$("#message").val();

                          $.ajax({
                              type:"post",
                              url:"<?= BASE_URL ?>/app/comment.php",
                              data:"name="+name+"&message="+message,
                              success:function(data){
                                 $("#info").html(data);
                                 console.log("hello")
                              }

                          });

                    });
               });
       </script>
   </head>

   <body>
        <form>
               name : <input type="text" name="name" id="name"/>
               </br>
               message : <input type="text" name="message" id="message" />
               </br>
               <input type="button" value="Send Comment" id="button">

               <div id="info" />
        </form>
   </body>
</html>

</div>
