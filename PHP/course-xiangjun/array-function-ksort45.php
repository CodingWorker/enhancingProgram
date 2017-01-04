<?php
header("Content-type:text/html;charset=utf-8"); 
echo '<pre>';
/*数组处理函数
asort()对数组进行排序，保留键名
ksort()依据键名进行排序，保留键名
以上两个参数都可以添加第二个参数
rsort()反向进行排序，舍弃原键名或索引，新生成从0开始的索引
arsort()反向进行排序，保留键名
krsort()依据键名进行反向排序，保留键名
以上所有排序函数成功返回真，失败返回假


$arr=array('bbs_url'=>'bbs.houdunwang.com','web_url'=>'www.houdunwang.com','bbs_name'=>'后盾网论坛','web_name'=>'后盾网免费视频教程');
sort($arr);//舍弃原键名或索引值，新生成从0开始的索引
print_r($arr);
$arr1=array('bbs_url'=>'bbs.houdunwang.com','web_url'=>'www.houdunwang.com','bbs_name'=>'后盾网论坛','web_name'=>'后盾网免费视频教程');
asort($arr1);//保留键名
print_r($arr1);
*/
$arr2=array('bbs_url'=>'bbs.houdunwang.com','web_url'=>'www.houdunwang.com','bbs_name'=>'后盾网论坛','web_name'=>'后盾网免费视频教程');
ksort($arr2);//按照键名进行排序
print_r($arr2);
$arr3=array('bbs_url'=>'bbs.houdunwang.com','web_url'=>'www.houdunwang.com','bbs_name'=>'后盾网论坛','web_name'=>'后盾网免费视频教程');
rsort($arr3);//反响排序，不保留键名
print_r($arr3);

$arr4=array('bbs_url'=>'bbs.houdunwang.com','web_url'=>'www.houdunwang.com','bbs_name'=>'后盾网论坛','web_name'=>'后盾网免费视频教程');
arsort($arr4);//保留键名
print_r($arr4);
$arr5=array('bbs_url'=>'bbs.houdunwang.com','web_url'=>'www.houdunwang.com','bbs_name'=>'后盾网论坛','web_name'=>'后盾网免费视频教程');
krsort($arr5);//依据键名反向排序
print_r($arr5);






 ?>