<?php
$titulo="Pagina Principal";
include "paginas/header.php";
?>
    <h1>Pagina principal</h1>

    <h2>Novedades</h2>
    <div class="tarjetas">
    <?php
        for ($i=0; $i < 7; $i++) {
            $tituloProducto="Intel coro I5 11560 4.6GHz, 8 nucleos 16 hilos";
            $precioActual=rand(150,250);
            $precioAntes=rand(251,350);
            $estrella=rand(0,10);
            include "plantillas/tarjeta.php";
        }
    ?>
    </div>
<?php
include "paginas/footer.html";
?>