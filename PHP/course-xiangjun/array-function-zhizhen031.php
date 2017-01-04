<?php 
header("Content-type:text/html;charset=utf-8");

 
 
 

/*
 //count 统计数组中元素的个数
 $arr=array("houdunwang.com","后盾网php视频",array("php课程","CSS课程","THINKPAD课程"));
 echo count($arr);//输出3
 echo "<br/>---------------------------<br/>";
 echo count($arr,1);//输出6

// reset 把数组内部指针移动到数组的第一个元素并返回第一个元素
 echo "<pre>";
 $arr2=array("houdunwang.com","后盾网php视频",array("php课程","CSS课程","THINKPAD课程"));
var_dump(each($arr2));//获得数组第一个值的指针
 echo "<br/>---------------------------<br/>";
 print_r(each($arr2));//获得数组第二个值的指针
 echo "<br/>---------------------------<br/>";
 print_r(each($arr2));//获得数组第三个值得指针
 echo "<br/>---------------------------<br/>";
var_dump(each($arr2));//数组没有第四个元素，不能获得指针
 reset($arr2);//重置指针的顺序，使得指针指向数组的头部
 echo reset($arr2);
 echo "<br/>---------------------------<br/>";
 print_r(each($arr2));//获得数组第一个元素的指针


// current()返回当前指针指向的内容,如果当前元素为0或空值返回false
// end 把数组内部指针移动到数组的最后个元素并返回最后一个元素
 // prev 把数组内部指针移动到上一个数组元素，并返回该指针，如果到结尾返回false
 // next 把数组内部指针移动到下一个数组元素，并返回该指针，如果到结尾返回false
echo "<pre>";
$arr3=array("houdunwang.com",0,array("php课程","CSS课程","THINKPAD课程"));
// current()返回当前指针指向的内容,如果当前元素为0或空值返回false
echo current($arr3);
print_r(each($arr3));
var_dump(current($arr3));
// end 把数组内部指针移动到数组的最后个元素并返回最后一个元素
print_r(end($arr3));//最后一个元素是数组，所以输出用print_r
print_r(each($arr3));
var_dump(current($arr3));
echo reset($arr3);
print_r(each($arr3));
// prev 把数组内部指针移动到上一个数组元素，并返回该指针，如果到结尾返回false
echo prev($arr3)."----prev<br/>";
echo "<br/>--------------------------<br/>";
print_r(next($arr3));
echo "<br/>--------------------------<br/>";
print_r(each($arr3));



//遍历数组
$arr4=array("houdunwang.com","后盾网php视频","php课程","CSS课程","THINKPAD课程");
while(list($k,$v)=each($arr4)){
   echo $k."&nbsp;&nbsp;".$v."<br/>";
}



//定义一个关联数组，进行遍历
$arr5=array("weburl"=>"houdunwang.com","cname"=>"后盾网视频教程");
while(list($a,$b)=each($arr5)){
    echo $a."&nbsp;&nbsp;".$b."<br/>";

}
*/
$arr5=array("weburl"=>"houdunwang.com","cname"=>"后盾网视频教程");
echo key($arr5)."<br/>";
next($arr5);
echo key($arr5)."<br/>";




?>
