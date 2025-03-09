<?php 
    $titulo = "Mis Opiniones";
    include 'header.php';
?>


<div>
    <h2>Mis Opiniones</h2>
    

    <?php 

        $id=$_SESSION['ID_CLIENTE'];
        $opiniones = Opiniones($conexion, $id);
        
        foreach ($opiniones as $opinion) {
            echo "<div class='opinion'>";
                echo "<h3>Producto: ".$opinion['NOMBRE']."</h3>";
                
                // Valoracion, habra que pasarle un numero entre el 0 y el 10
                // Cada punto sera media estrella
                
                echo "<div class='valoracion'>";
                $estrella = $opinion['VALORACION'];
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
                }
                echo "</div>";
                echo "<p>Comentario: ".$opinion['COMENTARIO']."</p>";
                echo "<p>Fecha: ".$opinion['FECHA_HORA']."</p>";
            echo "</div><br>";
        }
    
    
    
    ?>

</div>