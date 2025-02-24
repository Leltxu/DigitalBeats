<?php
include 'conexion.php';
include "modelos/model_productos.php";
include "functions.php";

$novedades=mostrarProductos($conexion,'novedades');
print_r($novedades);
mostrarTarjetas($novedades);