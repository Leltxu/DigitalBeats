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
            <form action="controladores/controler_producto.php?product=<?php echo $_GET['product']; ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $detalleProducto['ID_PRODUCTO']; ?>">
                <input type="number" name="cantidad" value="1" min="1" max="15">
                <button type="submit" name="cesta">Añadir al carrito</button>
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

<div id="opiniones" class="pr-opiniones">
    <h3>Opiniones</h3>
    <?php
    if (isset($_SESSION['NOMBRE'])) {
        ?>
        <form action="controladores/controler_producto.php?product=<?php echo $_GET['product']?>#opiniones" method="post">
            <input type="hidden" name="id" value="<?php echo $detalleProducto['ID_PRODUCTO']; ?>">
            <label for="estrellas">Valoracion (1-10) <span class="error"><?php if (isset($errores['estrellas'])) echo $errores['estrellas'] ?></span></label>
            <input type="number" name="estrellas" min="1" max="10" <?php if (isset($_POST['estrellas'])) echo 'value="' . $_POST['estrellas'] . '"' ?>>
            <label for="opinion">Opinion <span class="error"><?php if (isset($errores['comentario'])) echo $errores['comentario'] ?></span></label>
            <textarea name="comentario" placeholder="Escribe tu opinión"><?php if (isset($_POST['comentario'])) echo $_POST['comentario']?></textarea>
            <button type="submit" name="opinion">Enviar</button>
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
        echo '<p class="o-nombre">' . $opinion['NOMBRE'].' ';
        $valoracion = obtenerEstellas($conexion,$opinion['ID_OPINION'], $opinion['ID_PRODUCTO'], $opinion['ID_CLIENTE']);
        $valoracion = $valoracion['VALORACION'];
        $cont = 0;
        if ($valoracion > 0) {
            while ($cont < 5) {
                if ($valoracion > 1) {
                    echo "<span class='pr-estrella'><i class='fas fa-star'></i></span>";
                    $valoracion = $valoracion - 2;
                } else if ($valoracion == 1) {
                    echo "<span class='pr-estrella'><i class='fas fa-star-half-alt'></i></span>";
                    $valoracion--;
                } else {
                    echo "<span class='pr-estrella'><i class='far fa-star'></i></span>";
                }
                $cont++;
            }
        }
        echo '</p>';
        echo '<p class="o-coment">' . $opinion['COMENTARIO'] . '</p>';
        echo '</div>';
    }
    ?>
</div>

<?php
include '../vistas/footer.html';
?>