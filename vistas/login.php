<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/forms.css">
    <title>Inicio de sesion</title>
</head>
<body>
    
    <form action="">
        <img src="../assets/img/logo.png" alt="" class="logo"><h3>Inicio de sesion</h3>
       
        <label for="email">Correo Electronico</label>
        <input type="email" name="email" id="email"><br>

        <label for="contraseña">Contraseña</label>
        <input type="password" name="contraseña" id="contraseña"><br>

        <input type="submit" value="Iniciar sesion">
        <a href="controler_forms.php?page=register">¿No tienes cuenta?</a>
       

    </form>
</body>
</html>