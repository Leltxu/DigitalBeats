<?php
session_start();

require '../conexion.php';
include '../functions.php';
include '../modelos/model_productos.php';

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
    $relacionados=buscarCategoria($conexion, $catPadre);

    // Filtrar el producto actual de los relacionados
    $relacionados = array_filter($relacionados, function($producto) use ($detalleProducto) {
        return $producto['ID_PRODUCTO'] !== $detalleProducto['ID_PRODUCTO'];
    });

    include '../vistas/mostrar_producto.php';
}