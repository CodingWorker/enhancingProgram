<?php
/*




*/
//addslashes()  ��Ԥ�����ַ���ǰ��ӷ�б��,����������\'��˫����\",��б��\\,��null�ַ�
echo addslashes("ffaf����adfa''adfa''\'nuklfd");


//stripslashes()  addslashesת��ķ���������ת��֮ǰ�ķ�б��ɾ��
echo stripslashes(addslashes("afafdfd'as'\'a\'/aaf.\asdf'af"));//��� afafdfd'as'\'a\'/aaf.\asdf'af

//get_magic_quotes_gpc()   ��ȡPHP.ini���Ƿ����Զ�ת��
var_dump(get_magic_quotes_gpc());//����false,˵��û�п���






















?>