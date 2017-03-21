<?php
$str="设计模式（九）外观模式Facade（结构型）";

$uuencode=convert_uuencode($str);
var_dump($uuencode);

var_dump(convert_uudecode($uuencode));

$str="设计模式（九）外观模式Facade（结构型）";
var_dump(count_chars($str));

var_dump(crc32($str));