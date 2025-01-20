<?php
include 'header.php';
?>

<div class="c-container">
    <!-- Sección de productos en la cesta -->
    <div class="c-productos">
        <h2>Cesta</h2>

        <!-- Producto 1 -->
        <div class="c-producto">
            <div class="foto">
                <img src="img/productos/1636-intel-core-i5-12400f-44-ghz.webp" alt="Imagen de Producto 1">
            </div>
            <div class="c-texto">
                <p>Producto 1</p>
                <label for="cantidad1">Cantidad</label>
                <select name="cantidad1" id="cantidad1">
                    <?php
                    for ($i = 1; $i <= 10; $i++) {
                        echo "<option value='$i'>$i</option>";
                    }
                    ?>
                </select>
                <p>$20.00</p>
            </div>
        </div>

        <!-- Producto 2 -->
        <div class="c-producto">
            <div class="foto">
                <img src="img/productos/1636-intel-core-i5-12400f-44-ghz.webp" alt="Imagen de Producto 2">
            </div>
            <div class="c-texto">
                <p>Producto 2</p>
                <label for="cantidad2">Cantidad</label>
                <select name="cantidad2" id="cantidad2">
                    <?php
                    for ($i = 1; $i <= 10; $i++) {
                        echo "<option value='$i'>$i</option>";
                    }
                    ?>
                </select>
                <p>$10.00</p>
            </div>
        </div>
    </div>

    <!-- Sección de totales y productos relacionados -->
    <div class="c-total-relacionados">
        <!-- Total -->
        <div class="c-total">
            <p>Subtotal (5 productos): $50.00</p>
            <input type="submit" value="Tramitar Pedido">
        </div>

        <!-- Productos Relacionados -->
        <div class="c-relacionados">
            <p>Productos Relacionados</p>
            <div class="c-scroll">


                <div class="c-producto-relacionado">
                    <div class="c-relacionado-img">
                        <img src="img/productos/1636-intel-core-i5-12400f-44-ghz.webp" alt="Imagen de Relación 1">
                    </div>
                    <div class="c-relacionado-texto">
                        <p>Relación 1</p>
                        <p>$18.00</p>
                    </div>
                </div>
                <div class="c-producto-relacionado">
                    <div class="c-relacionado-img">
                        <img src="img/productos/1636-intel-core-i5-12400f-44-ghz.webp" alt="Imagen de Relación 1">
                    </div>
                    <div class="c-relacionado-texto">
                        <p>Relación 1</p>
                        <p>$18.00</p>
                    </div>
                </div>
                <div class="c-producto-relacionado">
                    <div class="c-relacionado-img">
                        <img src="img/productos/1636-intel-core-i5-12400f-44-ghz.webp" alt="Imagen de Relación 1">
                    </div>
                    <div class="c-relacionado-texto">
                        <p>Relación 1</p>
                        <p>$18.00</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Productos similares -->
    <div class="similares">
        <p>Similares</p>
        <div class="producto-similar">
            <p>Producto Similar 1</p>
            <p>$15.00</p>
        </div>
        <div class="producto-similar">
            <p>Producto Similar 2</p>
            <p>$18.00</p>
        </div>
    </div>
</div>

<?php
include 'footer.html';
?>