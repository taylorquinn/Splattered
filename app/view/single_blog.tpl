<div id="content2">

  <html>
     <head>

         <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
         <script type="text/javascript" src="js/jquery-ui-1.8.17.custom.min.js"></script>

         <script type="text/javascript">
                 $(document).ready(function(){
                      $("#button").click(function(){

                            var name=$("#name").val();
                            var comment=$("#message").val();

                            $.ajax({
                                type:"post",
                                url:"<?= BASE_URL ?>/comment.php",
                                data:"name="+name+"&message="+message,
                                success:function(data){
                                   $("#info").html(data);
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
