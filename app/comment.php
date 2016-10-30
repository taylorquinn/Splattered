<?php
include_once './global.php';

  $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
  or die ('Error: Could not connect to MySql database');
  mysql_select_db(DB_DATABASE);




  $query=mysql_query("INSERT INTO postComments(post_id,comment, user_id) values(1,'hello', 2) ");

  if($query){
    echo "Your comment has been sent";
  }
  else{
    echo "Error in sending your comment";
  }
?>
