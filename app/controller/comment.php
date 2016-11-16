<?php
include_once '../global.php';
  // This class essentially uses the database to get and post the cost of each of the posts


  $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
  or die ('Error: Could not connect to MySql database');
  mysql_select_db(DB_DATABASE);
  $post_id = $_POST['post_id'];
  $action = $_POST['action'];
  //get the post ID of the post and use it to query comments

  if($action=="showcomment"){
    //ajax call for showcomment, gets the comments
     $show = mysql_query("Select * from postcomments where post_id = '$post_id' order by id");

     while($row = mysql_fetch_array($show)){
        echo "<li><b>$row[user_name]</b> : $row[comment]</li>";
     }
  }
  else if($action=="addcomment"){
    //ajax call for addcomment, posts the comments

    $message = $_POST['message'];
    $name = $_POST['name'];
    $query=mysql_query("INSERT INTO postcomments(post_id,comment, user_name) values('$post_id','$message', '$name') ");

    //if the query is invalid
    if(!$query){
      echo "Error in sending your comment";
    }
  }



?>
