<?php
/*�ַ���������
�ַ������滻
    
�ȽϺ���
    strcmp()�Ƚ��ַ����������ȷ���0�������һ���󷵻�1�����򷵻�-1,���ִ�Сд��strcasecmp()�����ִ�Сд
	strnatcmp()����Ȼ����С���бȽ�
	strncmp()�Ƚ��ַ�����ǰ�����ַ� strncmp('1001','1002',3)
    similar_text(),�Ƚ������ַ��������ƶȣ�һһ�ַ����бȽϣ��������������д������ưٷֱ� similar_text('houdunwang','ho1du2wan3',$v);
    strtr()�滻�ַ����е��ַ� strtr('houdunwang','ham','HAM');
�ַ�����ͳ��
    substr_count(Ҫ���ҵ�ԭʼ�ַ��������ҵ��ַ�����ʼ���ҵ�λ�ã������Ҷ��ٸ��ַ�)




*/
//str_replace()���ִ�Сд,str_ireplace�����ִ�Сд,Ҳ����ʹ������ָ���滻�ַ���
$hdw="�����www.houdunHwang.com,���ظ�������¼��̳";
$str=str_replace('h','��',$hdw);//��h��Ϊ��
echo $str;
echo "<br/>-----------------------------<br/>";
$stri=str_ireplace("h","��",$hdw);//�����ִ�Сд,��h��H��Ϊ��
echo $stri;
echo "<br/>-----------------------------<br/>";
$arr1=array("h","d","w");
$arr2=array("H","D","W");
echo str_replace($arr1,$arr2,$hdw);//�����Ӧ��Ϊָ�����滻������ַ����滻
echo "<br/>-----------------------------<br/>";
echo str_replace($arr1,$arr2,$hdw,$k);//$kͳ���滻�˶��ٴ�
echo "<br/>-----------------------------<br/>";
echo $k;
echo "<br/>-----------------------------<br/>";
echo strcmp("houdunwang","Houdunwang");//�Ƚ��ַ��������ִ�Сд
echo "<br/>-----------------------------<br/>";
echo strcasecmp("houdunwang","HouDunwang");//�Ƚ��ַ����������ִ�Сд
echo "<br/>-----------------------------<br/>";
echo strcmp("10","2");//�Ƚ��ַ�������������Ȼ����С�Ƚ�
echo "<br/>-----------------------------<br/>";
echo strnatcmp("12","2");//�Ƚ��ַ�����������Ȼ����С�Ƚ�
echo "<br/>-----------------------------<br/>";
echo strnatcasecmp("1h22","1H21");//�Ƚ��ַ��������ִ�Сд��������Ȼ����С�Ƚ�
echo "<br/>-----------------------------<br/>";
echo strncmp("11112","111",3);//�Ƚ��ַ��������Ƚ�ǰ3���ַ�
echo "<br/>";
echo similar_text('houdunwang444444','ho1du2wan3',$v);//�Ƚ����ƶȣ�������ͬ�ַ��ĸ���
echo "<br/>";
echo $v;
echo similar_text('ho1du2wan3','houdunwang',$v);//
echo "<br/>-----------------------------<br/>";
echo $v;//������ƶȵİٷֱ�
echo "<br/>-----------------------------<br/>";
echo strtr('houdunwang.com','ham','HAM');//�滻�ַ�,Ҳ����������ָ���滻
echo "<hr/>";
echo strtr('houdunwang.com',array("h"=>"H","a"=>"A","m"=>"M"));
echo "<br/>-----------------------------<br/>";
echo substr_count('houdunwang.com �������Ƶ houdunwang.com','houdunwang',21,14);//���1����һ��20ָ�ӿ�ͷ��21���ַ��������ֽڣ���ʼ�ң��ڶ���ָ�ӿ�ʼλ��14���ַ���ֹͣ����











?>