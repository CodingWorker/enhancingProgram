<?php
$privateKey = "1234567812345678";
$iv128 = "1234567812345678";//8*16
$iv256 = "12345678123456781234567812345678";
$data = "Test String";

//����
$encrypted = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $privateKey, $data, MCRYPT_MODE_CBC, $iv256);
echo(base64_encode($encrypted));
echo "\n";
$encrypted = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $privateKey, $data, MCRYPT_MODE_CBC, $iv128);
echo(base64_encode($encrypted));

echo "\n����\n";

//����
$encryptedData = base64_decode("2fbwW9+8vPId2/foafZq6Q==");
$decrypted = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $privateKey, $encryptedData, MCRYPT_MODE_CBC, $iv128);
echo($decrypted);