<?php
interface Test1{

}

class Test2 implements Test1{

}

$t=new Test2;
var_dump($t instanceof Test1);      #输出true