<head>
    <link rel="stylesheet" href="../css/main.css">
</head>

<!-- 
    Parametros a pasar para que funcione correctamente
    $estrella -> Para la valoracion, hay que pasarle valores entr 0 y 10
    $tituloProducto -> Titulo del producto, que es, alguna caracteristica
    $precioActual -> Precio actual del rpoducto, puede ser que el descuento este ya aplicado
    $precioAntes -> El precio que valia antes o el precio sin descuanto aplicado
-->

<div class="tarjeta">
    <a href="#">
        <div class="imagen">
            <img src="img/productos/1636-intel-core-i5-12400f-44-ghz.webp" alt="Producto">
        </div>
        <div class="valoracion">
            <?php
                // Valoracion, habra que pasarle un numero entre el 0 y el 10
                // Cada punto sera media estrella
                
                $total=$estrella/2;
                $cont=0;
                while ($cont < 5) {
                    if ($estrella > 1) {
                        echo "<span class='estrella'><i class='fas fa-star'></i></span>";
                        $estrella=$estrella-2;
                    } else if ($estrella == 1) {
                        echo "<span class='estrella'><i class='fas fa-star-half-alt'></i></span>";
                        $estrella--;
                    } else {
                        echo "<span class='estrella'><i class='far fa-star'></i></span>";
                    }
                    $cont++;
                }
                echo "<p>(". $total .")</p>"
            ?>
            
        </div>
        <div class="texto">
            <!-- Hay que pasarle el titulo del producti (Que es) -->
            <p><?php echo $tituloProducto; ?></p>
            <div class="precio">
                <!-- Hay que pasarle el precio actual y el precio de lo que valia antes -->
                <p class="actual"><?php echo $precioActual; ?>€</p>
                <p class="antes"><?php echo $precioAntes; ?>€</p>
            </div>
        </div>
    </a>
</div>