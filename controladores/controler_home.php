<?php
session_start();
include "functions.php";
include "modelos/model_productos.php";
require_once "conexion.php";

if (!isset($_GET['page']) && !isset($_GET['product']) && !isset($_GET['categoria'])) {
    include "vistas/home.php";
    exit();
} 

if (isset($_GET['page'])) {
    if ($_GET['page'] == 'contacto') {
        include "contacto.html";
    }  else if ($_GET['page'] == 'cesta') {
        include "vistas/cesta.php";
    } else if ($_GET['page'] == 'close') {
        session_start();
        unset($_SESSION['user']);
        session_destroy();
        header("Location: index.php");
    }
}

if (isset($_GET['product'])) {
    $producto = $_GET['product'];
    $buscar = $producto;
    if (empty($producto)) {
        header("Location: index.php");
        exit();
    }
    include "vistas/productos.php";
}

if (isset($_GET['categoria'])) {
    $categoria = $_GET['categoria'];

    if (empty($categoria)) {
        header("Location: index.php");
        exit();
    }
    $buscar = obtenerCategoria($conexion, $categoria)['NOMBRE'];
    include "vistas/productos.php";
}