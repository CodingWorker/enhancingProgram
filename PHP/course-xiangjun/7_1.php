<?php 
$uname=empty($_POST['uname']) ? "����д����" : $_POST['uname'];
$age=empty($_POST['age']) ? "����д����" : $_POST['age'];
$tel=empty($_POST['tel']) ? "����д�绰" : $_POST['tel'];
$address=empty($_POST['address']) ? "����д��ַ" : $_POST['address'];
$qq=empty($_POST['qq']) ? "����дqq" : $_POST['qq'];
$coment=empty($_POST['coment']) ? "������������" : $_POST['coment'];
echo "������{$uname}<br/>���䣺{$age}<br/>�绰��{$tel}<br/>QQ:{$qq}<br/>�������ۣ�{$coment}"



?>