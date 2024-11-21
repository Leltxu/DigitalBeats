<?php

function mostrarTarjetas($cantidad, $titulo,$precio = 0,$precioMax = 0,$estrellas=0) {
    for ($i=0; $i < $cantidad; $i++) {
        $tituloProducto=$titulo;
        $precioActual=$precio;
        $precioAntes=$precioMax;
        $estrella=$estrellas;
        include "plantillas/tarjeta.php";
    }
}