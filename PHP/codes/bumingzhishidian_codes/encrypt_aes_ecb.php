<?php 
//���� 
$key = '1234567890123456'; 
$content = 'hello';
$padkey = pad2Length($key,16);

$cipher = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_ECB, ''); 
$iv_size = mcrypt_enc_get_iv_size($cipher); 
$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND); #IV�Զ�����

echo '�Զ�����iv�ĳ���:'.strlen($iv).'λ:'.bin2hex($iv)."\r\n"; 
//echo pad2Length($content,16);ֵ����ܺ�ȥ����������ַ���ͬ
if (mcrypt_generic_init($cipher, pad2Length($key,16), $iv) != -1) 
{ 
	// PHP pads with NULL bytes if $content is not a multiple of the block size.. 
	$cipherText = mcrypt_generic($cipher,pad2Length($content,16) ); 
	
	mcrypt_generic_deinit($cipher); 
	mcrypt_module_close($cipher); 

	// Display the result in hex. 
	printf("128-bit encrypted result:n%snn",bin2hex($cipherText)); 
	//echo base64_encode($cipherText);  //ֱ�Ӵ�ӡ���ܺ���ı���ʾ��̫�Ѻã�����֮����ʾ���ܲ�̫�Ѻã����תΪ16����,ʹ��base64_encode����bin2hex
	print("\r\n"); 
}

//���� 
$mw = bin2hex($cipherText);
//print(hexToStr($mw)); bin2hex��hex2bin����
$td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_ECB, ''); 
if (mcrypt_generic_init($td, $padkey, $iv) != -1) 
{ 
	$p_t = mdecrypt_generic($td, hexToStr($mw)); 
	
	mcrypt_generic_deinit($td); 
	mcrypt_module_close($td); 
	//print(bin2hex($p_t));die;
	print(strlen($p_t));die;
	//$p_t = trimEnd($p_t);//16,����block_size
	//print($p_t);die;
	echo '����:'; 
	print($p_t); 
	print("\r\n"); 
	print(bin2hex($p_t)); 
	echo "\r\n"; 
} 

//��$text����$padlen�����ĳ��� 
function pad2Length($text, $padlen){ 
	$len = strlen($text)%$padlen; 
	$res = $text; 
	$span = $padlen-$len; 
	for($i=0; $i<$span; $i++){ 
		$res .= chr($span); 
	} 
	
	return $res; 
} 

//�����ܺ����ĳ���ȥ��(��Ϊ�ڼ��ܵ�ʱ�� ���䳤������block_size�ĳ���) 
function trimEnd($text){ 
	$len = strlen($text); 
	$c = $text[$len-1];
	//print($text);die;
	//print($len);16
//	print(ord($c));//11
	if(ord($c) <$len){ 
		for($i=$len-ord($c); $i<$len; $i++){   //���ȥ���������ĳ��ȵ�ԭ���Ǹ���pad2Length�����ģ���Ϊpad2Length������������bloc_size-Ҫ���ܵ��ı��ĳ��ȵ�ֵ��ʾ���ַ����������Ҫȥ��
			//print($text[$i] . "\r\n");
			if($text[$i] != $c){ 
				return $text; 
			} 
		} 
		return substr($text, 0, $len-ord($c)); 
	} 
	return $text; 
}

//16���Ƶ�תΪ2�����ַ��� 
function hexToStr($hex) 
{ 
	$bin=""; 
	for($i=0; $i<strlen($hex)-1; $i+=2) 
	{ 
		$bin.=chr(hexdec($hex[$i].$hex[$i+1])); 
	} 
	return $bin; 
} 