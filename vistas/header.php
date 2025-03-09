<?php
    if (!isset($conexion)) {
        require __DIR__ . '/../conexion.php';
    }
    include_once __DIR__ . '/../modelos/model_productos.php';

    include_once __DIR__ . '/../modelos/model_categorias.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="/digitalbeats/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/main.css">
    <script src="https://kit.fontawesome.com/dacbd6cb00.js" crossorigin="anonymous"></script>
    <title><?php echo $titulo; ?></title>
</head>

<body>

    <header>
        <div class="izq">
            <a href="index.php"><img src="assets/img/logo.png" alt="logo"></a>
            <a href="#" class="btn_cat" id="openMenuBtn">
                <i class="fa-solid fa-bars"></i>
                <span class="categoria">Todas las categorías</span>
            </a>
        </div>
        <div class="centro">
            <div class="search-container">
                <form action="index.php" method="get">
                    <input type="text" name="product" placeholder="Buscar">
                    <button type="submit"><i class="fa-solid fa-search"></i></button>
                </form>
            </div>
        </div>
        <div class="der">
            <a href="index.php?page=cesta"><i class="fa-solid fa-cart-shopping"></i></a>
            <?php
            if (isset($_SESSION['NOMBRE'])) {
                echo '<a href="controladores/controler_cuenta.php" class="hover"><i class="fa-solid fa-user"></i>Hola ' . $_SESSION['NOMBRE'] . '</a>';
            } else {
                echo '<a href="controladores/controler_forms.php"><i class="fa-solid fa-user"></i></a>';
            }
            ?>
            <div class="despegable">
                <a href="controladores/controler_cuenta.php">Mi cuenta</a>
                <a href="index.php?page=close">Cerrar Sesión</a>
            </div>
        </div>
    </header>

    <div class="overlay"></div>
    <aside class="menu">
        <div class="menu-header">
            <h3>Categorías</h3>
            <span class="close-btn">&times;</span>
        </div>
        <!-- Categorias Dinámicas -->
         
        <ul>
            <?php

            $categorias = categorias($conexion);
            
            foreach ($categorias as $categoria) {
                echo '<li><a href="index.php?categoria=' . $categoria['ID_CATEGORIA'] . '">' . $categoria['NOMBRE'] . '</a>';
                if (!empty($categoria['hijos'])) {
                    echo '<ul>';
                    foreach ($categoria['hijos'] as $subcategoria) {
                        echo '<li><a href="index.php?categoria=' . $subcategoria['ID_CATEGORIA'] . '">' . $subcategoria['NOMBRE'] . '</a></li>';
                    }
                    echo '</ul>';
                }
                echo '</li>';
            }
            ?>
        </ul>
    </aside>
    <script src="js/menu.js"></script>
</body>
</html>