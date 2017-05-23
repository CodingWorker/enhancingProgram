#cURL 函数 

1. curl_close — 关闭一个cURL会话

		void  curl_close  ( resource $ch  )
		关闭一个cURL会话并且释放所有资源。cURL句柄 ch  也会被释放。 
		该函数没有返回值

2. curl_copy_handle — 复制一个cURL句柄和它的所有选项

		resource curl_copy_handle  ( resource $ch  )
		复制一个cURL句柄并保持相同的选项。
		返回一个curl句柄 

3. curl_errno — 返回最后一次的错误号

		int curl_errno  ( resource $ch  )
		返回错误号或者0,0表示没有错误发生

4. curl_error — 返回一个保护当前会话最近一次错误的字符串

		string curl_error  ( resource $ch  )
		返回一条最近一次cURL操作明确的文本的错误信息。
		返回值错误信息，如果没有错误发生则返回空字符串 

5. curl_escape — URL encodes the given string

		string curl_escape  ( resource $ch  , string $str  )
		使用URL encodes 编码字符串
		返回编码的字符串或者在失败时返回false

6. curl_exec — 执行一个cURL会话

		mixed  curl_exec  ( resource $ch  )
		这个函数应该在初始化一个cURL会话并且全部的选项都被设置后被调用
		成功时返回 TRUE ， 或者在失败时返回 FALSE 

7. `curl_file_create` — Create a CURLFile object

		

8. `curl_getinfo` — 获取一个cURL连接资源句柄的信息

		mixed  curl_getinfo  ( resource $ch  [, int $opt  = 0  ] )
		获取最后一次传输的相关信息。 

9. `curl_init` — 初始化一个cURL会话

		resource curl_init  ([ string $url  = NULL    ] )
		初始化一个新的会话，返回一个cURL句柄，供 curl_setopt() , curl_exec() 和 curl_close()  函数使用

10. `curl_multi_add_handle` — 向curl批处理会话中添加单独的curl句柄

		int curl_multi_add_handle  ( resource $mh  , resource $ch  )
		成功时返回0，失败时返回 CURLM_XXX 之一的错误码。 

11. `curl_multi_close` — 关闭一组cURL句柄

		void  curl_multi_close  ( resource $mh  )
		关闭一组cURL句柄。
		该函数没有返回值 

12. `curl_multi_exec` — 运行当前 cURL 句柄的子连接

		int curl_multi_exec  ( resource $mh  , int &$still_running  )
		处理在栈中的每一个句柄。无论该句柄需要读取或写入数据都可调用此方法。 


13. `curl_multi_getcontent` — 如果设置了CURLOPT_RETURNTRANSFER，则返回获取的输出的文本流

		string curl_multi_getcontent  ( resource $ch  )
		如果 CURLOPT_RETURNTRANSFER 作为一个选项被设置到一个具体的句柄，那么这个函数将会以字符串的形式返回那个cURL句柄获取的内容。 

14. `curl_multi_info_read` — 获取当前解析的cURL的相关传输信息

		array curl_multi_info_read  ( resource $mh  [, int &$msgs_in_queue  = NULL    ] )


15. curl_multi_init — 返回一个新cURL批处理句柄
16. curl_multi_remove_handle — 移除curl批处理句柄资源中的某个句柄资源
17. curl_multi_select — 等待所有cURL批处理中的活动连接
18. curl_multi_setopt — Set an option for the cURL multi handle
19. curl_multi_strerror — Return string describing error code
20. curl_pause — Pause and unpause a connection
21. curl_reset — Reset all options of a libcurl session handle
22. curl_setopt_array — 为cURL传输会话批量设置选项
23. curl_setopt — 设置一个cURL传输选项
24. curl_share_close — Close a cURL share handle
25. curl_share_init — Initialize a cURL share handle
26. curl_share_setopt — Set an option for a cURL share handle.
27. curl_strerror — Return string describing the given error code
28. curl_unescape — Decodes the given URL encoded string
29. curl_version — 获取cURL版本信息
