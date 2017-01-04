<?php 
/*字符串截取
utf-8下一个中文3个字节
gbk,gb2312一个中文占2个字节
ord(substr($str,0,1))>0xa0;//返回真则说明是多字节，此时输出会是乱码








*/
$str="后盾网论坛http://houdunwang.com";
//echo substr($str,0,6);
echo "<br/>=================<br/>";
//echo substr($str,0,3);
//echo substr($str,3,3);
//echo ord(substr($str,0,1))>0xa0;
//截取任意字符，不输出乱码
function sub($str,$len){
	$string='';
	for($i=0;$i<$len;$i++){
		if (ord(substr($str,$i,1))>0xa0){
			$string.=substr($str,$i,3);//utf-8一个中文占3个字节
			$i+=2;
		}else{
			$string.=substr($str,$i,1);
		}
	}
	return $string;
}
echo sub($str,100);










 ?>