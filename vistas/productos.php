<?php
$titulo = "Productos";
include "header.php";

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

        <!-- Filtro de Marcas -->
        <div class="filtro">
            <p>Marcas</p>
            
            <input type="checkbox" id="marca1" name="marca" value="marca1">
            <label for="marca1">Marca 1</label><br>
            
            <input type="checkbox" id="marca2" name="marca" value="marca2">
            <label for="marca2">Marca 2</label><br>
            
            <input type="checkbox" id="marca3" name="marca" value="marca3">
            <label for="marca3">Marca 3</label><br>
        </div>

        <!-- Filtro de Conectividad -->
        <div class="filtro">
            <p>Conectividad</p>
            
            <input type="checkbox" id="bluetooth" name="conectividad" value="bluetooth">
            <label for="bluetooth">Bluetooth</label> <br>
            
            <input type="checkbox" id="wifi" name="conectividad" value="wifi">
            <label for="wifi">Wi-Fi</label><br>
            
            <input type="checkbox" id="usb" name="conectividad" value="usb">
            <label for="usb">USB</label><br>
        </div>

        <!-- Filtro de Color -->
        <div class="filtro">
            <p>Color</p>
            
            <input type="checkbox" id="rojo" name="color" value="rojo">
            <label for="rojo">Rojo</label><br>
            
            <input type="checkbox" id="azul" name="color" value="azul">
            <label for="azul">Azul</label><br>
            
            <input type="checkbox" id="verde" name="color" value="verde">
            <label for="verde">Verde</label><br>
        </div>
    </div>
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