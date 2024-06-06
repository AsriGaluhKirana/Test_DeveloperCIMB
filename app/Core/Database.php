<?php

class Database {
    private $serverName;
    private $connectionOptions;
    private $conn;

    public function __construct($serverName, $database, $username, $password) {
        $this->serverName = $serverName;
        $this->connectionOptions = [
            "Database" => $database,
            "Uid" => $username,
            "PWD" => $password,
        ];
    }

    public function connect() {
        $this->conn = sqlsrv_connect($this->serverName, $this->connectionOptions);
        if ($this->conn === false) {
            die(print_r(sqlsrv_errors(), true));
        }
    }

    public function getConnection() {
        return $this->conn;
    }

    public function close() {
        sqlsrv_close($this->conn);
    }
}
?>