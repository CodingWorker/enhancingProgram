1. `file_get_contents`中文乱码

		file_get_contents 从url中读取数据时，可能会出现乱码，那可能是因为php开启了zlib压缩，可以phpinfo查看
		如 file_get_contents($url);

	解决办法是这样读：file_get_contents('compress.zlib://'.$url);

2. try不能捕获warning

		Php的warning 不能被try-catche到；

3. array_pop会将数组的最后一个元素弹出，并从数组中剔除出该元素
