<?php

class User extends DbObject {
    // name of database table
    const DB_TABLE = 'user';

    // database fields
    protected $id;
    protected $username;
    protected $pw;
    protected $email;
    protected $first_name;
    protected $last_name;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'username' => '',
            'pw' => '',
            'email' => null,
            'first_name' => null,
            'last_name' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->username = $args['username'];
        $this->pw = $args['pw'];
        $this->email = $args['email'];
        $this->first_name = $args['first_name'];
        $this->last_name = $args['last_name'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'username' => $this->username,
            'pw' => $this->pw,
            'email' => $this->email,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name
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

}
