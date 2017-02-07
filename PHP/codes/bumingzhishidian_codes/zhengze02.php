<?php
$str=<<<eof
.c-border .c-span5{width:100px}
.c-border .c-span6{width:122px}
eof;

$pattern="/width/m";
var_dump(preg_filter($pattern,".......",$str));
var_dump($str);
var_dump(preg_replace($pattern,"...",$str));
var_dump($str);

var_dump(preg_last_error());