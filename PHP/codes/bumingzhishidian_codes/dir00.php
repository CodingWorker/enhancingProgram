<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 15:41
 */
//列出目录下的所有文件
$fs=[];
function scanFiles($dir){
    $d=dir($dir);
    if(is_null($d))
        exit('the directory is not correct');

    while($f=$d->read()){
        if($f=='.' || $f=='..')  continue;
        $f = $dir . '/'.$f;
        if(is_dir($f)) {
            scanFiles($f);
            continue;
        }
        var_dump($f);
    }

}

$dir = 'E:/deleting/enhancingProgram/MYSQL';
scanFiles($dir);
var_dump(is_dir("E:/deleting/enhancingProgram/MYSQL/.idea"));