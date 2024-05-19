<?php
if (!defined('DB_SERVER')) {
    require_once("../initialize.php");
}

class DBConnection {
    private $host = '127.0.0.1'; // Use the IP address or 'localhost'
    private $username = 'root'; // Root username
    private $password = ''; // Empty password
    private $database = 'pet_shop_db'; // Database name
    private $charset = 'utf8mb4';
    
    public $conn;
    
    public function __construct() {
        if (!isset($this->conn)) {
            $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database);
            
            if ($this->conn->connect_error) {
                die('Connect Error (' . $this->conn->connect_errno . ') ' . $this->conn->connect_error);
            }

            // Set the charset to utf8mb4
            if (!$this->conn->set_charset($this->charset)) {
                die('Error loading character set ' . $this->charset . ': ' . $this->conn->error);
            }
        }    
    }
    
    public function __destruct() {
        if (isset($this->conn)) {
            $this->conn->close();
        }
    }
}
?>
