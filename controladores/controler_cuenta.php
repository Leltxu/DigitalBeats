<?php
session_start();
include "../functions.php";

if (!isset($_SESSION['NOMBRE'])) {
    header('Location: ../index.php');
    exit();
}

if (isset($_GET['page'])) {
    if ($_GET['page'] == "datos") {

        if (isset($_POST['nombre'])) {
            $nombre = $_SESSION['NOMBRE'];
        } else {
            $nombre = $_SESSION['NOMBRE'];
        }

        if (isset($_POST['apellidos'])) {
            $apellidos = $_SESSION['APELLIDOS'];
        } else {
            $apellidos = $_SESSION['APELLIDOS'];
        }

        if (isset($_POST['fecha'])) {
            $fecha = $_SESSION['FECHA_NACIMIENTO'];
        } else {
            $fecha = $_SESSION['FECHA_NACIMIENTO'];
        } 

        include __DIR__ . "/../vistas/form_datos.php";
        exit();
    } 
} else {
    include __DIR__ . "/../vistas/micuenta.php";
}



