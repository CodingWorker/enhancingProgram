<?php
$dir=dir('f:');
while($f=readdir($dir->handle)){
    var_dump($f);
}

$dir->close();
var_dump('==============================');
$dir_res=opendir('f:');
while($f=readdir($dir_res)){
    var_dump($f);
}

closedir($dir_res);