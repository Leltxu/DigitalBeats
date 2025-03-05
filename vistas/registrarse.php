<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/forms.css">
    <title>Registrarse</title>
</head>
<body> 
    <form action="controler_forms.php?page=register" method="post" class="container">
        <a href="../index.php" class="a-logo"><img src="../assets/img/logo.png" alt="" class="logo"></a>
        
        <h3>Crear cuenta</h3>
        
        <div class="row">
            <label for="nombre">Nombre <span class="error"><?php if (isset($errores['nombre'])) echo $errores['nombre'] ?></span></label>
            <label for="apellidos">Apellidos <span class="error"><?php if (isset($errores['apellidos'])) echo $errores['apellidos'] ?></span></label>
        </div>
        <div class="row">
            <input type="text" name="nombre" id="nombre" <?php if (isset($_POST['nombre'])) echo "value='".$_POST['nombre']."'" ?>>
            <input type="text" name="apellidos" id="apellidos" <?php if (isset($_POST['apellidos'])) echo "value='".$_POST['apellidos']."'" ?>>
        </div>
        
        <div class="row">
            <label for="fecha">Fecha de nacimiento <span class="error"><?php if (isset($errores['fecha'])) echo $errores['fecha'] ?></span></label>
            <label for="tlfn">Número de Teléfono <span class="error"><?php if (isset($errores['tlfn'])) echo $errores['tlfn'] ?></span></label>
        </div>
        <div class="row">
            <input type="date" name="fecha" id="fecha" <?php if (isset($_POST['fecha'])) echo "value='".$_POST['fecha']."'" ?>>
            <input type="tel" name="tlfn" id="tlfn" <?php if (isset($_POST['tlfn'])) echo "value='".$_POST['tlfn']."'" ?>>
        </div>
        
        <label for="email">Correo Electrónico <span class="error"><?php if (isset($errores['email'])) echo $errores['email'] ?></span></label>
        <input type="email" name="email" id="email" <?php if (isset($_POST['email'])) echo "value='".$_POST['email']."'" ?>>
        
        <div class="row">
            <label for="contraseña">Contraseña <span class="error"><?php if (isset($errores['contraseña'])) echo $errores['contraseña'] ?></span></label>
            <label for="rcontraseña">Repite Contraseña</label>
        </div>
        <div class="row">
            <input type="password" name="contraseña" id="contraseña">
            <input type="password" name="rcontraseña" id="rcontraseña">
        </div>
        
        <input type="submit" value="Enviar" name="register">
        <a href="controler_forms.php?page=login">¿Ya tienes cuenta?</a>
    </form>
</body>
</html>