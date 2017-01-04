<?php 
/*
php中保存的都是时间戳，要通过date函数将其转换成标准的时间
date_default_timezone_set(timezone_identifier)设置时区
filectime(filename)获得文件修改（管理者拥有着或拥有组)的时间戳
filemtime(filename)获得文件内容的修改时间戳
fileatime(filename)获得文件的访问时间
touch(filename)将文件的修改和访问时间更改为指定的时间
clearstatcache();//清除缓存
*/
/*
date_default_timezone_set('PRC');
echo date('Y-m-d h:i:s',filectime('a.txt'))."<br/>";
touch('a.txt',mktime(8,55,33,2,23,2016));//强制指定文件修改和访问的时间
echo date('Y-m-d h:i:s',filemtime('a.txt'))."<br/>";
file('a.txt');
echo date('Y-m-d h:i:s',fileatime('a.txt'))."</br/>";//没有变化是因为文件访问服务是时间加载没有开启
touch('a.txt',mktime(8,55,33,2,23,2016));
*/
echo date("h:i:s",filemtime('a.txt')).'<br>';
sleep(13);
clearstatcache();//清除缓存
file_put_contents('aa.txt','www.houdunwang.com');
echo date("h:i:s",filemtime('a.txt'));//一样是因为没有开启文件修改记录时间服务











 ?>