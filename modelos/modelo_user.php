<?php

function obetenerUser($conexion, $email, $password) {
    $sql = "SELECT * FROM usuarios WHERE email = '$email' AND password = '$password'";
    $query = mysqli_query($conexion, $sql);
    $resultado = [];
    while ($fila = mysqli_fetch_assoc($query)) {
        $resultado[] = $fila;
    }
    return $resultado[0];
}

function crearUser($conexion, $nombre, $apellidos, $fecha, $telefono, $correo, $contraseña) {
    $contraseña = password_hash($contraseña, PASSWORD_DEFAULT);
    $sql = "INSERT INTO usuarios (NOMBRE, APELLIDOS, FECHA_NACIMIENTO, TELEFONO, EMAIL, PASSWORD) VALUES ('$nombre', '$apellidos', '$fecha', '$telefono', '$correo', '$contraseña')";
}
