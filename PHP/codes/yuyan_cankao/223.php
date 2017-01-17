<?php
$str=($HTTP_RAW_POST_DATA);
file_put_contents('2.txt',$str);
echo 'ok';