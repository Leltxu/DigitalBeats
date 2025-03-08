<?php
session_start();

require '../conexion.php';
include '../functions.php';
include '../modelos/model_productos.php';
include '../modelos/model_categorias.php';

if (isset($_POST['opinion'])) {
    $id = $_POST['id'];
    $estrellas = $_POST['estrellas'];
    $comentario = sanearDatos($_POST['comentario']);
    $id_cliente = $_SESSION['ID_CLIENTE'];
    
    $errores = [];
    $errores['estrellas'] = validarDatos($estrellas, 'number');
    $errores['comentario'] = validarDatos($comentario, 'empty');

    if (empty($errores['estrellas']) && empty($errores['comentario'])) {
        insertarOpinion($conexion, $id, $id_cliente, $estrellas, $comentario);
        unset($_POST);
    }
}

if (isset($_POST['cesta'])) {
    $id = sanearDatos($_POST['id']);
    $cantidad = sanearDatos($_POST['cantidad']);
    $cesta=["producto" => $id, "cantidad"=>$cantidad];
    if (!isset($_SESSION['cesta'])) {
        $_SESSION['cesta']=[];
    }
    array_push($_SESSION['cesta'], $cesta);
}

if (!isset($_GET['product'])) {
    header('Location: ../index.php');
} else {

    $detalleProducto = mostrarDetallesProducto($conexion, $_GET['product']);
    if ($detalleProducto['PRECIO_DESCUENTO'] == 0) {
        $precioActual=$detalleProducto['PRECIO'];
        $precioAntes=0;
    } else {
        $precioActual=$detalleProducto['PRECIO_DESCUENTO'];
        $precioAntes=$detalleProducto['PRECIO'];
    }

    $catPadre=obtenerCategoria($conexion, $detalleProducto['ID_CATEGORIA'])['CATEGORIA_PADRE'];
    if ($catPadre == 0) {
        $catPadre = $detalleProducto['ID_CATEGORIA'];
    }
    $relacionados=buscarCategoria($conexion, $catPadre);

    // Filtrar el producto actual de los relacionados
    $relacionados = array_filter($relacionados, function($producto) use ($detalleProducto) {
        return $producto['ID_PRODUCTO'] !== $detalleProducto['ID_PRODUCTO'];
    });
 
    include '../vistas/mostrar_producto.php';
}