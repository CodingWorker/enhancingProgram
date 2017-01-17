<?php
var_dump($GLOBALS);    //$GLOBALS超全局变量包含所有的预定义变量和全局变量
$a=12;
var_dump($GLOBALS['a']);     //输出12