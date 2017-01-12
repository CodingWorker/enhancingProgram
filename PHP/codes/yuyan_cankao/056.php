<?php
$str='start up : igbinary';
$strNew=b'start up : igbinary';    #这样也可以在开始时转换为binary
$b_str= (binary)$str;
echo gettype($b_str);         #输出string
