<?php
$a='abc';
$b='def';
$c=<<<"eof"
this "is" a heredoc\tstruct
the 'first' variable $a , 
the second variable $b . 
eof;
echo $c;   //其中的$a和$b都被解析了,\t被解析了，‘没有被转义