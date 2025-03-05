<?php

include "../functions.php";

if (isset($_SESSION['NOMBRE'])) {
    header('Location: ../index.php');
    exit();
}

include __DIR__ . "/../vistas/micuenta.php";

