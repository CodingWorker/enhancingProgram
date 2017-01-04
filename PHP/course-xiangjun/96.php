<?php 
/*
var_dump(get_loaded_extensions());//打开已经加载的扩展库
var_dump(get_extension_funcs('gd'));//获得扩展库里的函数名；如果扩展库不存在或没开启就返回布尔值false
var_dump(extension_loaded('gd'));//判断扩展库是否已经加载，返回布尔值

*/
/*
var_dump(get_loaded_extensions());//打开已经加载的扩展库
var_dump(get_extension_funcs('gd'));//获得扩展库里的函数名
var_dump(extension_loaded('gd'));//判断扩展库是否已经加载
*/
//图片部分颜色取反
// $img=imagecreatefrompng('pic.png');
// $w=imagesx($img);
// $height=imagesy($img);
// for($i=0;$i<=$w/2;$i++){
// 	for ($j=0;$j<=$height/2;$j++){
// 		$color_old=imagecolorat($img,$i,$j);
// 		$white=imagecolorallocate($img,255,255,255);
// 		// echo decbin($white);
// 		// echo "<br/>====";
// 	    $color_new=(~$color_old) & 0xffffff;
// 	    imagesetpixel($img,$i,$j,$color_new);	
// 	}
// }





// header("Content-type:image/png");
// imagepng($img);








 ?>