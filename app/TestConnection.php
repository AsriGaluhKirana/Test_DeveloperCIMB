<?php

$serverName = "AG-KIRANA\SQLEXPRESS";
$database = "Project_CIMB";
$uid = "";
$pass = "";

$connection = [
    "Database" => $database,
    "Uid" => $uid,
    "PWD" => $pass
];
$conn = sqlsrv_connect($serverName, $connection);
if(!$conn) {
    die(print_r(sqlsrv_errors(), true));
}
else {
    echo "Connected";
}

?>
