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

function obtenerCategoria($conexion, $id) {
    // Asegúrate de que $id sea un valor entero
    $id = intval($id);
    
    $sql = "SELECT * FROM categorias WHERE ID_CATEGORIA =$id";
    $query = mysqli_query($conexion, $sql);
    $resultado = [];
    
    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }

    // Si no hay resultados, la función devolverá null
    return isset($resultado[0]) ? $resultado[0] : null;
}

function categorias($conexion) {
    $sql = "SELECT * FROM categorias";
    $query = mysqli_query($conexion, $sql);
    $categorias = [];
    $resultado = [];

    while ($fila = mysqli_fetch_assoc($query)) {
        $categorias[$fila['ID_CATEGORIA']] = $fila;
        $categorias[$fila['ID_CATEGORIA']]['hijos'] = [];
    }

    foreach ($categorias as $id => $categoria) {
        if ($categoria['CATEGORIA_PADRE'] != 0) {
            $categorias[$categoria['CATEGORIA_PADRE']]['hijos'][] = &$categorias[$id];
        } else {
            $resultado[] = &$categorias[$id];
        }
    }

    return $resultado;
}

function buscarCategoria($conexion, $id) {
    // Obtener todas las categorías hijas
    $sql = "SELECT ID_CATEGORIA FROM categorias WHERE CATEGORIA_PADRE = $id";
    $query = mysqli_query($conexion, $sql);
    $categorias_hijas = [$id]; // Incluir la categoría padre

    while ($fila = mysqli_fetch_assoc($query)) {
        $categorias_hijas[] = $fila['ID_CATEGORIA'];
    }

    // Convertir el array de categorías en una cadena separada por comas
    $categorias_hijas_str = implode(',', $categorias_hijas);

    // Modificar la consulta para incluir las categorías hijas y la categoría padre
    $sql = "SELECT * FROM productos WHERE id_categoria IN ($categorias_hijas_str)";
    $query = mysqli_query($conexion, $sql);
    $resultado = [];

    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }

    return $resultado;
}