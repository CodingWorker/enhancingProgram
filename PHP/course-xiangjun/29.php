<?php
/*数组：在一个变量中存储一个或者多个值，每个元素都有一个访问的id，






//索引数组
$arr=array('李海','PHP视频课程','29','1982-05-08');
echo "<pre>";
//print_r($arr);
echo "学员名是：".$arr[0]."\n所学的课程：".$arr[1]."\n学院年龄：".$arr[2]."\n出生日期：".$arr[3];
//关联数组
$arr1=array('uname'=>'江梅','uclass'=>'DIV+CSS','age'=>'44','birth'=>'1982-05-08');
//print_r($arr1);
echo $arr1['age'];
//数组的嵌套
$arr2=array(array('uname'=>'李曼','uclass'=>'DIV+CSS+JSP','age'=>'44'),array('uname'=>'李磊','uclass'=>'PHP+JSP','age'=>'32'));
//print_r($arr2);
//操作多维数组
echo $arr2[0]['age'];
echo "<br/>";
$arr3[0]='后盾网';
$arr3[1]='php免费视频教程';
//print_r($arr3);
//定义数组方法四
$arr4[]='HTML课程';
$arr4[]='div+css课程';
$arr4[]='jsp课程';
//print_r($arr4);
*/
$arr5['PHP']=array();
$arr5['PHP']['cname']="PHP基础知识";
$arr5['PHP']['ctime']="300小时";
//$arr5['PHP'][]="图像处理";
//$arr5['PHP'][]="数据库操作";
//$arr5['PHP'][]="多案例实战开发";
$arr5['DIV']=array();
$arr5['DIV']['cname']='HTML基础知识';
$arr5['DIV']['ctime']='100课时';
//$arr5['DIV'][]='hack技术';
//$arr5['DIV'][]='整站标准布局实战';
//print_r($arr5);
/*
foreach($arr3 as $value){
    echo "<span style='color:red;border:1px solid blue;display:block'>".$value."</span>";
}
$arr6['网站']='后盾网';
$arr6['课程']='php免费视频教程';
$arr6['课时']='300';
echo "<br/>";
foreach($arr6 as $key=>$value){
	if($key=='课程'){
    echo $key."<span style='color:red;width:200px;padding:2px'>".$value."</span>";
	}else{
	echo $key.$value;
	}
//echo $key;
}
*/
$arr5['HTML']="HTML基础知识";
$arr5['JSP']="JSP基础知识";
foreach($arr5 as $key=>$value){
    if(is_array($value)){
		echo "<div>";
	    echo $key.":<br/>";
		foreach($value as $k=>$v){
			echo "&nbsp;&nbsp;&nbsp;&nbsp;".$k."=>".$v;
		}
		echo "</div>";
	}else{
	    echo $key."=>".$value."<br/>";}
}














?>