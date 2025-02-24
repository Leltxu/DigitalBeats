<?php
try {
    $host="localhost";
    $user="root";
    $pass="";
    $db="digitalBeats";
    $conexion=mysqli_connect($host,$user,$pass,$db);
} catch (Exception $e) {
    echo "Error al conectar a la base de datos";
}