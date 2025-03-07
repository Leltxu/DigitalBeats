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
    $sql = "SELECT * FROM productos WHERE ID_PRODUCTO = $id";
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

function obtenerEstellas($conexion,$id,$id_producto,$id_cliente) {
    $sql = "SELECT VALORACION FROM opiniones WHERE id_opinion=$id AND id_producto=$id_producto AND id_cliente=$id_cliente";
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

function obtenerOpiniones($conexion, $id) {
    $sql = "SELECT opiniones.*, usuarios.nombre AS NOMBRE 
            FROM opiniones 
            JOIN usuarios ON opiniones.id_cliente = usuarios.id_cliente
            WHERE id_producto = $id
            LIMIT 10";
    $query = mysqli_query($conexion, $sql);
    $resultado = [];
    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }
    return $resultado;
}

//Opiniones

function insertarOpinion($conexion, $id_producto, $id_cliente, $valoracion, $opinion) {
    $sql = "INSERT INTO opiniones (id_producto, id_cliente, valoracion, comentario) VALUES ($id_producto, $id_cliente, $valoracion, '$opinion')";
    mysqli_query($conexion, $sql);
}