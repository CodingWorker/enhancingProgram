<?php
namespace test;
class a{

}

define("ACONST","CONST VARIABLE");      #这样定义的常量是属于全局的
const ACONST=12;                        #这样定义的常量是属于命名空间的，这样就定义了本命名空间的常量
if(defined("ACONST")){
    var_dump(ACONST);
    $n='\ACONST';
    echo constant($n);

}else{
    var_dump("not defined");
}