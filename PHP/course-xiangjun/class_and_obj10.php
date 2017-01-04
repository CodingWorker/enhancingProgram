<?php 
header("Content-type:text/html;charset=utf-8");
/*魔术常量
__CLASS__可以得到当前类的类名称，前后都是两个_，区分大小写
__METHOD__得到类的方法名，区分大小写
__FUNCTION__得到函数名,区分大小写
__FILE__返回当前页面的绝对路径,指书写该函数的绝对路径，include包含该函数的文件时显示的仍是被包含进的文件的绝对路径
DIRECTORY_SEPARATOR当前电脑的路径分隔符\（windows)或/（linux)
__DIR__（php5.3版本以上）与dirname(__FILE__)一样
*/
class hdw{
	function _hdw(){
		//return __CLASS__;
		//return __METHOD__;//显示类名::方法名
		return __FUNCTION__;//直接显示函数名
	}
}
$a=new hdw();
echo $a->_hdw();
function Aa(){
	echo __FUNCTION__;
}
aa();//函数名不去分大小写
echo __FILE__;
//-------------使用---------------
echo "<br/>-------------使用------------<br/>";
//$path=str_replace('\\','/',dirname(__FILE__));//得到当前文件的根目录/上一级目录
$path=dirname(__FILE__);
//echo $path;
define('WEBDIR',$path);
//define('TEMPLATE',WEBDIR."/template");//模板目录
echo DIRECTORY_SEPARATOR;
define('TEMPLATE',WEBDIR.DIRECTORY_SEPARATOR.'template');//模板目录另一种写法
echo TEMPLATE;
phpinfo();












 ?>