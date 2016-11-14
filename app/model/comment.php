<?phpy5y6
include_once '../global.php';

/*
            $con = mysql_connect(DB_HOST, DB_USER, DB_PASS)
            if (!mysql_select_db("Splattered", $con))   
            {  
            echo mysql_errno($con) . ": " . mysql_error($con). "<br />";  
            }  
            mysql_select_db("Splattered", $con);  
            if (!mysql_query("select * from postComments", $con))  
            {  
            echo mysql_errno($con) . ": " . mysql_error($con) . "<br />";  
            }  */


  $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
  or die ('Error: Could not connect to MySql database');
  mysql_select_db(DB_DATABASE);
  $post_id = $_POST['post_id'];
  $action = $_POST['action'];


  if($action=="showcomment"){
     $show = mysql_query("Select * from postComments where post_id = '$post_id' order by id");

     while($row = mysql_fetch_array($show)){
        echo "<li><b>$row[user_name]</b> : $row[comment]</li>";
     }
  }
  else if($action=="addcomment"){

    $message = $_POST['message'];
    $name = $_POST['name'];

    $query=mysql_query("INSERT INTO postComments(post_id,comment, user_name) values('$post_id','$message', '$name') ");

    if(!$query){
      echo "Error in sending your comment";
    }
  }



?>
