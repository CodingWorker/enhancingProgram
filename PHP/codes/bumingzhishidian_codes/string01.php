<?php
$str='https://www.baidu.com/';
var_dump(addslashes($str));
var_dump(addcslashes($str,'/\\cswb'));
var_dump(strlen('中文'));
var_dump(bin2hex($str));
var_dump(bin2hex('www'));
