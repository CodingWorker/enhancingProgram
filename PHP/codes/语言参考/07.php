<?php
//$str='addaa';     #强制转换为0
$str='12';
if(settype($str,'integer')){
    var_dump($str);
}else{
    echo '强制转换失败';
}
