<?php
function mostrarTarjetas($productos,$cantidad) {
    include_once 'modelos/model_productos.php';
    $contador=0;
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
        if ($contador>=$cantidad) {
            break;
        }
        $contador++;
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
            } else if (!preg_match('/[A-Z]/', $dato) || !preg_match('/[0-9]/', $dato) || !preg_match('/[a-z]/', $dato) || !preg_match('/[!@#$%^&*()_+\-=\[\]{};:\'",<>\./?\\|`~]/', $dato)) {
                return 'La contraseña debe tener al menos una mayúscula, una minúscula, un número y un carácter especial';
            }

        } else if ($type == 'tel') {
            if (!is_numeric($dato)) {
                return 'El telefono no es valido';
            } else if (strlen($dato) != 9) {
                return 'El telefono debe tener 9 digitos';
            }
        }
    }
    
}

function censurarCorreo($email) {
    // Dividir el correo en nombre de usuario y dominio
    list($usuario, $dominio) = explode('@', $email);
    
    // Censurar parte del nombre de usuario 
    $usuario_censurado = substr($usuario, 0, 1) . str_repeat('*', strlen($usuario) - 1);
    
    // Censurar parte del dominio 
    list($dominio_nombre, $extension) = explode('.', $dominio, 2);
    $dominio_censurado = substr($dominio_nombre, 0, 1) . str_repeat('*', strlen($dominio_nombre) - 1) . '.' . $extension;
    
    // Devolver el correo censurado
    return $usuario_censurado . '@' . $dominio_censurado;
}