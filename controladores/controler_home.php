<?php
session_start();
include "functions.php";
include "modelos/model_productos.php";
include "modelos/model_categorias.php";
include "modelos/modelo_user.php";
require_once "conexion.php";

if (isset($_POST['actualizar'])) {
    $id = $_POST['id'];
    $cantidad = $_POST['cantidad'];
    $_SESSION['cesta'][$id]['cantidad'] = $cantidad;
}

if (isset($_POST['borrar'])) {
    $id = $_POST['id'];
    unset($_SESSION['cesta'][$id]);
}

if (isset($_POST['contacto'])) {
    $email = sanearDatos($_POST['email']);
    $nombre = sanearDatos($_POST['nombre']);
    $motivo = sanearDatos($_POST['opciones']);
    $pedido = sanearDatos($_POST['pedido']);
    $descripcion = sanearDatos($_POST['descripcion']);

    $errores = [];
    $errores['email'] = validarDatos($email, 'email');
    $errores['nombre'] = validarDatos($nombre, 'text');
    $errores['descripcion'] = validarDatos($descripcion, 'empty');

    if (empty($errores['email']) && empty($errores['nombre']) && empty($errores['descripcion'])) {
        insertarContacto($conexion, $email, $nombre, $motivo, $pedido, $descripcion);
        header("Location: index.php");
    }

}

if (!isset($_GET['page']) && !isset($_GET['product']) && !isset($_GET['categoria'])) {
    include "vistas/home.php";
    exit();
} 

if (isset($_GET['page'])) {
    if ($_GET['page'] == 'contacto') {
        include "vistas/contacto.php";
    }  else if ($_GET['page'] == 'cesta') {
        include "vistas/cesta.php";
    } else if ($_GET['page'] == 'close') {
        session_start();
        unset($_SESSION['user']);
        session_destroy();
        header("Location: index.php");
    }else if ($_GET['page'] == 'quien') {
        include "vistas/quienessomos.php";
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