<?php
/*�ַ���������
    php�����ַ����еĿո�  
	    trim ���ַ��������ַ���ɾ��
		ltrim���ַ�����ߵĿո�ɾ��
		rtrim���ַ����ұߵĿո�ɾ��
	php�����ַ����Ĵ�Сд
	    strtolower �ַ���ת����Сд
		strtoupper �ַ���ת���ɴ�д
		ucfirst ����ĸ��ѧ
		ucwords ��������ĸ��д
	�ַ�����亯��
	    str_pad("Ҫ�����ַ���",���֮�����ַ����ĳ��ȣ��������ݣ����ķ���)
		��䷽��STR_PAD_BOTH ������䣬������Ϊ�������Ҳ����
		          STR_PAD_LEFT ������
				  STR_PAD_RIGHT �Ҳ����
	�ַ�����ת���� strrev
    �ַ������� md5();
	��ʽ������ַ������� number_format(�ַ�����С��λ����С���㣬ǧλ�ָ���);
    �ַ�����ֳ�����
	    explode(Ҫ���ĸ��ַ���֣���ֵ��ַ�������������Ԫ�ص���Ŀ);
	������Ԫ����ϳ��ַ���
	    implode(�����ַ���������);
		





$houdunwang="      bbs.houdunwang.com    ";
echo strlen($houdunwang);
echo "<br/>----------------------<br/>";
echo strlen(trim($houdunwang));
echo $houdunwang;

$hdw="http://www.houdunwang.com bbs.houdunwang.com sina cool";
echo strtoupper($hdw);
echo "<br/>-----------------<br/>";
echo ucfirst($hdw);
echo "<br/>-----------------<br/>";
echo ucwords($hdw);

$url="bbs.houdunwang.com";
echo $url;
echo "<br/>------------------<br/>";
echo str_pad($url,5,"+");//���ַ����ĳ��ȱ�ԭ�ַ����ĳ���Сʱ�������
echo "<br/>------------------<br/>";
echo str_pad($url,35,"+",STR_PAD_BOTH);//�������

//�ַ�����ת����
$hdw="bbs.houdunwang.com";
echo strrev($hdw);

//md5()����
//$pwd="houdunwang";
if (md5($_GET['pwd'])=="bf320fa3295cf4770c58db4db5a8ef04"){
   echo "������ȷ";
}else{


?>
<form acton="" method="get">
    �û���:<input type="text" name="uname" /><br/>
	��  ��:<input type="password" name="pwd" /><br/>
	<input type="submit" value="�ύ">
</form>
<?php
}
?>

//��ʽ�����
$number=1222313123;
echo number_format($number,3,'+','*');

//����ַ���
$str1="�������̳����ѷ��������Ƶ����ַ�ǣ�bbs.houdunwang.com";
$arr1=explode("��",$str1);
$arr2=explode("��",$str1,2);
print_r($arr1);
echo "<br/>--------------------<br/>";
print_r($arr2)
*/
//��������ϳ��ַ���
$arr=array("�����","������","�ٶ���");
echo implode('+',$arr);















