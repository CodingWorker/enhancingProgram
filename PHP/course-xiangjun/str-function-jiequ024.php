<?php
/*�ַ�������

�ַ����Ľ�ȡ
   
	parse_str()���ַ�������������uname=zhangsan&age=33&sex=boy����Ϊ������uname=zhangsan&��age=33��sex=boy
	chuck_split()���ַ�����ָ����С���

*/
/*
//substr��ȡ�ַ���,substr()��ĳ���ַ�������ָ�������Ľ�ȡ
//�ڶ�������ָ����ʼ��ȡ��λ�ã�������������Ϊ��������ȡ���Ǹ�������Ϊ��������ȡ����λ��
//strchr() strstr�ı���������һ���ַ�������һ���ַ����еĵ�һ�γ��ּ�����������ַ���stristr()�����ִ�Сдstrrchr()����һ���ַ�������һ���ַ��������һ�γ��ֵ������ַ���

$houdunwang="bbs.houdunwang.com";
echo substr($houdunwang,4,10);//��ȡhoudunwang,�ӵ�4������ʼ����ȡ10��
echo "<br/>--------------------------------<br/>";
echo substr($houdunwang,4)."<br/>";//��ָ���ڶ�����Ĭ�ϵ��ַ�������
echo substr($houdunwang,-5,2)."<br/>";//����Ϊ�Ӻ���ǰ���������ڶ����ַ���������������ȡ�ڶ��������������Ǹ������ȡ���ø���ָ��λ��
echo substr($houdunwang,-5,-2);//����Ϊ�Ӻ���ǰ���������ڶ����ַ���������������ȡ�ڶ��������������Ǹ������ȡ���ø���ָ��λ��


//strstr����strchr
$bbs="������ӷ���Ƶ�̷̳���bbs.houdunwang.com,���ظ�������¼�������̳";
$s=strchr($bbs,"����");
var_dump($s);//�����ҵ��������ַ������������ַ���ƥ��λ�ú����ȫ������,û���ҵ�����false
$abc="adffadafa";
var_dump(strchr($abc,'f'));
var_dump(stristr($abc,'F'));//�����ִ�Сд
var_dump(strrchr($abc,'f'));//�Ӻ�������ַ���

//strpos()����һ���ַ�������һ���ַ����е�һ�γ��ֵ�λ�ã����ִ�Сд��stripos()�����ִ�Сдstrrpos()����һ���ַ�������һ���ַ��������һ�γ��ֵ�λ��(���Ӻ������)�����ִ�Сд��strripos()�����ִ�Сд

$abc="adffadadfa";
var_dump(strpos($abc,'f'));//���ִ�Сд���ҵ�һ���ֵ��±꣬�±��0��ʼ
var_dump(stripos($abc,'F'));//�����ִ�Сд���ҵ�һ���ֵ��±꣬�±��0��ʼ
var_dump(strrpos($abc,'f'));//���ִ�Сд���������ֵ��±꣬�±��0��ʼ
var_dump(strripos($abc,'D'));//�����ִ�Сд�������һ�γ��ֵ��±꣬�±��0��ʼ

$str="php�γ�,mysql�γ�,divcss�γ�,dreamweaver�γ�";
echo $str;
$s=strtok($str,',');
echo "<br/>--------------------------------<br/>";
echo $s;
// echo strtok($str,',');
echo strtok(',');
echo strtok(',');
echo strtok(',');
var_dump(strtok(','));

echo "<br/>--------------------------------<br/>";
*/
$url="http://www.houdunwang.com?uname=zhangsan&age=33&sex=boy";
$u_msg=substr($url,(strpos($url,"?")+1));
echo $u_msg."<hr/>";//�����uname=zhangsan&age=33&sex=boy
parse_str($u_msg);//�ú���û�з���ֵ
echo $uname."<br/>";//��� zhangsan
echo $age."<br/>";//��� 33
echo $sex."<br/>";
echo "<br/>--------------------------------<br/>";
echo chunk_split($url,3)."<br/>";
echo chunk_split($url,3,'�ֿ�');







?>