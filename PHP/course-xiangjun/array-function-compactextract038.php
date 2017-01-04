<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*


in_array()判断元素是否在数组中，比较的是值，存在返回真，否则返回假；第三个参数为true则为严格判断


//compact()将多个变量转换为数组，变量名为键名，变量值为键值

$webname='后盾网';
$weburl='houdunwang.com';
$hdcms='cms.houdunwang.com';
$arr=compact('webname','weburl','hdcms');//函数寻找变量名并将名和值变为数组
print_r($arr);
$hdw_var=array('webname','weburl','hdcms');
$hdw=compact($hdw_var);//函数寻找数组中的变量名的值并将两者结合成数组
print_r($hdw);
*/
//extract()将数组转换为变量，键名为变量名，键值为变量值，需要根据参数做更多的转换功能
$hdw=array('weburl'=>'bbs.houdunwang.com','webname'=>'后盾网','hdcms'=>'cms.houdunwang.com','后盾网论坛');
echo $hdw[0]."<br/>";//返回索引为0的元素
echo extract($hdw)."<br/>";//不加参数时，索引元素不能转换为变量
echo $webname;
print_r($hdw);//原数组并未改变
extract($hdw,EXTR_PREFIX_ALL,'h');//为每个变量名加了前缀h_,使得最后一个索引元素也能够转换为变量
echo $h_0."<br/>";
echo $h_webname;
echo in_array('后盾网',$hdw);









 ?>