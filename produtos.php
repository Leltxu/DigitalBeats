<?php
$titulo = "Productos";
include "header.php";
include "../functions.php"
    ?>
<div class="pro-contenedor">
    <div class="filtros">
        <h2>Filtros</h2>

        <!-- Filtro de Ordenar -->
        <div class="filtro">
            <label for="ordenar">Ordenar por</label>
            <select id="ordenar" name="ordenar">
                <option value="precio_asc">Precio: Ascendente</option>
                <option value="precio_desc">Precio: Descendente</option>
                <option value="relevancia">Relevancia</option>
                <option value="nuevos">Nuevos</option>
            </select>
        </div>

        <!-- Filtro de Precio -->
        <div class="filtro">
            <p>Precio</p>
            <label for="precio-bajo">Bajo</label>
            <input type="checkbox" id="precio-bajo" name="precio" value="bajo">
            <label for="precio-alto">Alto</label>
            <input type="checkbox" id="precio-alto" name="precio" value="alto">
        </div>

        <!-- Filtro de Marcas -->
        <div class="filtro">
            <p>Marcas</p>
            <label for="marca1">Marca 1</label>
            <input type="checkbox" id="marca1" name="marca" value="marca1">
            <label for="marca2">Marca 2</label>
            <input type="checkbox" id="marca2" name="marca" value="marca2">
            <label for="marca3">Marca 3</label>
            <input type="checkbox" id="marca3" name="marca" value="marca3">
        </div>

        <!-- Filtro de Conectividad -->
        <div class="filtro">
            <p>Conectividad</p>
            <label for="bluetooth">Bluetooth</label>
            <input type="checkbox" id="bluetooth" name="conectividad" value="bluetooth">
            <label for="wifi">Wi-Fi</label>
            <input type="checkbox" id="wifi" name="conectividad" value="wifi">
            <label for="usb">USB</label>
            <input type="checkbox" id="usb" name="conectividad" value="usb">
        </div>

        <!-- Filtro de Color -->
        <div class="filtro">
            <p>Color</p>
            <label for="rojo">Rojo</label>
            <input type="checkbox" id="rojo" name="color" value="rojo">
            <label for="azul">Azul</label>
            <input type="checkbox" id="azul" name="color" value="azul">
            <label for="verde">Verde</label>
            <input type="checkbox" id="verde" name="color" value="verde">
        </div>
    </div>
    <div class="cont-productos">
        <h3>+345 resultados para "Productos"</h3>
        <div class="tarjetas">
            <?php
            $titulo = "Intel coro I5 11560 4.6GHz, 8 nucleos 16 hilos";
            $precio = rand(150, 250);
            $precioAntes = rand(251, 350);
            $estrellas = rand(0, 10);
            mostrarTarjetas(50, $titulo, $precio, $precioAntes, $estrellas);
            ?>
        </div>
    </div>

</div>

<?php
include "footer.html";
?>