<?php

function obetenerUser($conexion, $email){
    try {
        $sql = "SELECT * FROM usuarios WHERE correo_electronico = ?";
        $stmt = mysqli_prepare($conexion, $sql);
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        
        if ($fila = mysqli_fetch_assoc($result)) {
            return $fila;
        } else {
            return false;
        }
    } catch (Exception $e) {
        return"Error al obtener usuario";
    }
}



function crearUser($conexion, $nombre, $apellidos, $fecha, $telefono, $correo, $contraseña) {
    $contraseña = password_hash($contraseña, PASSWORD_DEFAULT);
    $sql = "INSERT INTO usuarios (NOMBRE, APELLIDOS, FECHA_NACIMIENTO, TELEFONO, CORREO_ELECTRONICO, PASSWORD) VALUES ('$nombre', '$apellidos', '$fecha', '$telefono', '$correo', '$contraseña')";
    mysqli_query($conexion, $sql);
}

function loginUser($conexion, $email, $password) {
    try {
        $usuario = obetenerUser($conexion, $email);
        if ($usuario) {
            $contraseña = $usuario['PASSWORD'];
        } else {
            return false;
        }

        if (password_verify($password, $contraseña)) {
            return $usuario;
        } else {
            return false;
        }
    } catch (Exception $e) {
        echo "No se ha podido iniciar sesion";
    }
}
