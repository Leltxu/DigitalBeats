<?php
include 'vistas/header.php';
include 'conexion.php';

include_once 'modelos/model_productos.php';
include_once 'modelos/model_categorias.php';
include 'functions.php';

$productos=buscarCategoriaProductos($conexion,5,[1]);
print_r($productos);
mostrarTarjetas($productos,10);

