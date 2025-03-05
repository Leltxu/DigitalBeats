<?php
include 'conexion.php';
include "modelos/modelo_user.php";
include "functions.php";

print_r(obetenerUser($conexion, 'gmaild@gmail.com'));