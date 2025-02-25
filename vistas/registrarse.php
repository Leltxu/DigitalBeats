<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/forms.css">
    <title>Registrarse</title>
</head>
<body> 
    <form action="">
        <img src="assets/img/logo.png" alt="" class="logo"><h3>Crear cuenta</h3>
        <label for="nombre">Nombre y Apellidos</label>
        <input type="text" name="nombre" id="nombre"><br>

        <label for="fecha">Fecha de nacimiento</label>
        <input type="text" name="fecha" id="fecha"><br>

        <label for="Telefono">Numero de Telefono</label>
        <input type="tel" name="tlfn" id="tlfn"><br>

        <label for="email">Correo Electronico</label>
        <input type="email" name="email" id="email"><br>

        <label for="contraseña">Contraseña</label>
        <input type="password" name="contraseña" id="contraseña"><br>

        <label for="contraseña">Repita Contraseña</label>
        <input type="password" name="rcontraseña" id="rcontraseña"><br>

        <input type="submit" value="Enviar">

        <a href="controler_forms.php.php?page=login">¿Ya tienes cuenta?</a>

    </form>
</body>
</html>