<?php
$titulo = "Modificar datos";
include "../vistas/header.php";
?>

<div class="formulario">

    <form action="controladores/controler_cuenta.php?page=contacto" method="post" class="container">

        <h3 class="h3-form">Modificar datos personales</h3>

        <div class="mitad">
            <label for="nombre">Correo</label>
            <input type="text" name="correo" id="correo" <?php echo "value='" . $_SESSION['CORREO_ELECTRONICO'] . "'"; ?> readonly><br>

            <label for="telefono">Telefono <span class="error"><?php if (isset($errores['tel']))echo $errores['tel'] ?></span></label>
            <input type="text" name="telefono" id="telefono" <?php echo "value='$telefono'";?>><br>

            <input type="submit" value="Modificar Datos" name="contacto">
        </div>
    </form>
</div>
<?php

include "../vistas/footer.html";