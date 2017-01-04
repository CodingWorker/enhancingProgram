<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组的处理函数


//each()把数组中的键名和键值生成新的数组,指针操作，如果指针结束返回bool值false
$arr1=array('class1'=>'php课程','class2'=>'mysql课程','class3'=>'div课程','webname'=>'houdunwang.com');
$arr_new=each($arr1);
print_r($arr_new);

$arr_new=each($arr1);
print_r($arr_new);
$arr_new=each($arr1);
print_r($arr_new);
$arr_new=each($arr1);
print_r($arr_new);
$arr_new=each($arr1);
var_dump(($arr_new));

list()将数组的值赋给变量，只能操作索引数组，指针操作，如果指针结束返回bool值false
$arr1=array('class1'=>'php课程','class2'=>'mysql课程','class3'=>'div课程','webname'=>'houdunwang.com');
$arr2=array(1,2,3,4);
print_r(each($arr1));
list($values)=$arr2;
echo $values;
echo "<br/>-----------------<br/>";
while(list($k,$v)=each($arr1)){
	echo '键名:'.$k.'=>键值:'.$v."<br/>";
}

//array_map()数组地图,对一个或多个数组每一个元素的键值都应用回调函数，返回新的数组，注意回调函数的参数

array_map('func_map',$arr1);

$houdunwang=array(12,33,43,1,23,5,27);
function func_map($v){
	echo $v."<br/>";
}
$compare=array_map('Compare',$houdunwang);
function Compare($v){
    if ($v>33){
    	return $v;
    }
    return "";	
}
print_r($compare);




//array_walk(array, funcname)，array_walk()数组的漫游，将一个数组中的每一个元素都进行函数处理，处理成功返回true，否则返回 false,注意回调函数的参数,数组不能是多维数组
$arr3=array('money1'=>123,'money2'=>1223,'money3'=>323,'money4'=>523);
function func_walk(&$v,$k){
	if ($v<=1000) {
		$v+=500;
	}
}
if (array_walk($arr3,'func_walk')) {
	echo '加工资成功！'."<br/>";
}
print_r($arr3);
*/
//array_walk_recursive(input, funcname)操作二维数组里的数据
$arr5=array(
	array('cname'=>'语文','cscore'=>87),
	array('cname'=>'数学','cscore'=>97),
	array('cname'=>'英语','cscore'=>77),
	array('cname'=>'政治','cscore'=>57)
	);


array_walk_recursive($arr5, 'func5');
function func5(&$v,$k){
	if ($k=='cscore' && $v<60) {
		$v='不及格';
	}
}
print_r($arr5);

 ?>