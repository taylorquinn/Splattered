<?php

  $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
  or die ('Error: Could not connect to MySql database');
  mysql_select_db(DB_DATABASE);


  $name=$_POST["name"];
  $message=$_POST["message"];

  $query=mysql_query("INSERT INTO comment(post_id,comment, user_id) values('$name','$message') ");

  if($query){
    echo "Your comment has been sent";
  }
  else{
    echo "Error in sending your comment";
  }
?>
