<?php
$num='12';
var_dump(is_numeric(12));     #判断是否为数字类型或可转换为数字类型

$s=new stdclass;      #不区分大小写
$s->{"2"}=12;         #数字属性
var_dump($s->{"2"});  #访问数字属性