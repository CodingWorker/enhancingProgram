<?php
// const cc=12;
var_dump(defined(cc));   //返回false

define("cc",12);
var_dump(defined(cc));    //返回false
var_dump(cc);      //常量不用使用$
$a='aa';
// var_dump(get_defined_constants());      //获取所有常量





