<?php
$titulo = "Productos";
include "header.php";

?>
<div class="pro-contenedor">
    <div class="cont-productos">
        <h3>+<?php echo rand(10, 50) ?> resultados para "<?php  echo $buscar ?>"</h3>
        <div class="tarjetas">
            <?php
            if (isset($producto)) {
                mostrarTarjetas(buscarProducto($conexion, $producto),50);
            } else if (isset($categoria)) {
                mostrarTarjetas(buscarCategoria($conexion, $_GET['categoria']),50);
            }
            ?>
        </div>
    </div>

</div>

<?php
include "footer.html";
?>