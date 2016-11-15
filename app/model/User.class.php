<?php

class User extends DbObject {
    // name of database table
    const DB_TABLE = 'user';

    // database fields
    protected $id;
    protected $username;
    protected $pw;
    protected $email;
    protected $bio;
    protected $age;
    protected $status;
    protected $first_name;
    protected $last_name;
    protected $profpic;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'username' => '',
            'pw' => '',
            'email' => null,
            'bio' => '',
            'age' => null,
            'status' => 0,
            'first_name' => null,
            'last_name' => null,
            'profpic' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->username = $args['username'];
        $this->pw = $args['pw'];
        $this->email = $args['email'];
        $this->bio = $args['bio'];
        $this->age = $args['age'];
        $this->status = $args['status'];
        $this->first_name = $args['first_name'];
        $this->last_name = $args['last_name'];
        $this->profpic = $args['profpic'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'username' => $this->username,
            'pw' => $this->pw,
            'email' => $this->email,
            'bio' => $this->bio,
            'age' => $this->age,
            'status' => $this->status,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'profpic' => $this->profpic
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by username
    public static function loadByUsername($username) {
      $db = Db::instance();
      $obj = $db->fetchByUsername($username, __CLASS__, self::DB_TABLE);
      return $obj;
        }
}
