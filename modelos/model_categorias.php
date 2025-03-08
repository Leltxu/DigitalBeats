<?php
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

function categoriasProductos($conexion, $id, $productos) {
    // Convertir el array de productos en una cadena separada por comas
    $productos_str = implode(',', $productos);
    
    // Modificar la consulta para excluir los productos en el array
    $sql = "SELECT * FROM productos WHERE ID_CATEGORIA = $id AND ID_PRODUCTO NOT IN ($productos_str)";
    $query = mysqli_query($conexion, $sql);
    $resultado = [];
    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }
    return $resultado;
}


function buscarCategoriaProductos($conexion, $id, $cesta) {
    // Obtener todas las categorías hijas
    $sql = "SELECT ID_CATEGORIA FROM categorias WHERE CATEGORIA_PADRE = $id";
    $query = mysqli_query($conexion, $sql);
    $categorias_hijas = [$id]; // Incluir la categoría padre

    while ($fila = mysqli_fetch_assoc($query)) {
        $categorias_hijas[] = $fila['ID_CATEGORIA'];
    }

    // Convertir el array de categorías en una cadena separada por comas
    $categorias_hijas_str = implode(',', $categorias_hijas);

    // Convertir la array de cesta en una cadena separada por comas
    $cesta_str = implode(',', $cesta);

    // Modificar la consulta para incluir las categorías hijas y la categoría padre, y excluir los productos en la cesta
    $sql = "SELECT * FROM productos WHERE id_categoria IN ($categorias_hijas_str) AND ID_PRODUCTO NOT IN ($cesta_str)";
    $query = mysqli_query($conexion, $sql);
    $resultado = [];

    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }

    return $resultado;
}