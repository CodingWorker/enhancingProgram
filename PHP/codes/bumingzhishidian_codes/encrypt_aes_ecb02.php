<?php
/** 
 * ����mcrypt��AES���ܽ��� 
 * @author ts24<tsxw24@gmail.com> 
 */  
  
abstract class AES{  
    /** 
     * �㷨,���⻹��192��256���ֳ��� 
     */  
    const CIPHER = MCRYPT_RIJNDAEL_128;  
    /** 
     * ģʽ  
     */  
    const MODE = MCRYPT_MODE_ECB;  
  
    /** 
     * ���� 
     * @param string $key   ��Կ 
     * @param string $str   ����ܵ��ַ��� 
     * @return type  
     */  
    static public function encode( $key, $str ){  
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(self::CIPHER,self::MODE),MCRYPT_RAND);  
        return mcrypt_encrypt(self::CIPHER, $key, $str, self::MODE, $iv);  
    }  
      
    /** 
     * ���� 
     * @param type $key 
     * @param type $str 
     * @return type  
     */  
    static public function decode( $key, $str ){  
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(self::CIPHER,self::MODE),MCRYPT_RAND);  
        return mcrypt_decrypt(self::CIPHER, $key, $str, self::MODE, $iv);  
    }  
}

$str = '����������������������������������������dsfdghgasdfasdddddddd';  
$key = 'aSGJLGYEWERWRREW4567i8o';  
  
$str1=AES::encode($key, $str);  
$str2=AES::decode($key, $str1);  
  
  
  
var_dump($str);  
var_dump($str1);  
var_dump($str2);  
var_dump(rtrim($str2));
var_dump(strlen($str2));//64
var_dump(strlen($str2));//64

var_dump(bin2hex($str2));//64
var_dump(bin2hex(rtrim($str2)));//64