<?php
class Test{
    public $a;
}

$a=new Test;
$b=$a;
$a->a=12;
echo $b->a . PHP_EOL;     #12
$b->a=10;
echo $a->a . PHP_EOL;     #10