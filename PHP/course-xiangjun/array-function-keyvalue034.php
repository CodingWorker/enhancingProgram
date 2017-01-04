<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数

//array_fill(开始索引下标，元素个数，元素内容)通过指定的索引顺序及个数生成数组
$arr0=array_fill(30,2,'后盾网');
print_r($arr0);//生成两个元素值都为后盾网


//array_filter()数组过滤函数，通过回调函数的方式返回新数组，如果回掉函数返回True,数组元素返回到新数组中
$arr1=array('class1'=>'PHP课程','class2'=>'mysql课程','webname'=>'后盾网','weburl'=>'houdunwang.com');
$arr0=array_filter($arr1,'a');//函数名用引号括起来
function a($v){
    if(strpos($v,'课程')){
    	return true;
    }else{
    	return false;
    }
}
print_r($arr0);


//判断非法信息
echo "<pre>";
$user1=array('username'=>'李海枪支','msg'=>'购买联系xxx，很高兴见到大家');
if (array_filter($user1,'a')){
	echo '包含非法信息';
}else{
	echo '消息合法';
}
function a($v){
	if (strpos($v,'枪支')){
		return true;
	}
}

//array_flip()把数组中的键值和键名进行交换,原键值相同的项转换完后最后一个有效
$user1=array('class1'=>'PHP课程','class2'=>'mysql课程','webname'=>'mysql课程','weburl'=>'houdunwang.com');
$arr0=array_flip($user1);
print_r($arr0);

//后来的替换之前的
$arr2=array('class1'=>'php','class2'=>'php1','class3'=>'mysql');
print_r(array_flip($arr2));//class1被替换
*/

//array_key_exists()判断内容是否是数组的键名
$arr2=array('class1'=>'php','class2'=>'php1','class3'=>'mysql');
if (array_key_exists('class1',$arr2)){
	echo "存在该键值";
}else{
	echo "不存在";
}
//array_keys()返回数组中所有的键名
print_r(array_keys($arr2));//所有键名
print_r(array_keys($arr2,'php'));//查找键值内容为php的键名
$arr3=array('class1'=>'1','class2'=>1,'class3'=>'mysql');
print_r(array_keys($arr3,'1',false));//查找键值内容为php的键名,false对数据类型不进行严格的匹配














 ?>