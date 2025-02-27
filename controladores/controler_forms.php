<?php
require_once '../conexion.php';
require_once '../modelos/modelo_user.php';
require_once '../functions.php';

session_start();

if (isset($_POST['login'])) {
    $correo = sanearDatos($_POST['email']);
    $contraseña = sanearDatos($_POST['contraseña']);
    $errores = [];
    $errores['email'] = validarDatos($correo, 'email');
    $errores['contraseña'] = validarDatos($contraseña, 'password');
    if (empty($errores['email']) && empty($errores['contraseña'])) {
        $usuario = obetenerUser($conexion, $correo, $contraseña);
        $usuario = $usuario['NOMBRE'];
        if ($usuario) {
            $_SESSION['user'] = $usuario;
        } else {
            $errores['login'] = 'El usuario o la contraseña son incorrectos';
        }
    }
}

if (isset($_POST['register'])) {
    $nombre = sanearDatos($_POST['nombre']);
    $apellidos = sanearDatos($_POST['apellidos']);
    $fecha = sanearDatos($_POST['fecha']);
    $telefono = sanearDatos($_POST['tlfn']);
    $correo = sanearDatos($_POST['email']);
    $contraseña = sanearDatos($_POST['contraseña']);
    $rcontraseña = sanearDatos($_POST['rcontraseña']);
    $errores = [];
    $errores['nombre'] = validarDatos($nombre, 'text');
    $errores['apellidos'] = validarDatos($apellidos, 'text');
    $errores['fecha'] = validarDatos($fecha, 'text');
    $errores['tlfn'] = validarDatos($telefono, 'tel');
    $errores['email'] = validarDatos($correo, 'email');
    $errores['contraseña'] = validarDatos($contraseña, 'password');
    $errores['rcontraseña'] = validarDatos($rcontraseña, 'password');
    if (empty($errores['nombre']) && empty($errores['apellidos']) && empty($errores['fecha']) && empty($errores['tlfn']) && empty($errores['email']) && empty($errores['contraseña']) && empty($errores['rcontraseña'])) {
        if ($contraseña == $rcontraseña) {
            crearUser($conexion, $nombre, $apellidos, $fecha, $telefono, $correo, $contraseña);
            $_SESSION['user'] = $nombre;
            header('Location: ../index.php');
        } else {
            $errores['contraseña'] = 'Las contraseñas no coinciden';
        }
    } else {
        include "../vistas/registrarse.php";
        exit();
    }
}






if (empty($_SESSION['user'])) {
    if (isset($_GET['page'])) {
        if ($_GET['page'] == 'login') {
            include "../vistas/login.php";
        } else if ($_GET['page'] == 'register') {
            include "../vistas/registrarse.php";
        }
    } else {
        include "../vistas/login.php";
    }
}  else {
    include "../vistas/micuenta.php";
}
