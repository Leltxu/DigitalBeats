<?php
$titulo = "Modificar datos";
include "../vistas/header.php";
?>

<div class="formulario">

    <form action="controladores/controler_cuenta.php?page=direccion" method="post" class="container">

        <h3 class="h3-form">Modificar datos personales</h3>

        <div class="mitad">
            <label for="dir">Direccion <span class="error"><?php if (isset($errores['dir'])) echo $errores['dir'] ?></span></label>
            <input type="text" name="dir" id="dir" <?php echo "value='" . $direccion . "'"; ?>><br>

            <input type="submit" value="Modificar Datos" name="direccion">
        </div>
    </form>
</div>
<?php

include "../vistas/footer.html";