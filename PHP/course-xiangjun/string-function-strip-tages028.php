<?php
/*��ȡ�ļ���ת��
 get_magic_quotes_runtime(),��ȡ�ⲿ�ļ������ݿ�����ʱ�Ƿ�������ת��, ��ȡ��ǰ magic_quotes_runtime ����ѡ��ļ���״̬ 
 set_magic_quotes_runtime()�����ⲿ�ļ������ݿ�����ʱ������ת�壬�°汾���Ѿ���֧����
 strip_tags()ȥ��html�еı�ǩ










//phpinfo();��ȡphp.ini�ļ�
//var_dump(get_magic_quotes_runtime());
set_magic_quotes_runtime(1);//����ת���ַ�

$file=fopen('28_1.txt','r');
$con=fread($file,filesize('28_1.txt'));
echo $con;
*/
 var_dump(get_magic_quotes_runtime());
//
$str="<div style='background-color:blue;width:200px;height:50px'><span style='color:yellow'>�����</span>��Ƶ�̳�</div>";
echo $str;
echo strip_tags($str)."<br/>";//ȥ�����б�ǩ
echo strip_tags($str,'<span><a>');//����span��ǩ





//33 PHP��Ƶ�̳� ����(��)array_diff_ukey()array_diff_uassoc()array_intersect()array_intersect_assoc()array_intersect_key()array_intersect_ukey()array_intersect_uassoc()









?>