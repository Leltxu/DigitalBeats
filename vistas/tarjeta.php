<?php
    if (!isset($conexion)) {
        include '../conexion.php';
    }
?>

<head>
    <link rel="stylesheet" href="../css/main.css">
</head>

<div class="tarjeta">
    <a href="controladores/controler_producto.php?product=<?php echo $producto['ID_PRODUCTO']; ?>">
        <div class="imagen">
            <img src="<?php echo $foto; ?>" alt="<?php echo $tituloProducto; ?>">
        </div>
        <div class="valoracion">
            <?php
            // Valoracion, habra que pasarle un numero entre el 0 y el 10
            // Cada punto sera media estrella
            $estrella = estrellas($conexion, $producto['ID_PRODUCTO']);
            $estrella = $estrella['estrellas'];
            $total = number_format($estrella/2,1);
            $cont = 0;
            if ($estrella > 0) {
                while ($cont < 5) {
                    if ($estrella > 1) {
                        echo "<span class='estrella'><i class='fas fa-star'></i></span>";
                        $estrella = $estrella - 2;
                    } else if ($estrella == 1) {
                        echo "<span class='estrella'><i class='fas fa-star-half-alt'></i></span>";
                        $estrella--;
                    } else {
                        echo "<span class='estrella'><i class='far fa-star'></i></span>";
                    }
                    $cont++;
                }
                echo "<p>(" . $total . ")</p>";
            }
            ?>

        </div>
        <div class="texto">
            <!-- Hay que pasarle el titulo del producto -->
            <p><?php echo $tituloProducto; ?></p>
            <div class="precio">
                <!-- Hay que pasarle el precio actual y el precio de lo que valia antes 
                     Si no tiene oferta no se mostrara el precio de antes -->
                <p class="actual"><?php echo $precioActual; ?>€</p>
                <?php
                if ($precioAntes > 0) {
                    echo "<p class='antes'>" . $precioAntes . "€</p>";
                }
                ?>
            </div>
        </div>
    </a>
</div>