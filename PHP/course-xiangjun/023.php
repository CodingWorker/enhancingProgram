<?php
/*字符串处理函数
    php处理字符串中的空格  
	    trim 对字符串左右字符串删除
		ltrim对字符串左边的空格删除
		rtrim对字符串右边的空格删除
	php处理字符串的大小写
	    strtolower 字符串转换成小写
		strtoupper 字符串转换成大写
		ucfirst 首字母大学
		ucwords 单词首字母大写
	字符串填充函数
	    str_pad("要填充的字符串",填充之后新字符串的长度，填充的内容，填充的方向)
		填充方向：STR_PAD_BOTH 左右填充，如果填充为奇数，右侧多填
		          STR_PAD_LEFT 左侧填充
				  STR_PAD_RIGHT 右侧填充
	字符串反转函数 strrev
    字符串加密 md5();
	格式化金额字符串函数 number_format(字符串，小数位数，小数点，千位分隔符);
    字符串拆分成数组
	    explode(要在哪个字符拆分，拆分的字符串，返回数组元素的数目);
	把数组元素组合成字符串
	    implode(连接字符串，数组);
		





$houdunwang="      bbs.houdunwang.com    ";
echo strlen($houdunwang);
echo "<br/>----------------------<br/>";
echo strlen(trim($houdunwang));
echo $houdunwang;

$hdw="http://www.houdunwang.com bbs.houdunwang.com sina cool";
echo strtoupper($hdw);
echo "<br/>-----------------<br/>";
echo ucfirst($hdw);
echo "<br/>-----------------<br/>";
echo ucwords($hdw);

$url="bbs.houdunwang.com";
echo $url;
echo "<br/>------------------<br/>";
echo str_pad($url,5,"+");//新字符串的长度比原字符串的长度小时，不填充
echo "<br/>------------------<br/>";
echo str_pad($url,35,"+",STR_PAD_BOTH);//两侧填充

//字符串反转函数
$hdw="bbs.houdunwang.com";
echo strrev($hdw);

//md5()加密
//$pwd="houdunwang";
if (md5($_GET['pwd'])=="bf320fa3295cf4770c58db4db5a8ef04"){
   echo "密码正确";
}else{


?>
<form acton="" method="get">
    用户名:<input type="text" name="uname" /><br/>
	密  码:<input type="password" name="pwd" /><br/>
	<input type="submit" value="提交">
</form>
<?php
}
?>

//格式化金额
$number=1222313123;
echo number_format($number,3,'+','*');

//拆分字符串
$str1="后盾王论坛，免费分享高清视频，网址是：bbs.houdunwang.com";
$arr1=explode("，",$str1);
$arr2=explode("，",$str1,2);
print_r($arr1);
echo "<br/>--------------------<br/>";
print_r($arr2)
*/
//将数组组合成字符串
$arr=array("后盾网","新浪网","百度网");
echo implode('+',$arr);















