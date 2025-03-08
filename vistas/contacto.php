<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/forms.css">
    <title>Contacto</title>
</head>
<body>
    
    <form action="controladores/controler_forms.php" method="post">
        <a href="index.php" class="a-logo"><img src="assets/img/logo.png" alt="logo" class="logo"></a>
       
        <label for="email">Correo Electronico</label>
        <input type="email" name="email" id="email"><br>
        <span class="error">
        <?php 
            if (isset($errores['email'])) {
                echo $errores['email'];
            }
        ?>
        </span>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre">
        <span class="error">
        <?php 
            if (isset($errores['nombre'])) {
                echo $errores['nombre'];
            }
        ?>
        </span>
        
        <label for="motivo">Motivo de contacto</label>
        <select id="opciones" name="opciones">
            
            <option value="problemas" selected>Problemas con mi pedido</option>
            <option value="curriculum">👷🏿Quiero trabajar aqui</option>
            <option value="otro">📓Otro motivo</option>
        </select><br>
        
        
        <label for="pedido">Numero de pedido (Opcional)</label><br>
        <input type="text" name="pedido">
        
        <label for="descripcion">Descripcion</label>
        <input type="text" name="descripcion" id="descripcion">
        <span class="error">
        <?php 
            if (isset($errores['descripcion'])) {
                echo $errores['descripcion'];
            }
        ?>
        </span>
        <input type="submit" name="Enviar" value="Enviar">
    
    </form>
</body>
</html>