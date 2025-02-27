<?php
include "functions.php";
include "modelos/model_productos.php";
require_once "conexion.php";

if (!isset($_GET['page']) && !isset($_GET['product'])) {
    include "vistas/home.php";
} 

if (isset($_GET['page'])) {
    if ($_GET['page'] == 'contacto') {
        include "contacto.html";
    }  else if ($_GET['page'] == 'cesta') {
        include "vistas/cesta.php";
    } 
}

if (isset($_GET['product'])) {
    $producto = $_GET['product'];
    if (empty($producto)) {
        header("Location: index.php");
    }
    include "vistas/productos.php";
}