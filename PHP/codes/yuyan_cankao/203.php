<?php
namespace a;
$a=new stdClass;   #这个类总是被解析为当前命名空间
$aa=new \stdClass; #这样才能使用到全局空间的标准类