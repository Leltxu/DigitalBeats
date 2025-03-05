<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/forms.css">
    <title>Inicio de sesion</title>
</head>

<body>

    <form action="controler_forms.php?page=login" method="post" class="container">
        <a href="../index.php" class="a-logo"><img src="../assets/img/logo.png" alt="logo" class="logo"></a>

        <h3>Inicio de sesion</h3>

        <div class="mitad">
            <span class="error"><b><?php if(isset($errores['login'])) echo $errores['login'] ?></b></span>
            <label for="email">Correo Electronico <span class="error"><?php if(isset($errores['correo'])) echo $errores['correo'] ?></span></label>
            <input type="email" name="email" id="email" <?php if (isset($_POST['email'])) echo "value='".$_POST['email']."'"; ?>><br>

            <label for="contraseña">Contraseña <span class="error"><?php if (isset($errores['contraseña'])) echo $errores['contraseña']?></span></label>
            <input type="password" name="contraseña" id="contraseña"><br>

            <input type="submit" value="Iniciar sesion" name="login">

            <a href="controler_forms.php?page=register">¿No tienes cuenta?</a>
        </div>


    </form>
</body>

</html>