<?php

class Blog extends DbObject {
    // name of database table
    const DB_TABLE = 'post';

    // database fields
    protected $id;
    protected $title;
    protected $description;
    protected $image_url;
    protected $username;


    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'full_post' => null,
            'description' => null,
            'image_url' => null,
            'date_created' => null,
            'username'=>null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->full_post = $args['full_post'];
        $this->description = $args['description'];
        $this->image_url = $args['image_url'];
        $this->date_created = $args['date_created'];
        $this->username=$args['username'];

    }

    // save changes to object
    public function save() {

        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'full_post' => $this->full_post,
            'description' => $this->description,
            'image_url' => $this->image_url,
            'username' => $this->username
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    public static function loadByTitle($title) {
        $db = Db::instance();
        $obj = $db->fetchByTitle($title, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    public static function deleteByTitle($title) {
      $host     = DB_HOST;
      $database = DB_DATABASE;
      $username = DB_USER;
      $password = DB_PASS;
      $conn = mysql_connect($host, $username, $password)
  			or die ('Error: Could not connect to MySql database');

  		mysql_select_db($database);

      $query = sprintf("DELETE FROM %s WHERE title = %s",self::DB_TABLE, $title, $conn);
      echo($query);
      $db = Db::instance();
      $result = mysql_query($query);

      if (mysql_affected_rows() > 0) {
          return true;
      }
      else {
          return false;
      }
    }

    // load all products
    public static function getAllProducts($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ",
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
