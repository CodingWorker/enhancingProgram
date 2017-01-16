<?php
namespace mypro;
class a{

}

$a=new \stdClass;    #前反斜杠表示使用的全局命名空间

function strlen(){      //将strlen方法重新定义了
    var_dump("mypro\strlen");
}

var_dump(strlen());

var_dump(\strlen("afadfaf"));     //完全限定名称访问的仍然是全局的strlen方法