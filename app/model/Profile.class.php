<?php

class Profile extends DbObject {
    // name of database table
    const DB_TABLE = 'user';

    // database fields
    protected $username;
    protected $first_name;
    protected $last_name;
    protected $bio;
    protected $profpic;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'first_name' => null,
            'last_name' => null,
            'username' => null,
            'profpic' => null,
            'bio' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->first_name = $args['first_name'];
        $this->last_name = $args['last_name'];
        $this->username = $args['username'];
        $this->profpic = $args['profpic'];
        $this->bio = $args['bio'];

    }

    // save changes to object
    public function save() {

        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'username' => $this->username,
            'profpic' => $this->profpic,
            'bio' => $this->bio,
            );
        echo var_dump($this);
        echo "<br>";
        echo "<br>";
        echo "<br>";
        echo var_dump($db_properties);
        echo "<br>";
        echo "<br>";
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {

        $db = Db::instance();

        //$obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        $obj = $db->fetchById(1, __CLASS__, self::DB_TABLE);
        echo var_dump($obj);
        return $obj;
    }

    // load object by ID
    public static function loadByUsername($username) {
        $db = Db::instance();
        $obj = $db->fetchByUsername($username, __CLASS__, self::DB_TABLE);
        return $obj;
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
                $objects[] = self::loadById($row['username']); //changed id to username
            }
            return ($objects);
        }
    }

}
