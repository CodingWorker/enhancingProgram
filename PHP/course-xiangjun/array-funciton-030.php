<?php
/*���鴦����
  implode() ��������ϳ��ַ���
  explode() ���ַ����ָ������
  in_array()��������Ƿ���������
  each() ������Ԫ�ز�ֳ��µ����飬�������һ��Ԫ��
  list()=���� ������Ԫ�ظ�ֵ��������ֻ����������������




*/
$arr=array('PHP�γ�','HTML�γ�','JSP�γ�');
// echo implode(':',$arr);
// $str=implode(',',$arr);
// var_dump($str);
//$str1=explode(',',$str);
//print_r $str1;
// $s="'PHP�γ�','HTML�γ�','JSP�γ�'";
// var_dump(explode(",",$s));
// var_dump(explode("��",$s));
//print_r T_STRING(',',$s);
list($a,$b,$c)=$arr;
echo $a;
$arr3=array('1','2','3');
var_dump(in_array(11,$arr3));
$arr=array("PHP","MYSQL","HTML","CSS");
var_dump(in_array("PHP",$arr));//���true













?>