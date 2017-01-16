<?php
namespace a;
class test{

}

namespace b;
use \a\test;   //将命名空间a的类test导入进来了
$t=new test;   //实例化了a的test
var_dump($t);