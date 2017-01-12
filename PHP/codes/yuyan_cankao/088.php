<?php
class Test1{

}

class Test2 extends Test1{

}

$t=new Test2;
var_dump($t instanceof Test1);     #输出true
var_dump($t instanceof Test2);     #输出true