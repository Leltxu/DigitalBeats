<?php

if (!isset($_GET['page']) && !isset($_GET['product'])) {
    include "home.php";
} 

if (isset($_GET['page'])) {
    if ($_GET['page'] == 'contacto') {
        include "contacto.html";
    } else if ($_GET['page'] == 'login') {
        include "login.php";
    } else if ($_GET['page'] == 'cesta') {
        include "cesta.php";
    } else if ($_GET['page'] == 'register') {
        include "registrarse.php";
    } else if ($_GET['page'] == 'cesta') {
        include "cesta.php";
    }
}

if (isset($_GET['product'])) {
    $producto = $_GET['product'];
    include "productos.php";
}