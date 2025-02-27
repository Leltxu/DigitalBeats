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
function sanearDatos($datos) {
    $datos = trim($datos);
    $datos = stripslashes($datos);
    $datos = htmlspecialchars($datos);
    return $datos;
}

function validarDatos($dato, $type) {
    if (empty($dato)) {
        return 'El campo es requerido';
    } else {
        if ($type == 'text') {
            if (is_numeric($dato)) {
                return 'El campo no puede contener numeros';
            }
        } else if ($type == 'email') {
            if (!filter_var($dato, FILTER_VALIDATE_EMAIL)) {
                return 'El email no es valido';
            }
        } else if ($type == 'password') {
            if (strlen($dato) < 8) {
                return 'La contraseña debe tener al menos 8 caracteres';
            } else if (!preg_match('/[A-Z]/', $dato) && !preg_match('/[0-9]/', $dato) && !preg_match('/[a-z]/', $dato) && !preg_match('/[!@#$%^&*()]/', $dato)) {
                return 'La contraseña debe tener al menos una mayuscula, minuscula, numero y caracter especial';
            }

        } else if ($type == 'tel') {
            if (!is_numeric($dato)) {
                return 'El telefono no es valido';
            }
        }
    }
    
}