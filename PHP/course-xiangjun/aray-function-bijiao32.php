<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组的处理函数
in_array()判断元素是否在数组中
array_search()检索函数,返回匹配元素的索引值或键名(关联数组时),当数组中没有时返回布尔类型false
array_change_key_case()更改数组键名的大小写，默认是小写；第二个参数为CASE_UPPER时转换成大写,但原值不变
array_chunk()将数组进行拆分，第二个参数表示拆分后数组的元素个数，先满足前面的
array_combine()生成新的数组，第一个数组是键名，第二个数组是键值
array_diff()返回在其他数组不存在的键值，相当于取以第一个数组为全集后面的数组的补集
array_diff_key()返回在其他数组不存在的键名和对应的键值，相当于取以第一个数组为全集后面的数组的补集
arr_diff_assoc()同时比较键名和键值





echo "<pre>";
//操作索引数组
$arr1=array(1,2,3,4,5);
if (in_array('1',$arr1)){
	echo '在数组中，存在该值'."<br/>";
}
$arr2=array('后盾网','php视频','div视频');
$k=array_search('后盾网',$arr2);
echo $k."<br/>";
//操作关联数组
$arr2=array('key1'=>'后盾网','key2'=>'php视频','key3'=>'div视频');
$k=array_search('后盾网1',$arr2);
var_dump($k);


//更换键名大小写

$arr2=array('key1'=>'后盾网','key2'=>'php视频','key3'=>'div视频');
print_r(array_change_key_case($arr2));//默认是小写
print_r(array_change_key_case($arr2,CASE_UPPER));
print_r($arr2);//以上修改并不影响原数组


//拆分数组为多个数组
$arr3=array('key1'=>'后盾网','key2'=>'php视频','key3'=>'div视频','key4'=>'mysql课程','key5'=>'后盾网','key6'=>'php视频','key7'=>'div视频','key8'=>'mysql课程');
print_r(array_chunk($arr3,3));//3指拆分后数组中的元素个数,键名没有被保存，要保存键名需要添加第三个参数True
print_r(array_chunk($arr3,2,True));//保留了键名


//组合数组
$arrkey=array('key1','key2','key3','key4');//定义数组键名
$arrval=array('php视频','mysql课程','div视频','css课程');//定义数组键值
print_r(array_combine($arrkey,$arrval));

//表较两个数组的不同，以第一个数组为准，返回第一个数组中不同的值,不区分数组元素中的顺序，仅比较值
$arr4a=array('houdunwang.com','web.houdunwang.com','bbs.houdunwang.com');
$arr4b=array('sina.com.cn','bbs.houdunwang.com','web.houdunwang.com');
$arr4c=array('houdunwang.com');
print_r(array_diff($arr4a,$arr4b,$arr4c));//相当于取以第一个数组为全集后面的数组的补集
*/

//表较两个数组键名的不同，以第一个数组为准，返回第一个数组中不同的键名和对应的键值,不区分数组元素中的顺序
$arr5a=array('url'=>'bbs.houdunwang.com','name'=>'后盾网论坛');
$arr5b=array('weburl'=>'bbs.houdunwang.com','nsame'=>'后盾网论坛');
$arr5c=array('url'=>'bbs.houdunwang.com');
print_r(array_diff_key($arr5a,$arr5b,$arr5c));










 ?>