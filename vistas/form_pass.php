<?php
$titulo = "Modificar datos";
include "../vistas/header.php";
?>

<div class="formulario">

    <form action="controladores/controler_cuenta.php?page=pass" method="post" class="container">

        <h3 class="h3-form">Modificar datos personales</h3>

        <div class="mitad">
            <label for="actual">Contraseña Actual <span class="error"><?php if (isset($errores['actual'])) echo $errores['actual'] ?></span></label>
            <input type="password" name="actual" id="actual"><br>

            <label for="nueva">Nueva Contraseña <span class="error"><?php if (isset($errores['nueva']))echo $errores['nueva'] ?></span></label>
            <input type="password" name="nueva" id="nueva"><br>

            <label for="repite">Repite contraseña <span class="error"><?php if (isset($errores['repite'])) echo $errores['repite'] ?></span></label>
            <input type="password" name="repite" id="repite"><br>

            <input type="submit" value="Modificar Datos" name="pass">
        </div>
    </form>
</div>
<?php

include "../vistas/footer.html";