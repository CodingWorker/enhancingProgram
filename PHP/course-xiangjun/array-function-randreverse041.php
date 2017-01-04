<?php 
header("Content-type:text/html;charset=utf-8");
echo "<pre>";
/*数组处理函数
array_push()数组的入栈,改变原数组,在数组末端添加，返回新数组的元素个数
array_pop()出栈，返回删除的数组末端元素，对原数组改变
array_rand()随机取得数组元素，返回取得元素的索引组成的一个数组(索引数组)
array_reverse()反转数组,第二个参数为true时则原索引号不变，否则改变;当原数组是关联数组时则无影响



$arr=array('webname'=>'后盾网','weburl'=>'bbs.houdunwang.com');
array_push($arr,'www.houdunwang.com');
print_r($arr);
$arr1=array(1,2,3,4);
array_push($arr1,3);
print_r($arr1);

$arr2=array('后盾网','新浪网','taobao','souhu'=>'souhu','yahoo','dangdang','amazon');
print_r(array_rand($arr2,2));;//返回随机抽取的元素的索引或者键名
$quiz=array(
	array('name'=>'后盾网都开了哪些课程','type'=>'input'),
	array('name'=>'奥运会是哪年召开的','type'=>'radio','select'=>'1988,1992,1996,2000,2004'),
		array('name'=>'请写出一个遍历目录的函数','type'=>'texterea')
		
	);
$key=array_rand($quiz,1);//返回1个键名组成的数组
$keys=array_rand($quiz,2);//返回两个键名组成的数组
print_r($keys);
echo "<br/>-----随机循环出n道题-------</br>";
function timu($arr,$num){
	$i=1;
	if(!empty($arr)){
		$keys=array_rand($arr,$num);
		if(is_array($keys)){
			foreach ($keys as $k => $v) {	
		   	 	switch ($arr[$v]['type']) {
					case 'input':
						echo "$i.{$arr[$v]['name']}:<input type='text' name='dn'/>"."<br/>";
			    		break;
					case 'radio':
						echo "$i.{$arr[$v]['name']}:"."<br/>";
						$select=explode(',',$arr[$v]['select']);
						foreach ($select as $key=>$value) {
						echo "<input type='radio' name='year[]'/>".$value."<br/>";
						}
						break;	
					default:
						echo "$i.{$arr[$v]['name']}:<input type='texterea' name='perface[]'/>"."<br/>";
						break;
				}
			$i+=1;
			}
		}else{
			switch ($arr[$keys]['type']) {
				case 'input':
					echo "$i.{$arr[$keys]['name']}:<input type='text' name='dn'/>"."<br/>";
			    	break;
				case 'radio':
					echo "$i.{$arr[$keys]['name']}:"."<br/>";
					$select=explode(',',$arr[$keys]['select']);
					foreach ($select as $key=>$value) {
					echo "<input type='radio' name='year[]'/>".$value."<br/>";
					}
					break;	
				default:
					echo "$i.{$arr[$keys]['name']}:<input type='texterea' name='perface[]'/>"."<br/>";
					break;
			}
		}

	}
	echo "<input type='submit'value='提交答案'>"."<br/>";
}
timu($quiz,1);//随机选出1道题
timu($quiz,2);//随机选出2道题
timu($quiz,3);//随机选出3道题
*/
//数组反转函数
$arr=array('webname'=>'后盾网','weburl'=>'bbs.houdunwang.com');
$arr_r=array('a','b','c','d','e','f');
print_r($arr_r);
print_r(array_reverse($arr_r));//索引号改变
print_r(array_reverse($arr_r,true));//索引号不变
print_r($arr);//关联数组
print_r(array_reverse($arr));//关联数组不受影响
 ?>