<?php
/*
�������������÷�Χ
global $bbs;
ж�ر��� unset(����);--ж���˺�����ı���������ı��ⲿ��������ʹ����globalҲ��һ��

static $i=1;���徲̬���� �����ڶ�������й���ֻ���ڵ�һ�ε���ʱ��ֵ���Ժ�ĵ��ò����ٸ�ֵ

��ֵ���� function eat($name){�����}
��ַ����function eat(&$name){�����}


*/
$bbs="�������̳";
function say(){
	global $bbs;
    $bbs="http://bbs.houdunwang.com";
	return $bbs;
}
say();
echo $bbs;
echo "<pre>";
//print_r($GLOBALS);
function hold(){
   static $i=1;
   $i++;
   echo $i."<br/>";
}
hold();
hold();
hold();
hold();
hold();


 





?>