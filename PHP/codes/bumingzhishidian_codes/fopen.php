<?php
/**
 * Created by PhpStorm.
 * User: DaiYan
 * Date: 2017/6/19
 * Time: 16:20
 */

$f=fopen("http://www.baidu.com",'rb');
while($line=fgets($f)):
    var_dump($line);
endwhile;
fclose($f);