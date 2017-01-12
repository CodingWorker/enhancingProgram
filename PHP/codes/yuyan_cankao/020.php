<?php
$a='apple';

echo "i have an $ab";   //PHP解析器解析变量$ab为空
echo 'i hava an $a';     //单引号内不解析
echo "i have an ${a} b";   //花括号限制了变量名的边界