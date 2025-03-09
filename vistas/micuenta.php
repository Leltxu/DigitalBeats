<?php 
$titulo="Mi cuenta";
include "header.php";
?>
    <h2>Mi cuenta</h2> 
<div class="cuenta-contenedor">

    <div class="lateral">
        <a href="index.php?page=cesta">Mi cesta</a>
        <a href="">Mis opiniones</a>
        <a href="index.php?page=close">Cerrar sesion</a>
    </div> 
    
    <div class="datos">
        <div class="bloque-datos">
            <h3>Datos personales</h3>
            <ul>
                <li><b>Nombre: </b><?php echo $_SESSION['NOMBRE']?></li>
                <li><b>Apellidos: </b> <?php echo $_SESSION['APELLIDOS']?></li>
                <li><b>Fecha de nacimiento: </b><?php echo $_SESSION['FECHA_NACIMIENTO'] ?></li>
            </ul>
            <a href="controladores/controler_cuenta.php?page=datos">Modificar Informacion</a>
        </div>
        <div class="bloque-datos">
            <h3>Datos de contacto</h3>
            <ul>
                <li><b>Email: </b><?php echo censurarCorreo($_SESSION['CORREO_ELECTRONICO']) ?></li>
                <li><b>Telefono: </b><?php echo $_SESSION['TELEFONO']?></li>
            </ul>
            <a href="controladores/controler_cuenta.php?page=contacto">Modificar Informacion</a>
        </div>
        <div class="bloque-datos">
            <h3>Contraseña</h3>
            <ul>
                <li><b>Contraseña: </b>********</li>
            </ul>
            <a href="controladores/controler_cuenta.php?page=pass">Cambiar Contraseña</a>
        </div>
        <div class="bloque-datos">
            <h3>Dirección de envio</h3>
            <ul>
                <li><b>Direccion: </b><?php echo $_SESSION['DIRECCION']?></li>
            </ul>
            <a href="controladores/controler_cuenta.php?page=direccion">Modificar Informacion</a>

        </div>
    </div>
</div>


<?php
include "footer.html";
?>