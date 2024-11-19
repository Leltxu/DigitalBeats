<?php
$titulo="Pagina Principal";
include "paginas/header.php";
?>
    <h1>Pagina principal</h1>

    <div class="novedades">
    <?php
        for ($i=0; $i < 5; $i++) { 
            include "plantillas/tarjeta.html";
        }
    ?>
    </div>
<?php
include "paginas/footer.html";
?>