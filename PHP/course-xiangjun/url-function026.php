<?php
/*字符串处理函数
    
	urlencode url编码,处理非英文的字符以便接受
	urldecode 解码已编码的内容
	htmlentities(要转换的字符串，转换规则) 将字符串转换为html实体
	   转换规则：ENT_COMPAT(默认选择项)只转换双引号
	             ENT_QUOTES(转换单/双引号) ENT_NOQUOTES(不转换任何引号)
	htmlspecialchars()也是转换，但中文不会转换，参数同上
	htmlspecialchars——decode()将已经转换为html实体的内容转换为字符串


//parse_url()解析url,返回其组成部分
$url="http://www.houdunwang.com/admin/index.php?m=channel&a=add";
$arr=parse_url($url);
echo "<pre>";
print_r($arr);//解析url

echo parse_url($url,PHP_URL_HOST);
echo "<br/>";
echo parse_url($url,PHP_URL_PATH);
echo "<br/>".------------------------."<br/>";
*/
$url="http://www.houdunwang.com/admin/index.php?m=channel&a=add";
$str="后盾网视频教程php&div+css";
echo "<a href='26.php?h=".urlencode($str)."'a>后盾网</a>";
echo "<br/>------------------------<br/>";
$str="后盾网视频教程";
echo urlencode($str);
echo "<br/>------------------------<br/>";
echo urldecode(urlencode($str));
echo "<br/>------------------------<br/>";
echo htmlentities("<h1>$url</h1>");
echo "&lt;strong&gt;加粗&lt;/strong&gt;";














?>