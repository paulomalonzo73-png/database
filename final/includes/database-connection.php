<?php
$type     = 'mysql';
$server   = 'localhost';
$db       = 'travel_guide';
$port     = '3306';
$charset  = 'utf8mb4';
$username = 'root';       // change to your MySQL username
$password = '';           // change to your MySQL password

$dsn = "$type:host=$server;dbname=$db;port=$port;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    return new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    include __DIR__ . '/database-troubleshooting.php';
    exit;
}
