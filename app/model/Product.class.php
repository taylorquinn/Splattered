<?php

class Product extends DbObject {
    // name of database table
    const DB_TABLE = 'product';

    // database fields
    protected $id;
    protected $title;
    protected $description;
    protected $price;
    protected $sizes;
    protected $img_url;
    protected $creator_id;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'description' => null,
            'price' => 0,
            'sizes' => '',
            'img_url' => null,
            'creator_id' => 0,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->description = $args['description'];
        $this->price = $args['price'];
        $this->sizes = $args['sizes'];
        $this->img_url = $args['img_url'];
        $this->creator_id = $args['creator_id'];
        $this->date_created = $args['date_created'];

    }

    // save changes to object
    public function save() {

        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'description' => $this->description,
            'price' => $this->price,
            'sizes' => $this->sizes,
            'img_url' => $this->img_url,
            'creator_id' => $this->creator_id
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
