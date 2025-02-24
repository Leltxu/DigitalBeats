<!DOCTYPE html>
<html lang="en">

<head>
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
            <a href="controladores/controler_forms.php"><i class="fa-solid fa-user"></i></a>
        </div>
    </header>



    <div class="overlay"></div>
    <aside class="menu">
        <div class="menu-header">
            <h3>Categorías</h3>
            <span class="close-btn">&times;</span>
        </div>
        <!-- Categorias Provisionales-->
        <ul>
            <li>
                Ordenadores
                <ul>
                    <li>Portátiles</li>
                    <li>Sobremesa</li>
                    <li>Accesorios</li>
                </ul>
            </li>
            <li>
                Componentes
                <ul>
                    <li>Procesadores</li>
                    <li>Tarjetas Gráficas</li>
                    <li>Placas Base</li>
                    <li>Memorias RAM</li>
                </ul>
            </li>
            <li>
                Sonido
                <ul>
                    <li>Auriculares</li>
                    <li>Altavoces</li>
                    <li>Micrófonos</li>
                    <li>Sistemas de Sonido</li>
                </ul>
            </li>
            <li>
                Periféricos
                <ul>
                    <li>Teclados</li>
                    <li>Ratones</li>
                    <li>Monitores</li>
                </ul>
            </li>
            <li>
                Almacenamiento
                <ul>
                    <li>Discos Duros</li>
                    <li>SSD</li>
                    <li>Pendrives</li>
                </ul>
            </li>
        </ul>
    </aside>
    <script src="js/menu.js"></script>