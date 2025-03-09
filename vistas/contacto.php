

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/forms.css">
    <title>Contacto</title>
</head>

<body>
    
    <form action="index.php?page=contacto" method="post" class="form">
        <a href="index.php" class="a-logo"><img src="assets/img/logo.png" alt="logo" class="logo"></a>
       
        <label for="email">Correo Electronico <span class="error"><?php if (isset($errores['email'])) echo $errores['email'] ?></span> </label>
        <input type="email" name="email" id="email" <?php if (isset($_POST['email'])) echo 'value="'.$_POST['email'].'"' ?>><br>

        <label for="nombre">Nombre <span class="error"><?php if (isset($errores['nombre'])) echo $errores['nombre'] ?></span> </label>
        <input type="text" name="nombre" <?php if (isset($_POST['nombre'])) echo 'value="'.$_POST['nombre'].'"' ?>>
        
        <label for="motivo">Motivo de contacto</label>
        <select id="opciones" name="opciones">
            
            <option value="problemas" <?php if (isset($_POST['opciones']) && $_POST['opciones'] == "problemas") echo "selected"?>>📦Problemas con mi pedido</option>
            <option value="curriculum" <?php if (isset($_POST['opciones']) && $_POST['opciones'] == "curriculum") echo "selected"?>>👷🏿Quiero trabajar aqui</option>
            <option value="otro" <?php if (isset($_POST['opciones']) && $_POST['opciones'] == "otro") echo "selected"?>>📓Otro motivo</option>
        </select><br>
        
        
        <label for="pedido">Numero de pedido (Opcional)</label><br>
        <input type="text" name="pedido" <?php if (isset($_POST['pedido'])) echo 'value="'.$_POST['pedido'].'"' ?>>
        
        <label for="descripcion">Descripcion <span class="error"><?php if (isset($errores['descripcion'])) echo $errores['descripcion'] ?></span></label>
        <input type="text" name="descripcion" id="descripcion" <?php if (isset($_POST['pedido'])) echo 'value="'.$_POST['pedido'].'"' ?>>
        <input type="submit" name="contacto" value="Enviar">
    
    </form>
</body>
</html>