<?php
/*�ַ���������
    
	urlencode url����,�����Ӣ�ĵ��ַ��Ա����
	urldecode �����ѱ��������
	htmlentities(Ҫת�����ַ�����ת������) ���ַ���ת��Ϊhtmlʵ��
	   ת������ENT_COMPAT(Ĭ��ѡ����)ֻת��˫����
	             ENT_QUOTES(ת����/˫����) ENT_NOQUOTES(��ת���κ�����)
	htmlspecialchars()Ҳ��ת���������Ĳ���ת��������ͬ��
	htmlspecialchars����decode()���Ѿ�ת��Ϊhtmlʵ�������ת��Ϊ�ַ���


//parse_url()����url,��������ɲ���
$url="http://www.houdunwang.com/admin/index.php?m=channel&a=add";
$arr=parse_url($url);
echo "<pre>";
print_r($arr);//����url

echo parse_url($url,PHP_URL_HOST);
echo "<br/>";
echo parse_url($url,PHP_URL_PATH);
echo "<br/>".------------------------."<br/>";
*/
$url="http://www.houdunwang.com/admin/index.php?m=channel&a=add";
$str="�������Ƶ�̳�php&div+css";
echo "<a href='26.php?h=".urlencode($str)."'a>�����</a>";
echo "<br/>------------------------<br/>";
$str="�������Ƶ�̳�";
echo urlencode($str);
echo "<br/>------------------------<br/>";
echo urldecode(urlencode($str));
echo "<br/>------------------------<br/>";
echo htmlentities("<h1>$url</h1>");
echo "&lt;strong&gt;�Ӵ�&lt;/strong&gt;";














?>