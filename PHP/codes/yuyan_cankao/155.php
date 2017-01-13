<?php
class A{

}

function a(A $a=null){
    var_dump($a);
}
$var=12;
$var=new A;
a($var);


