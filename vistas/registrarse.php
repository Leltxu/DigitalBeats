<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/forms.css">
    <title>Registrarse</title>
</head>
<body> 
    <form action="controler_forms.php?page=register" method="post">
        <img src="../assets/img/logo.png" alt="" class="logo"><h3>Crear cuenta</h3>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre">
        <span class="error"><?php if (isset($errores['nombre'])) echo $errores['nombre'] ?></span>

        <label for="apellidos">Apellidos</label>
        <input type="text" name="apellidos" id="apellidos">
        <span class="error"><?php if (isset($errores['apellidos'])) echo $errores['apellidos'] ?></span>

        <label for="fecha">Fecha de nacimiento</label>
        <input type="text" name="fecha" id="fecha">
        <span class="error"><?php if (isset($errores['fecha'])) echo $errores['fecha'] ?></span>

        <label for="Telefono">Numero de Telefono</label>
        <input type="tel" name="tlfn" id="tlfn">
        <span class="error"><?php if (isset($errores['tlfn'])) echo $errores['tlfn'] ?></span>

        <label for="email">Correo Electronico</label>
        <input type="email" name="email" id="email">
        <span class="error"><?php if (isset($errores['email'])) echo $errores['email'] ?></span>

        <label for="contraseña">Contraseña</label>
        <input type="password" name="contraseña" id="contraseña">
        <span class="error"><?php if (isset($errores['contraseña'])) echo $errores['contraseña'] ?></span>

        <label for="contraseña">Repita Contraseña</label>
        <input type="password" name="rcontraseña" id="rcontraseña">
        <span class="error"><?php if (isset($errores['rcontraseña'])) echo $errores['rcontraseña'] ?></span>

        <input type="submit" value="Enviar" name="register">

        <a href="controler_forms.php?page=login">¿Ya tienes cuenta?</a>

    </form>
</body>
</html>