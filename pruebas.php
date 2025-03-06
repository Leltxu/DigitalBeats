<?php
include 'conexion.php';
include "modelos/model_productos.php";
include "functions.php";

echo '<pre>';
print_r(obtenerCategoria($conexion,1));
echo '</pre>';

echo '<pre>';
print_r(buscarCategoria($conexion,1));
echo '</pre>';