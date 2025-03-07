<?php
$titulo = "Productos";
include "header.php";

?>
<div class="pro-contenedor">
    <div class="cont-productos">
        <h3>+<?php echo rand(10, 500) ?> resultados para "<?php  echo $buscar ?>"</h3>
        <div class="tarjetas">
            <?php
            if (isset($producto)) {
                mostrarTarjetas(buscarProducto($conexion, $producto));
            } else if (isset($categoria)) {
                mostrarTarjetas(buscarCategoria($conexion, $_GET['categoria']));
            }
            ?>
        </div>
    </div>

</div>

<?php
include "footer.html";
?>