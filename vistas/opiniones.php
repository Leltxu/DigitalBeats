<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/forms.css">
    <title>Opiniones</title>
</head>
<body> 
    <form action="">
        <img src="../img/logo.png" alt="" class="logo"><h3>Opiniones</h3>
        <label for="producto">Producto</label>
        <input type="text" name="producto" id="producto"><br>

        <label for="valoracion">Valoracion</label>
        <select name="valoracion" id="valoracion">
        <?php 
            for ($i=1; $i <= 5 ; $i++) { 
                echo "<option value=$i>$i</option>";
            }
        ?>
        </select>

        <label for="comentario">Comentario</label>
        <textarea name="comentario" id="comentario"></textarea>


        <label for="recomendar">Lo recomendarias?</label>
        <input type="radio" name="recomendar" value="si" checked="checked"/>Si
        <input type="radio" name="recomendar" value="no" checked="checked"/>No<br><br>

            <input type="submit" name="enviar" value="Enviar">
       
        
        
    </form>
</body>
</html>