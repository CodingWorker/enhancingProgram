<?php 
//加密 
$key = '1234567890123456'; 
$content = 'hello';
$padkey = pad2Length($key,16);

$cipher = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_ECB, ''); 
$iv_size = mcrypt_enc_get_iv_size($cipher); 
$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND); #IV自动生成

echo '自动生成iv的长度:'.strlen($iv).'位:'.bin2hex($iv)."\r\n"; 
//echo pad2Length($content,16);值与加密后不去掉最后的填充字符相同
if (mcrypt_generic_init($cipher, pad2Length($key,16), $iv) != -1) 
{ 
	// PHP pads with NULL bytes if $content is not a multiple of the block size.. 
	$cipherText = mcrypt_generic($cipher,pad2Length($content,16) ); 
	
	mcrypt_generic_deinit($cipher); 
	mcrypt_module_close($cipher); 

	// Display the result in hex. 
	printf("128-bit encrypted result:n%snn",bin2hex($cipherText)); 
	//echo base64_encode($cipherText);  //直接打印加密后的文本显示不太友好，加密之后显示可能不太友好，最好转为16进制,使用base64_encode或者bin2hex
	print("\r\n"); 
}

//解密 
$mw = bin2hex($cipherText);
//print(hexToStr($mw)); bin2hex与hex2bin互反
$td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_ECB, ''); 
if (mcrypt_generic_init($td, $padkey, $iv) != -1) 
{ 
	$p_t = mdecrypt_generic($td, hexToStr($mw)); 
	
	mcrypt_generic_deinit($td); 
	mcrypt_module_close($td); 
	//print(bin2hex($p_t));die;
	print(strlen($p_t));die;
	//$p_t = trimEnd($p_t);//16,等于block_size
	//print($p_t);die;
	echo '解密:'; 
	print($p_t); 
	print("\r\n"); 
	print(bin2hex($p_t)); 
	echo "\r\n"; 
} 

//将$text补足$padlen倍数的长度 
function pad2Length($text, $padlen){ 
	$len = strlen($text)%$padlen; 
	$res = $text; 
	$span = $padlen-$len; 
	for($i=0; $i<$span; $i++){ 
		$res .= chr($span); 
	} 
	
	return $res; 
} 

//将解密后多余的长度去掉(因为在加密的时候 补充长度满足block_size的长度) 
function trimEnd($text){ 
	$len = strlen($text); 
	$c = $text[$len-1];
	//print($text);die;
	//print($len);16
//	print(ord($c));//11
	if(ord($c) <$len){ 
		for($i=$len-ord($c); $i<$len; $i++){   //这个去掉后面多余的长度的原来是根据pad2Length来做的，因为pad2Length就是在最后添加bloc_size-要加密的文本的长度的值表示的字符；所以最后要去掉
			//print($text[$i] . "\r\n");
			if($text[$i] != $c){ 
				return $text; 
			} 
		} 
		return substr($text, 0, $len-ord($c)); 
	} 
	return $text; 
}

//16进制的转为2进制字符串 
function hexToStr($hex) 
{ 
	$bin=""; 
	for($i=0; $i<strlen($hex)-1; $i+=2) 
	{ 
		$bin.=chr(hexdec($hex[$i].$hex[$i+1])); 
	} 
	return $bin; 
} 