<?php

class Comment extends DbObject {
    // name of database table
    const DB_TABLE = 'postcomments';

    // database fields
    protected $post_id;
    protected $comment;
    protected $user_name;
    protected $id;


    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'comment' => '',
            'user_name' => null,
            'post_id' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->comment = $args['comment'];
        $this->post_id = $args['post_id'];
        $this->user_name=$args['user_name'];

    }

    // save changes to object
    public function save() {

        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
          'id' => null,
          'comment' => '',
          'user_name' => null,
          'post_id' => null
          );
        // echo var_dump($this);
        // echo "<br>";
        // echo "<br>";
        // echo "<br>";
        // echo var_dump($db_properties);
        // echo "<br>";
        // echo "<br>";
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    public static function fetchByPostId($post_id) {
      if ($post_id === null) {
  			return null;
  		}
  		$query = sprintf("SELECT * FROM `%s` WHERE post_id = '%s';",
  				self::DB_TABLE,
  				$post_id
  			     );
  		$db = Db::instance();
      $result = $db->lookup($query);



  		if(!mysql_num_rows($result)) {
  			return null;
  		} else {
  			$objects = array();
        while($row = mysql_fetch_assoc($result)) {
          $objects[] = self::loadById($row['id']);
        }
        return ($objects);
  		}
    }


    public function lookup($query) {
  		$result = mysql_query($query);
  		if(!$result)
  			die('Invalid query: ' . $query);
  		return ($result);
  	}
    // load all products
    public static function getAllComments($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY post_id DESC ",
            self::DB_TABLE
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $objects = array();
            while($row = mysql_fetch_assoc($result)) {
                $objects[] = self::loadById($row['id']);
            }
            return ($objects);
        }
    }

}
