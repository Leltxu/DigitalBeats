<?php
function mostrarTarjetas($productos) {
    include_once 'modelos/model_productos.php';
    foreach ($productos as $producto) {
        $tituloProducto=$producto['NOMBRE'];

        if ($producto['PRECIO_DESCUENTO'] == 0) {
            $precioActual=$producto['PRECIO'];
            $precioAntes=0;
        } else {
            $precioActual=$producto['PRECIO_DESCUENTO'];
            $precioAntes=$producto['PRECIO'];
        }
        $estrella=0;
        $foto=$producto['FOTO'];
        include "vistas/tarjeta.php";
    }
}