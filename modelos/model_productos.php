<?php

function mostrarProductos($conexion, $tipo) {
    switch ($tipo) {
        case 'novedades':
            $sql = "SELECT * FROM productos WHERE novedad = 1";
            break;
        case 'ofertas':
            $sql = "SELECT * FROM productos WHERE oferta = 1";
            break;
        case 'destacados':
            $sql = "SELECT * FROM productos WHERE destacado = 1";
            break;
        case 'masvendidos':
            $sql = "SELECT * FROM productos WHERE masvendido = 1";
            break;
    }
    $query = mysqli_query($conexion, $sql);
    $resultado = [];
    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }
    return $resultado;
}


function mostrarDetallesProducto($conexion,$id) {
    $sql = "SELECT * FROM productos WHERE id = $id";
    $query = mysqli_query($conexion, $sql);
    $resultado=[];
    while ($fila = mysqli_fetch_assoc($query)){
        $resultado[] = $fila;
    }
    return $resultado[0];
}

function estrellas($conexion,$id) {
    $sql = "SELECT AVG(valoracion) AS 'estrellas' FROM opiniones WHERE id_producto=$id";
    $query = mysqli_query($conexion, $sql);
    $resultado=[];
    while ($fila = mysqli_fetch_assoc($query)){
        $resultado[] = $fila;
    }
    return $resultado[0];
}

function buscarProducto($conexion,$busqueda) {
    $sql = "SELECT * FROM productos WHERE nombre LIKE '%$busqueda%'";
    $query = mysqli_query($conexion, $sql);
    $resultado=[];
    while ($fila = mysqli_fetch_assoc($query)){
        $resultado[] = $fila;
    }
    return $resultado;
}