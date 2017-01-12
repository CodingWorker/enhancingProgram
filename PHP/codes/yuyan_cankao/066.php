<?php
$a='hello';
$$a='world';
echo "$a $hello";      //这时两个变量都被定义了
$a='change';
echo $hello;