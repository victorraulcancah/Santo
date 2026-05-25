<?php
$file = '20260525 1518.sql';
$content = file_get_contents($file);

// Primero reemplazamos todo a ASCII usando transliteración
// PÀUCAR -> PAUCAR, BONGARÁ -> BONGARA
setlocale(LC_ALL, 'en_US.UTF8');
$content = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $content);

// Eliminar bytes nulos
$content = str_replace("\0", "", $content);

// Recortar los espacios en blanco innecesarios dentro de las comillas simples
// y también tener cuidado con las comillas escapadas \'
$content = preg_replace_callback("/'((?:[^'\\\\]|\\\\.)*)'/", function($m) {
    return "'" . trim($m[1]) . "'";
}, $content);

file_put_contents('20260525_1518_clean.sql', $content);
echo "Limpieza completada. Creado archivo 20260525_1518_clean.sql";
