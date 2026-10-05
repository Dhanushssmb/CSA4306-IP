<?php
session_start();
$host="localhost"; $user="root"; $pass=""; $db="stayease_hotel";
$conn=new mysqli($host,$user,$pass,$db);
if($conn->connect_error) die("Database connection failed: ".$conn->connect_error);
$conn->set_charset("utf8mb4");
function e($v){return htmlspecialchars($v??'',ENT_QUOTES,'UTF-8');}
function admin(){return !empty($_SESSION['admin']);}
function user(){return $_SESSION['user']??null;}
?>