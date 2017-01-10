<?php
$a='ab';
$b= &$a;
unset($a);     # ab还被$b引用
echo $b;