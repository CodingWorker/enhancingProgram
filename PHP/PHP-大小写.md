#PHP的大小写问题(mysql中语句的大小写是可以配置的)

1. 变量名区分大小写

2. 常量名区分大小写，一般大写
3. 函数名、方法名和类名不区分大小写。

		VAR_DUMP(TRUE);		

4. 魔术常量不区分大小写，推荐大写

		var_dump(__file__);
		var_dump(__FILE__);输出结果一样
		var_dump(__line__);
		var_dump(__LINE__);输出结果一样

5. NULL/TRUE和FALSE不区分大小写

		var_dump(true);
		var_dump(TRUE);结果相同


**可见只有变量名和常量区分大小写**