<?php
$titulo = 'Cesta';
include 'header.php';
?>

<div class="c-container">
    <!-- Sección de productos en la cesta -->
    <div class="c-productos">
        <h2>Cesta</h2>

        <?php
        if (isset($_SESSION['cesta']) && count($_SESSION['cesta']) > 0) {
            $totalProductos = 0;
            $precioTotal = 0;
            foreach ($_SESSION['cesta'] as $key => $producto) {
                $detalleProducto = mostrarDetallesProducto($conexion, $producto['producto']);
                $precio = $detalleProducto['PRECIO_DESCUENTO'] == 0 ? $detalleProducto['PRECIO'] : $detalleProducto['PRECIO_DESCUENTO'];
                echo "<div class='c-producto'>
                        <div class='foto'>
                            <img src='$detalleProducto[FOTO]' alt='$detalleProducto[NOMBRE]'>
                        </div>
                        <div class='c-texto'>
                            <p>$detalleProducto[NOMBRE]</p>
                            <label for='cantidad1'>Cantidad</label>
                            <form action='index.php?page=cesta' method='post'>
                                <input type='hidden' name='id' value='$key'>
                                <input type='number' name='cantidad' value='$producto[cantidad]' min='1' max='15'>
                                <button type='submit' name='actualizar'>Actualizar</button>
                            </form>
                            <form action='index.php?page=cesta' method='post'>
                                <input type='hidden' name='id' value='$key'>
                                <button type='submit' name='borrar'>Quitar</button>
                            </form>
                            <p>$$precio</p>
                        </div>
                    </div>";
                $totalProductos++;
                $precioTotal = $precioTotal + ($precio * $producto['cantidad']);
                if ($totalProductos == 0) {
                    $similares = null;
                    $relacionados = null;
                } else if ($totalProductos == 1) {
                    $relacionados = $detalleProducto['ID_CATEGORIA'];
                    $similares = $detalleProducto['ID_CATEGORIA'];
                } else if ($totalProductos == 2) {
                    $similares = $detalleProducto['ID_CATEGORIA'];
                }
                $lsitaProductos[] = $detalleProducto['ID_PRODUCTO'];
            }
        } else {
            $precioTotal = 0;
            $totalProductos = 0;
            echo "<p>No hay productos en la cesta</p>";
        }
        ?>
    </div>
    <!-- Sección de totales y productos relacionados -->
    <div class="c-total-relacionados">
        <!-- Total -->
        <div class="c-total">
            <p>Subtotal (<?php echo $totalProductos ?> productos): <?php echo $precioTotal ?>€</p>
            <input type="submit" value="Tramitar Pedido">
        </div>

        <!-- Productos Relacionados -->
        <?php
        if (isset($relacionados) && $relacionados != null) {
            ?>
            <div class="c-relacionados">
                <p>Productos Relacionados</p>
                <div class="c-scroll">
                    <?php

                    $lista = categoriasProductos($conexion, $relacionados, $lsitaProductos);

                    if (count($lista) > 0) {
                        mostrarTarjetas($lista);
                    } else {
                        echo "<p>No se a encontrado productos relacionados</p>";
                    }
                    ?>
                </div>
            </div>
            <?php
        }
        ?>
    </div>
</div>
<!-- Productos similares -->
<?php

if (isset($similares) && $similares != null) {
    ?>
    <div class="similares">
        <p>Similares</p>
        <div class="pr-similares">
            <?php
            $listaSimilares = buscarCategoriaProductos($conexion, $similares, $lsitaProductos);
            if (count($listaSimilares) > 0) {
                mostrarTarjetas($listaSimilares);
            } else {
                echo "<p>No se a encontrado productos similares</p>";
            }
            ?>
        </div>
    </div>
    <?php
}
?>
</div>

<?php
include 'footer.html';
?>