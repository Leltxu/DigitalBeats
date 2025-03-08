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
    $sql = "INSERT INTO usuarios (NOMBRE, APELLIDOS, FECHA_NACIMIENTO, TELEFONO, CORREO_ELECTRONICO, `PASSWORD`) VALUES ('$nombre', '$apellidos', '$fecha', '$telefono', '$correo', '$contraseña')";
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

function actualizarDatos($conexion,$nombre,$apellidos,$fecha,$email){
    $sql = "UPDATE usuarios SET NOMBRE = '$nombre', APELLIDOS = '$apellidos', FECHA_NACIMIENTO = '$fecha' WHERE CORREO_ELECTRONICO = '$email'";
    mysqli_query($conexion, $sql);
}

function actualizarContacto($conexion,$telefono,$email){
    $sql = "UPDATE usuarios SET TELEFONO = '$telefono' WHERE CORREO_ELECTRONICO = '$email'";
    mysqli_query($conexion, $sql);
}

function actualizarPass($conexion,$password,$email){
    $password = password_hash($password, PASSWORD_DEFAULT);
    $sql = "UPDATE usuarios SET PASSWORD = '$password' WHERE CORREO_ELECTRONICO = '$email'";
    mysqli_query($conexion, $sql);
}

function actualizarDireccion($conexion,$direccion,$email){
    $sql = "UPDATE usuarios SET DIRECCION = '$direccion' WHERE CORREO_ELECTRONICO = '$email'";
    mysqli_query($conexion, $sql);
}

function correoExiste($conexion,$email) {
    $sql ="SELECT CORREO_ELECTRONICO FROM usuarios WHERE CORREO_ELECTRONICO = '$email'";   
    $resul=mysqli_query($conexion, $sql);
    if (mysqli_num_rows($resul) > 0) {
        return "Este correo electrónico ya está registrado.";
    }
}

function insertarContacto($conexion,$email,$nombre,$motivo,$pedido,$descripcion){
    $sql = "INSERT INTO MENSAJES (CORREO_ELECTRONICO, NOMBRE, MOTIVO_CONTACTO, NUMERO_PEDIDO, DESCRIPCION) VALUES ('$email', '$nombre', '$motivo', '$pedido', '$descripcion')";
    mysqli_query($conexion, $sql);
}