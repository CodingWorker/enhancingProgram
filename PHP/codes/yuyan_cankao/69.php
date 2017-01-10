<?php
namespace ab;
var_dump(__FILE__);      //输出：E:\deleting\enhancingProgram\PHP\codes\yuyan_cankao\69.php
var_dump(__DIR__);       //输出：E:\deleting\enhancingProgram\PHP\codes\yuyan_cankao
function cc(){
    echo __FUNCTION__;
}

cc();   //输出cc
class ab{
    function __construct(){
        echo __CLASS__;     //输出ab
        echo __METHOD__;    //输出 ab::construct
    }
}

new ab;
echo __NAMESPACE__;      //输出ab
var_dump(function_exists(cc));
