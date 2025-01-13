<?php
    $titulo = "Pagina Principal";
    include "header.php";
    include "functions.php";
?>
    <div class="bienvenida">
        <h2>Bienvenido a Digital Beats ❤️</h2>
    </div>

    <div class="productos">
        <h3>Novedades</h3>
        <div class="tarjetas">
            <?php
            $titulo = "Intel coro I5 11560 4.6GHz, 8 nucleos 16 hilos";
            $precio = rand(150, 250);
            $precioAntes = rand(251, 350);
            $estrellas = rand(0, 10);
            mostrarTarjetas(7, $titulo, $precio, $precioAntes, $estrellas);
            ?>
        </div>
    </div>
    
    <div class="productos">
        <h3>Destacado</h3>
        <div class="tarjetas">
            <?php mostrarTarjetas(7, "Intel Core I5 115554 4.5 GHz, 8 nucleos 4 hiloes"); ?>
        </div>
    </div>
    <div class="productos">
        <h3>Lo mas vendido</h3>
        <div class="tarjetas">
            <?php mostrarTarjetas(7, "Intel Core I5 115554 4.5 GHz, 8 nucleos 4 hiloes"); ?>
        </div>
    </div>
<?php
    include "footer.html";
?>