<?php
$titulo = $detalleProducto['NOMBRE'];
include '../vistas/header.php';
?>
<div class="m-pr">
    <div class="pr-izq">
        <img src="<?php echo $detalleProducto['FOTO']; ?>" alt="<?php echo $detalleProducto['NOMBRE']; ?>">
    </div>

    <div class="pr-der">
        <div class="info">
            <h2><?php echo $detalleProducto['NOMBRE']; ?></h2>
            <p><?php echo $detalleProducto['DESCRIPCION']; ?></p>
            <p>
            <ul class="caracteristicas">
                <?php
                $caracteristicas = explode(',', $detalleProducto['CARACTERISTICAS']);
                foreach ($caracteristicas as $caracteristica) {
                    echo '<li>' . trim($caracteristica) . '</li>';
                }
                ?>
            </ul>
            </p>
            <form action="../controladores/controler_cesta.php" method="post">
                <input type="hidden" name="id" value="<?php echo $detalleProducto['ID_PRODUCTO']; ?>">
                <input type="number" name="cantidad" value="1" min="1" max="15">
                <button type="submit">Añadir al carrito</button>
            </form>
        </div>
        <div class="precio">
            <p class="actual"><?php echo $precioActual; ?>€</p>
            <?php
            if ($precioAntes > 0) {
                echo "<p class='antes'>" . $precioAntes . "€</p>";
            }
            ?>
        </div>
    </div>
</div>

<div class="pr-relacionados">
    <h3>Productos relacionados</h3>
    <div class="pr-relacionados-cont">
        <?php
        mostrarTarjetas($relacionados);
        ?>
    </div>
</div>

<div class="pr-opiniones">
    <h3>Opiniones</h3>
    <?php
    if (isset($_SESSION['NOMBRE'])) {
        ?>
        <form action="../controladores/controler_opiniones.php" method="post">
            <input type="hidden" name="id" value="<?php echo $detalleProducto['ID_PRODUCTO']; ?>">
            <label for="estrellas">Valoracion</label>
            <input type="number" name="estrellas" min="1" max="5">
            <label for="opinion">Opinion</label>
            <textarea name="opinion" placeholder="Escribe tu opinión"></textarea>
            <button type="submit">Enviar</button>
        </form>
        <?php
    } else {
        echo '<p class="o-register">Debes estar registrado para dejar tu opinión</p>';
    }
    ?>

    <?php
    $opiniones = obtenerOpiniones($conexion, $detalleProducto['ID_PRODUCTO']);
    foreach ($opiniones as $opinion) {
        echo '<div class="opinion">';
        echo '<p>' . $opinion['NOMBRE'] . '</p>';
        echo '<p>' . $opinion['COMENTARIO'] . '</p>';
        echo '<p>' . $opinion['VALORACION'] . ' estrellas</p>';
        echo '</div>';
    }
    ?>
</div>

<?php
include '../vistas/footer.html';
?>