<?php
/*ת���������� 1 ����ת�� 2 ǿ��ת��
$a="��ӭ����������2008����˻ῪĻ";
$b=(int)$a;
var_dump($b);
var_dump($a);

//��������
$a="2010������";
settype($a,'int');
var_dump($a);
//�����ת������ intval()ת��Ϊ���� floatval() ת��Ϊ������ strval() ת��Ϊ�ַ�������--ֻ�ܶԱ�������ת�� int string float bool    �������鲻֧��

$a=700;
$b=floatval($a);
var_dump($b);
*/
//$__GET[]




?>
<html>
    <head>
	    <title>�ύ�ⲿ��</title>
	</head>
	<body>
	    <form action="7_1.php" method="post">
		    ������<input type="text" name="uname" /><br/>
			���䣺<input type="text" name="age" /><br/>
			�绰��<input type="text" name="tel" /><br/>
			��ַ��<input type="text" name="address" /><br/>
			QQ��<input type="text" name="qq" /><br/>
			�������ۣ�
			<textarea name="coment" rows=10 cols=30></textarea><br />
			<input type="submit" value="�ύ����" />&nbsp;&nbsp;
			<input type="reset" value="�����" />
		</form>
	</body>
</html>