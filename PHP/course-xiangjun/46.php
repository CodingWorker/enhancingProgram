<?php 
/*对象







*/
class Pc{
	public $yanse;//定义公用属性
	public $pinpai;
	function games(){//定义方法,方法不区分大小写
		echo 'play games...'; 
	}
	function online(){
		echo 'searching online...';
	}
	function songs(){
		echo '听歌';
	}
}


$hdw_pc=new Pc();
$hdw_pc->pinpai='IBM';//对公用属性赋值
$hdw_pc->yanse='white';//对公用属性赋值
$hdw_pc->games();//调用对象的一个方法
$zs_pc=new Pc();
$zs_pc->pinpai='Apple';//对公用属性赋值
$zs_pc->yanse='black';//对公用属性赋值
$zs_pc->songs();//调用对象一个的方法
class ArcChannel{
	public $arcChannelId;
	function channelEdit(){
		echo '编辑文章栏目';
	}
}








 ?>