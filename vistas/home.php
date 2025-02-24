<?php
    $titulo = "Pagina Principal";
    include "header.php";
    
?>
    <div class="bienvenida">
        <h2>Bienvenido a Digital Beats ❤️</h2>
    </div>

    <div class="productos">
        <h3>Novedades</h3>
        <div class="tarjetas">
            <?php
            mostrarTarjetas(mostrarProductos($conexion,'novedades'));
            ?>
        </div>
    </div>
    
    <div class="productos">
        <h3>Destacado</h3>
        <div class="tarjetas">
            <?php mostrarTarjetas(mostrarProductos($conexion,'destacados')); ?>
        </div>
    </div>
    <div class="productos">
        <h3>Lo mas vendido</h3>
        <div class="tarjetas">
            <?php mostrarTarjetas(mostrarProductos($conexion,'destacados')); ?>
        </div>
    </div>
<?php
    include "footer.html";
?>