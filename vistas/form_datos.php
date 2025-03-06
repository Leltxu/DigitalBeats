<?php
$titulo = "Modificar datos";
include "../vistas/header.php";
?>

<div class="formulario">

    <form action="controladores/controler_cuenta.php?page=datos" method="post" class="container">

        <h3 class="h3-form">Modificar datos personales</h3>

        <div class="mitad">
            <label for="nombre">Nombre <span class="error"><?php if (isset($errores['correo'])) echo $errores['correo'] ?></span></label>
            <input type="text" name="nombre" id="nombre" <?php echo "value='" . $nombre . "'"; ?>><br>

            <label for="apellidos">Apellidos <span class="error"><?php if (isset($errores['apellidos']))echo $errores['apellidos'] ?></span></label>
                <input type="text" name="apellidos" id="apellidos" <?php echo "value='$apellidos'";?>><br>

                <label for="fecha">Fecha de Nacimiento <span class="error"><?php if (isset($errores['fecha'])) echo $errores['fecha'] ?></span></label>
                <input type="date" name="fecha" id="fecha" <?php echo "value='$fecha'" ?>><br>

                <input type="submit" value="Modificar Datos" name="datos">
            </div>
        </form>
    </div>
    <?php
                    include "../vistas/footer.html";