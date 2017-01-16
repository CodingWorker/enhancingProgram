<?php
namespace mypro\sub_pro\name192;
const FOO='name192_12';
class a{}
define("FOO","12");
var_dump(FOO);           #这会现寻找当前命名空间的常量，没有找到则寻找全局同名常量
echo constant("FOO");    #这样获取常量值的方式必须带有命名空间，否则被认为是全局

