<?php
session_start();
include "../conexion.php";
include "../functions.php";
include "../modelos/modelo_user.php";

if (!isset($_SESSION['NOMBRE'])) {
    header('Location: ../index.php');
    exit();
}

if (isset($_POST['datos'])) {
    $nombre = sanearDatos($_POST['nombre']);
    $apellidos = sanearDatos($_POST['apellidos']);
    $fecha = sanearDatos($_POST['fecha']);

    $errores = [];
    $errores['nombre'] = validarDatos($nombre, 'text');
    $errores['apellidos'] = validarDatos($apellidos, 'text');
    $errores['fecha'] = validarDatos($fecha, 'text');

    if (empty($errores['nombre']) && empty($errores['apellidos']) && empty($errores['fecha'])) {
        $_SESSION['NOMBRE'] = $nombre;
        $_SESSION['APELLIDOS'] = $apellidos;
        $_SESSION['FECHA_NACIMIENTO'] = $fecha;
        actualizarDatos($conexion, $nombre, $apellidos, $fecha, $_SESSION['CORREO_ELECTRONICO']);
        header('Location: controler_cuenta.php');
        exit();
    }
}

if (isset($_POST['contacto'])) {
    $telefono = sanearDatos($_POST['telefono']);
    $errores = [];
    $errores['tel'] = validarDatos($telefono, 'tel');

    if (empty($errores['tel'])) {
        $_SESSION['TELEFONO'] = $telefono;
        actualizarContacto($conexion, $telefono, $_SESSION['CORREO_ELECTRONICO']);
        header('Location: controler_cuenta.php');
        exit();
    }
}

if (isset($_POST['pass'])) {
    $actual = sanearDatos($_POST['actual']);
    $nueva = sanearDatos($_POST['nueva']);
    $repite = sanearDatos($_POST['repite']);

    $errores = [];
    $errores['nueva'] = validarDatos($nueva, 'password');
    $errores['repite'] = validarDatos($repite, type: 'empty');

    if (!password_verify($actual, $_SESSION['PASSWORD'])) {
        $errores['actual'] = "La contraseña no es correcta";
    }

    if (empty($errores['actual']) && empty($errores['nueva']) && empty($errores['repite'])) {
            if ($actual == $nueva) {
                $errores['nueva'] = "La nueva contraseña no puede ser igual a la actual";
            } else if ($nueva == $repite) {
                $_SESSION['PASSWORD'] = $nueva;
                actualizarPass($conexion, $nueva, $_SESSION['CORREO_ELECTRONICO']);
                header('Location: controler_cuenta.php');
                exit();
            } else {
                $errores['nueva'] = "Las contraseñas no coinciden";
            }
        
        }
}

if (isset($_POST['dir'])) {
    $direccion = sanearDatos($_POST['dir']);

    $errores = [];
    $errores['dir'] = validarDatos($direccion, type: 'empty');

    if (empty($errores['dir'])) {
        $_SESSION['DIRECCION'] = $direccion;
        actualizarDireccion($conexion, $direccion, $_SESSION['CORREO_ELECTRONICO']);
        header('Location: controler_cuenta.php');
        exit();
    }
}

if (isset($_GET['page'])) {
    if ($_GET['page'] == "datos") {

        if (isset($_POST['nombre'])) {
            $nombre = $_POST['nombre'];
        } else {
            $nombre = $_SESSION['NOMBRE'];
        }

        if (isset($_POST['apellidos'])) {
            $apellidos = $_POST['apellidos'];
        } else {
            $apellidos = $_SESSION['APELLIDOS'];
        }

        if (isset($_POST['fecha'])) {
            $fecha = $_POST['fecha'];
        } else {
            $fecha = $_SESSION['FECHA_NACIMIENTO'];
        } 

        include __DIR__ . "/../vistas/form_datos.php";
        exit();
    } if ($_GET['page'] == "contacto") {
        if (isset($_POST['telefono'])) {
            $telefono = $_POST['telefono'];
        } else {
            $telefono = $_SESSION['TELEFONO'];
        }

        include __DIR__ . "/../vistas/form_contacto.php";
        exit();
    } else if ($_GET['page'] == "pass") {
        include __DIR__ . "/../vistas/form_pass.php";
        exit();
    } else if (isset($_POST['dir'])) {
            $direccion = $_POST['dir'];
        } else {
            $direccion = $_SESSION['DIRECCION'];
        }

        include __DIR__ . "/../vistas/form_direccion.php";
        exit();
} else {
    include __DIR__ . "/../vistas/micuenta.php";
}



