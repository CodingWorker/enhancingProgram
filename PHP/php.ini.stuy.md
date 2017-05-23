[PHP]
   2 
   3 ;;;;;;;;;;;;;;;;;;;
   4 ; About php.ini   ;
   5 ;;;;;;;;;;;;;;;;;;;
   6 ; PHP's initialization file, generally called php.ini, is responsible for
   7 ; configuring many of the aspects of PHP's behavior.
关于php.ini
PHP的初始化文件，通常称为php.ini,负责PHP行为的许多方面的配置
   8 
   9 ; PHP attempts to find and load this configuration from a number of locations.
  10 ; The following is a summary of its search order:
  11 ; 1. SAPI module specific location.
  12 ; 2. The PHPRC environment variable. (As of PHP 5.2.0)
  13 ; 3. A number of predefined registry keys on Windows (As of PHP 5.2.0)
  14 ; 4. Current working directory (except CLI)
  15 ; 5. The web server's directory (for SAPI modules), or directory of PHP
  16 ; (otherwise in Windows)
  17 ; 6. The directory from the --with-config-file-path compile time option, or the
  18 ; Windows directory (C:\windows or C:\winnt)
  19 ; See the PHP docs for more specific information.
  20 ; http://php.net/configuration.file

----------

PHP尝试查找和载入这个配置文件从多个地址，下面的是它查找顺序的一个简介：
1.SAPI模块特殊路径
2.PHP运行时配置的环境变量
3.在windows上的多个预定义的注册表项
4.当前工作目录（除了CLI)
5.网站服务器目录（专门指SAPI模块），或者PHP目录（指windows中的其他php）
5.windows目录（如C:\windows or C:\winnt)
6.查看PHP文档查看更多的信息

----------

  21 
  22 ; The syntax of the file is extremely simple.  Whitespace and lines
  23 ; beginning with a semicolon are silently ignored (as you probably guessed).
  24 ; Section headers (e.g. [Foo]) are also silently ignored, even though
  25 ; they might mean something in the future.

----------

这份文件的语法极其的简单，以分号开头的空格键和空白行会被忽略（可能正如你猜的那样），章节标题（例如[Foo])也会被忽略，尽管未来他们可能有某种含义

----------

  26 
  27 ; Directives following the section heading [PATH=/www/mysite] only
  28 ; apply to PHP files in the /www/mysite directory.  Directives
  29 ; following the section heading [HOST=www.example.com] only apply to
  30 ; PHP files served from www.example.com.  Directives set in these
  31 ; special sections cannot be overridden by user-defined INI files or
  32 ; at runtime. Currently, [PATH=] and [HOST=] sections only work under
  33 ; CGI/FastCGI.
  34 ; http://php.net/ini.sections

----------

章节标题[PATH=/www/mysite]下的指南/说明/配置只适用于/www/mysite目录下的php文件。
章节标题[HOST=www.example.com]下的指南/说明/配置只适用于服务于www.example.com的php文件。
在这些特殊的章节部分的指令/说明/配置不能在PHP运行期间被用户自定义的ini配置文件重写或覆盖。
目前，[PATH=] and [HOST=]章节部分只能在CGI或FASTCGI下工作

----------

  35 
  36 ; Directives are specified using the following syntax:
  37 ; directive = value
  38 ; Directive names are *case sensitive* - foo=bar is different from FOO=bar.
  39 ; Directives are variables used to configure PHP or PHP extensions.
  40 ; There is no name validation.  If PHP can't find an expected
  41 ; directive because it is not set or is mistyped, a default value will be used.

----------

专门指令使用了下面的语法：
指令=值 的形式，指令名字是大小写敏感的，如foo=bar与FOO=bar是不同的，指令是用来配置PHP或者PHP扩展的变量，在这里没有名字确认（即名字验证是否是PHP配置变量名），如果因为没有被设置值或者输入指令错误导致PHP不能找到期望的指令时，PHP将会使用该选项的默认值

----------

  42 
  43 ; The value can be a string, a number, a PHP constant (e.g. E_ALL or M_PI), one
  44 ; of the INI constants (On, Off, True, False, Yes, No and None) or an expression
  45 ; (e.g. E_ALL & ~E_NOTICE), a quoted string ("bar"), or a reference to a
  46 ; previously set variable or directive (e.g. ${foo})

----------

值可以是字符串、数字、PHP常量（如E_ALL 或者 M_PI）、任何一个ini配置常量（如On, Off, True, False, Yes, No and None）或者一个表达式（如E_ALL & ~E_NOTICE），一个被括号括起来的字符串（如"bar"）或者一个代表之前设置的变量或者指令的表达式（如${foo}）

----------

  47 
  48 ; Expressions in the INI file are limited to bitwise operators and parentheses:
  49 ; |  bitwise OR
  50 ; ^  bitwise XOR
  51 ; &  bitwise AND
  52 ; ~  bitwise NOT
  53 ; !  boolean NOT

----------

ini文件中的表达式被限制为按位操作和**括号**
|  bitwise OR  按位或
^  bitwise XOR  按位异或
&  bitwise AND  按位与
~  bitwise NOT  按位非
!  boolean NOT  布尔操作非

----------

  54 
  55 ; Boolean flags can be turned on using the values 1, On, True or Yes.
  56 ; They can be turned off using the values 0, Off, False or No.

----------

布尔标志正确可以使用值1 On True或者Yes,布尔标志错误可以使用值0 Off False 或者No

----------

  57 
  58 ; An empty string can be denoted by simply not writing anything after the equal
  59 ; sign, or by using the None keyword:
  60 
  61 ;  foo =         ; sets foo to an empty string
  62 ;  foo = None    ; sets foo to an empty string
  63 ;  foo = "None"  ; sets foo to the string 'None'

----------

等号标志后面不写内容或者使用关键字None可以被解释为空字符串，如
foo =         ; sets foo to an empty string   将foo设置为空字符串
foo = None    ; sets foo to an empty string   将foo设置为空字符串
foo = "None"     将foo设置为字符串None

----------

  64 
  65 ; If you use constants in your value, and these constants belong to a
  66 ; dynamically loaded extension (either a PHP extension or a Zend extension),
  67 ; you may only use these constants *after* the line that loads the extension.

----------

如果你在值中使用常量，而且这些常量属于PHP的一个动态加载扩展（无论是PHP扩展或者zend扩展）你可能只能够在加载了这些扩展之后才能使用扩展中的这些常量

----------

  68 
  69 ;;;;;;;;;;;;;;;;;;;
  70 ; About this file ;
  71 ;;;;;;;;;;;;;;;;;;;
  72 ; PHP comes packaged with two INI files. One that is recommended to be used
  73 ; in production environments and one that is recommended to be used in
  74 ; development environments.

----------

关于本文件
PHP包包含两个ini文件，一个被推荐在生产环境下使用，另一个推荐在开发环境下使用

----------

  75 
  76 ; php.ini-production contains settings which hold security, performance and
  77 ; best practices at its core. But please be aware, these settings may break
  78 ; compatibility with older or less security conscience applications. We
  79 ; recommending using the production ini in production and testing environments.

----------

适合生产环境的php.ini文件包含了多项设置，以安全、效率和最好的实践作为它的核心，但请注意，这些设置也许会在与旧版本或者不安全的应用不兼容，我们强烈建议在生产和测试环境下使用适合生产环境的配置文件

----------

  80 
  81 ; php.ini-development is very similar to its production variant, except it is
  82 ; much more verbose when it comes to errors. We recommend using the
  83 ; development version only in development environments, as errors shown to
  84 ; application users can inadvertently leak otherwise secure information.

----------

适用于开发坏境的php.ini文件与生产环境下的配置文件相似，除了当涉及到错误处理时显得更加的冗长啰嗦。我们建议仅仅在开发环境下使用开发版本配置，因为如果错误显示给应用使用者会不经意的泄露其他的安全信息

----------

  85 
  86 ; This is php.ini-production INI file.

----------

这是适用于生产环境下的PHP配置文件

----------

  87 
  88 ;;;;;;;;;;;;;;;;;;;
  89 ; Quick Reference ;
  90 ;;;;;;;;;;;;;;;;;;;
  91 ; The following are all the settings which are different in either the production
  92 ; or development versions of the INIs with respect to PHP's default behavior.
  93 ; Please see the actual settings later in the document for more details as to why
  94 ; we recommend these changes in PHP's behavior.

----------

快速指南：下面的是所有的配置，考虑到PHP的默认行为，这些配置在开发版本（适用于开发环境的php.ini）和生产版本（适用于生产环境的php.ini）都不同，至于为什么我们推荐PHP行为的这些改变，请查看文档中接下来的实际配置以了解更多的信息

----------

  95 
  96 ; display_errors
  97 ;   Default Value: On
  98 ;   Development Value: On
  99 ;   Production Value: Off
 100 
 101 ; display_startup_errors
 102 ;   Default Value: Off
 103 ;   Development Value: On
 104 ;   Production Value: Off
 105 
 106 ; error_reporting
 107 ;   Default Value: E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED
 108 ;   Development Value: E_ALL
 109 ;   Production Value: E_ALL & ~E_DEPRECATED & ~E_STRICT
 110 
 111 ; html_errors
 112 ;   Default Value: On
 113 ;   Development Value: On
 114 ;   Production value: On
 115 
 116 ; log_errors
 117 ;   Default Value: Off
 118 ;   Development Value: On
 119 ;   Production Value: On
 120 
 121 ; max_input_time
 122 ;   Default Value: -1 (Unlimited)
 123 ;   Development Value: 60 (60 seconds)
 124 ;   Production Value: 60 (60 seconds)
 125 
 126 ; output_buffering
 127 ;   Default Value: Off
 128 ;   Development Value: 4096
 129 ;   Production Value: 4096
 130 
 131 ; register_argc_argv
 132 ;   Default Value: On
 133 ;   Development Value: Off
 134 ;   Production Value: Off
 135 
 136 ; request_order
 137 ;   Default Value: None
 138 ;   Development Value: "GP"
 139 ;   Production Value: "GP"
 140 
 141 ; session.gc_divisor
 142 ;   Default Value: 100
 143 ;   Development Value: 1000
 144 ;   Production Value: 1000
 145 
 146 ; session.hash_bits_per_character
 147 ;   Default Value: 4
 148 ;   Development Value: 5
 149 ;   Production Value: 5
 150 
 151 ; short_open_tag
 152 ;   Default Value: On
 153 ;   Development Value: Off
 154 ;   Production Value: Off
 155 
 156 ; track_errors
 157 ;   Default Value: Off
 158 ;   Development Value: On
 159 ;   Production Value: Off
 160 
 161 ; url_rewriter.tags
 162 ;   Default Value: "a=href,area=href,frame=src,form=,fieldset="
 163 ;   Development Value: "a=href,area=href,frame=src,input=src,form=fakeentry"
 164 ;   Production Value: "a=href,area=href,frame=src,input=src,form=fakeentry"
 165 
 166 ; variables_order
 167 ;   Default Value: "EGPCS"
 168 ;   Development Value: "GPCS"
 169 ;   Production Value: "GPCS"
 170 
 171 ;;;;;;;;;;;;;;;;;;;;
 172 ; php.ini Options  ;
 173 ;;;;;;;;;;;;;;;;;;;;
 174 ; Name for user-defined php.ini (.htaccess) files. Default is ".user.ini"
 175 ;user_ini.filename = ".user.ini"

php.ini选项
设置用户自定义的配置文件名，默认的命名为.user.ini，
user_ini.filename = ".user.ini"

 176 
 177 ; To disable this feature set this option to empty value
 178 ;user_ini.filename =

----------

为了禁止这个特性，需要将选项值设置为空，如
user_ini.filename =

----------

 179 
 180 ; TTL for user-defined php.ini files (time-to-live) in seconds. Default is 300 seconds (5 minutes)
 181 ;user_ini.cache_ttl = 300

----------

TTL是用来设置用户自定义的文件的存在周期，默认的为300秒，设置如
user_ini.cache_ttl = 300

----------

 182 
 183 ;;;;;;;;;;;;;;;;;;;;
 184 ; Language Options ;
 185 ;;;;;;;;;;;;;;;;;;;;
语言选项
 186 
 187 ; Enable the PHP scripting language engine under Apache.
 188 ; http://php.net/engine
 189 engine = On

----------

在apache引擎下开启PHP脚本语言，参考http://php.net/engine，设置如：
engine = On

----------

 190 
 191 ; This directive determines whether or not PHP will recognize code between
 192 ; <? and ?> tags as PHP source which should be processed as such. It is
 193 ; generally recommended that <?php and ?> should be used and that this feature
 194 ; should be disabled, as enabling it may result in issues when generating XML
 195 ; documents, however this remains supported for backward compatibility reasons.
 196 ; Note that this directive does not control the <?= shorthand tag, which can be
 197 ; used regardless of this directive.
 198 ; Default Value: On
 199 ; Development Value: Off
 200 ; Production Value: Off
 201 ; http://php.net/short-open-tag
 202 short_open_tag = Off

----------

这个指令决定是否将<? 和 ?>标签之间的代码识别为PHP代码来执行，通常建议<?php 和 ?>标签应该被使用，因此那个功能（即将<?和?>识别为php标识符）应该被禁止。开启这个功能可能在生成xml文档时导致问题产生。然而因为后向兼容的原因这仍然被支持。注意：这条指令不包含<?=短标签，无论这个指令怎么设置<?=都可以使用（但我试了却不能使用）

----------

 203 
 204 ; The number of significant digits displayed in floating point numbers.
 205 ; http://php.net/precision
 206 precision = 14

----------

这个数字指定了浮点数最多显示的数字个数，参考http://php.net/precision
precision = 14 表明当表示浮点数时最多显示14个数字

----------

 207 
 208 ; Output buffering is a mechanism for controlling how much output data
 209 ; (excluding headers and cookies) PHP should keep internally before pushing that
 210 ; data to the client. If your application's output exceeds this setting, PHP
 211 ; will send that data in chunks of roughly the size you specify.
 212 ; Turning on this setting and managing its maximum buffer size can yield some
 213 ; interesting side-effects depending on your application and web server.
 214 ; You may be able to send headers and cookies after you've already sent output
 215 ; through print or echo. You also may see performance benefits if your server is
 216 ; emitting less packets due to buffered output versus PHP streaming the output
 217 ; as it gets it. On production servers, 4096 bytes is a good setting for performance
 218 ; reasons.
 219 ; Note: Output buffering can also be controlled via Output Buffering Control
 220 ;   functions.
 221 ; Possible Values:
 222 ;   On = Enabled and buffer is unlimited. (Use with caution)
 223 ;   Off = Disabled
 224 ;   Integer = Enables the buffer and sets its maximum size in bytes.
 225 ; Note: This directive is hardcoded to Off for the CLI SAPI
 226 ; Default Value: Off
 227 ; Development Value: 4096
 228 ; Production Value: 4096
 229 ; http://php.net/output-buffering
 230 output_buffering = 4096

----------

输出缓存机制是为了控制在将数据发送到客户端之前PHP应该在内部保存多少内容（不包括headers和cookies），如果你的应用输出超过了这个设置，PHP将会大致按照你指定的大小分块发送数据。开启这个配置并设置缓存的大小会产生一些有趣的副作用，这依赖于应用和服务器。设置了输出缓存你也许能够通过print和echo在发送完数据之后发送headers和cookies，你也可以在服务器仅发送了少量数据时看到这个设置的优势地方，因为在PHP输出数据时输出缓冲将那个内容截获了。
在生产服务器上，4096比特是一个因为性能原因的一个较好的配置。
注意：输出缓冲也可以通过输出缓冲函数来控制，可能的配置值为：
On代表开启缓冲输出，并且缓存大小无限制
Off代表禁用输出缓存
Integer 设置为数字代表开启输出缓存并且设置它的最大值（单位为byte）。
注意：这条指令the CLI SAPI被硬编码为Off
默认值：Off
Development Value: 4096
Production Value: 4096
http://php.net/output-buffering
output_buffering = 4096

----------

 231 
 232 ; You can redirect all of the output of your scripts to a function.  For
 233 ; example, if you set output_handler to "mb_output_handler", character
 234 ; encoding will be transparently converted to the specified encoding.
 235 ; Setting any output handler automatically turns on output buffering.
 236 ; Note: People who wrote portable scripts should not depend on this ini
 237 ;   directive. Instead, explicitly set the output handler using ob_start().
 238 ;   Using this ini directive may cause problems unless you know what script
 239 ;   is doing.
 240 ; Note: You cannot use both "mb_output_handler" with "ob_iconv_handler"
 241 ;   and you cannot use both "ob_gzhandler" and "zlib.output_compression".
 242 ; Note: output_handler must be empty if this is set 'On' !!!!
 243 ;   Instead you must use zlib.output_handler.
 244 ; http://php.net/output-handler
 245 ;output_handler =

----------

你可以重定向你的脚本的所有的输出到一个函数。例如，如果你设置了output_handler为mb_output_handler，字符编码将会被自动转换为指定的编码，如果设置了output handler，则自动开启output buffering。注意：书写可移植的脚本的开发人员不能依赖于这条指令。相反，应该显示的使用ob_start()来设置output handler。使用这条ini配置指令可能会导致一些问题除非你确切的知道脚本正在执行什么。
注意：你不能同时使用mb_output_handler和ob_iconv_handler；你也不能同时使用ob_gzhandler和zlib.output_compression。注意：如果开启这条指令，那么output_handler必须被设置为空，相反你必须使用zlib.output_handler，参考：http://php.net/output-handler
output_handler =

----------

 246 
 247 ; Transparent output compression using the zlib library
 248 ; Valid values for this option are 'off', 'on', or a specific buffer size
 249 ; to be used for compression (default is 4KB)
 250 ; Note: Resulting chunk size may vary due to nature of compression. PHP
 251 ;   outputs chunks that are few hundreds bytes each as a result of
 252 ;   compression. If you prefer a larger chunk size for better
 253 ;   performance, enable output_buffering in addition.
 254 ; Note: You need to use zlib.output_handler instead of the standard
 255 ;   output_handler, or otherwise the output will be corrupted.
 256 ; http://php.net/zlib.output-compression
 257 zlib.output_compression = Off

----------

显示的输出压缩使用的是zlib库，这个选项的有效的值是off和on或者一个指定被用来压缩的缓冲大小（默认为4kb），
注意： Resulting chunk的大小与实际的压缩有关，作为压缩的每一个PHP输出chunks为几百byte
如果你为了追求性能偏好一个更大的chunk大小的话，要额外开启output_buffering
注意：你需要使用zlib.output_handler而不是标准的output_handler，否则输出将会被破坏，参考http://php.net/zlib.output-compression
zlib.output_compression = Off

----------

 258 
 259 ; http://php.net/zlib.output-compression-level
 260 ;zlib.output_compression_level = -1
参考：http://php.net/zlib.output-compression-level
zlib.output_compression_level = -1
 261 
 262 ; You cannot specify additional output handlers if zlib.output_compression
 263 ; is activated here. This setting does the same as output_handler but in
 264 ; a different order.
 265 ; http://php.net/zlib.output-handler
 266 ;zlib.output_handler =

----------

如果开启zlib.output_compression，你不能指定其他的output handlers。这个配置与output_handler的功能形同，除了以一种不同的顺序/命令

----------

 267 
 268 ; Implicit flush tells PHP to tell the output layer to flush itself
 269 ; automatically after every output block.  This is equivalent to calling the
 270 ; PHP function flush() after each and every call to print() or echo() and each
 271 ; and every HTML block.  Turning this option on has serious performance
 272 ; implications and is generally recommended for debugging purposes only.
 273 ; http://php.net/implicit-flush
 274 ; Note: This directive is hardcoded to On for the CLI SAPI
 275 implicit_flush = Off

----------

内含的flush使得PHP告诉输出层以便在每次输出块后自动地flush他自己。这相当于在每一次调用print() 或者echo()和HTML块后调用PHP的内置函数flush(),开启这个配置有严重的性能影响并且推荐仅仅在为了debugging开启，参考：http://php.net/implicit-flush
注意：在the CLI SAPI情况下这条指令被硬编码为开启
implicit_flush = Off

----------

 276 
 277 ; The unserialize callback function will be called (with the undefined class'
 278 ; name as parameter), if the unserializer finds an undefined class
 279 ; which should be instantiated. A warning appears if the specified function is
 280 ; not defined, or if the function doesn't include/implement the missing class.
 281 ; So only set this entry, if you really want to implement such a
 282 ; callback-function.
 283 unserialize_callback_func =

----------

如果反序列化器发现一个对象实例化一个未定义的类，反序列化回调函数将会被调用，并将未定义的类名作为参数。如果这个特定的回调函数没有被定义或者函数没有将未定义的类include，将在浏览器中出现警告。因此，如果你真的想执行那样一个回调函数仅需要设置此项。
unserialize_callback_func =

----------

 284 
 285 ; When floats & doubles are serialized store serialize_precision significant
 286 ; digits after the floating point. The default value ensures that when floats
 287 ; are decoded with unserialize, the data will remain the same.
 288 ; The value is also used for json_encode when encoding double values.
 289 ; If -1 is used, then dtoa mode 0 is used which automatically select the best
 290 ; precision.
 291 serialize_precision = -1

----------

当floats和doubles数被序列化存储，serialize_precision指明了在小数点后的数字个数。默认值保证当存储的floats值被反序列化时数字前后数字能够一致。当编码double values数据时这个值也可以用于json_encode()
如果设置为-1，那么dtoa mode 0被使用，这将自动地选择最精确地方法
serialize_precision = -1

----------

 292 
 293 ; open_basedir, if set, limits all file operations to the defined directory
 294 ; and below.  This directive makes most sense if used in a per-directory
 295 ; or per-virtualhost web server configuration file.
 296 ; http://php.net/open-basedir
 297 ;open_basedir =

----------

如果设置了open_basedir，那么就将所有的文件操作都限制在了指定的目录及之下。如果在一个单一目录或者单一虚拟主机网路服务器下，这条指令会产生很大的作用效果----其实就是限制了操作文件的空间，除了指定的文件目录及之下目录之外都不能操作，以免产生安全问题
open_basedir =
说明：用open_basedir指定的限制实际上是前缀，不是目录名。也就是说"/dir/incl"将允许访问"/dir/include"和"/dir/incls"，如果您希望将访问控制在一个指定的目录，那么请在结尾加上一个斜线，例如："/dir/incl/"。默认是允许打开所有文件。

----------

 298 
 299 ; This directive allows you to disable certain functions for security reasons.
 300 ; It receives a comma-delimited list of function names.
 301 ; http://php.net/disable-functions
 302 disable_functions =

----------

这条指令允许你处于一些安全的考虑禁用某些特定的函数。这条指令需要一个逗号分隔的函数名的list,参考：http://php.net/disable-functions，（译注：如禁用print_r,注意：echo是语法结构，不能禁用）
disable_functions ='print_r'

----------

 303 
 304 ; This directive allows you to disable certain classes for security reasons.
 305 ; It receives a comma-delimited list of class names.
 306 ; http://php.net/disable-classes
 307 disable_classes =

----------

与上面类似，禁用类

----------

 308 
 309 ; Colors for Syntax Highlighting mode.  Anything that's acceptable in
 310 ; <span style="color: ???????"> would work.
 311 ; http://php.net/syntax-highlighting
 312 ;highlight.string  = #DD0000
 313 ;highlight.comment = #FF9900
 314 ;highlight.keyword = #007700
 315 ;highlight.default = #0000BB
 316 ;highlight.html    = #000000

----------

语法高亮模式的颜色设置。任何能够用于span标签style属性颜色值都能够用在这里，参考：http://php.net/syntax-highlighting
highlight.string  = #DD0000
highlight.comment = #FF9900
highlight.keyword = #007700
highlight.default = #0000BB
highlight.html    = #000000

----------

 317 
 318 ; If enabled, the request will be allowed to complete even if the user aborts
 319 ; the request. Consider enabling it if executing long requests, which may end up
 320 ; being interrupted by the user or a browser timing out. PHP's default behavior
 321 ; is to disable this feature.
 322 ; http://php.net/ignore-user-abort
 323 ;ignore_user_abort = On

----------

如果该配置项被开启，则即使用户取消了请求，请求将被允许完成。考虑如果执行长请求，这个请求可能被用户取消而打断或者因为超过了浏览器运行时间而被打断，因此开启它。PHP的默认的行为禁用了这个特性，参考：http://php.net/ignore-user-abort
ignore_user_abort = On

----------

 324 
 325 ; Determines the size of the realpath cache to be used by PHP. This value should
 326 ; be increased on systems where PHP opens many files to reflect the quantity of
 327 ; the file operations performed.
 328 ; http://php.net/realpath-cache-size
 329 ;realpath_cache_size = 16k

----------

该配置项决定了被PHP使用的存储绝对路径的缓存大小。当在系统中PHP打开许多文件影响到文件操作的性能时这个值应该增加。参考：http://php.net/realpath-cache-size
realpath_cache_size = 16k
PHP除了操作相对路径外也会操作绝对路径，如果开启了这个缓存，那么PHP就会非常迅速的操作之前操作过的文件。

----------

 330 
 331 ; Duration of time, in seconds for which to cache realpath information for a given
 332 ; file or directory. For systems with rarely changing files, consider increasing this
 333 ; value.
 334 ; http://php.net/realpath-cache-ttl
 335 ;realpath_cache_ttl = 120

这一配置项是执行cache realpath information在缓存中存储的有效期，如果系统很少改动文件则可以考虑增加这个值，参考：http://php.net/realpath-cache-ttl
realpath_cache_ttl = 120

 336 
 337 ; Enables or disables the circular reference collector.
 338 ; http://php.net/zend.enable-gc
 339 zend.enable_gc = On

开启或者关闭循环垃圾收集机制，参考：http://php.net/zend.enable-gc
zend.enable_gc = On，为开启状态

 340 
 341 ; If enabled, scripts may be written in encodings that are incompatible with
 342 ; the scanner.  CP936, Big5, CP949 and Shift_JIS are the examples of such
 343 ; encodings.  To use this feature, mbstring extension must be enabled.
 344 ; Default: Off
 345 ;zend.multibyte = Off

如果开启这个配置项，脚本可以被与scanner不兼容的书写方式编码，这类编码的例子如CP936, Big5, CP949 and Shift_JIS 。为了使用这一特性，必须开启mbstring扩展，该项默认为关闭状态
zend.multibyte = Off

 346 
 347 ; Allows to set the default encoding for the scripts.  This value will be used
 348 ; unless "declare(encoding=...)" directive appears at the top of the script.
 349 ; Only affects if zend.multibyte is set.
 350 ; Default: ""
 351 ;zend.script_encoding =

这一个配置型允许设置脚本的默认编码。除非在脚本开头使用了declare(encoding=...)声明，否则开启该选项后该配置值被使用。这一配置项只有在设置了zend.multibyte值时才会起作用，默认值为空
zend.script_encoding =

 352 
 353 ;;;;;;;;;;;;;;;;;
 354 ; Miscellaneous ;
 355 ;;;;;;;;;;;;;;;;;
 356 
 357 ; Decides whether PHP may expose the fact that it is installed on the server
 358 ; (e.g. by adding its signature to the Web server header).  It is no security
 359 ; threat in any way, but it makes it possible to determine whether you use PHP
 360 ; on your server or not.
 361 ; http://php.net/expose-php
 362 expose_php = On

混杂的/各种各样的/复杂对门的
鉴于PHP被安装在服务器上的事实，几乎没有安全威胁。但是，这使得你能够决定是否在服务器上使用PHP，参考：http://php.net/expose-php
expose_php = On，默认开启
说明：
我们经常会在一个http头里发现这样的信息：
X-Powered-By:PHP/5.2.11
PHP的版本号暴露无疑，攻击者很容易捕获到此信息，要想解决此问题我们只要设置此项为Off

 363 
 364 ;;;;;;;;;;;;;;;;;;;
 365 ; Resource Limits ;
 366 ;;;;;;;;;;;;;;;;;;;
 367 
 368 ; Maximum execution time of each script, in seconds
 369 ; http://php.net/max-execution-time
 370 ; Note: This directive is hardcoded to 0 for the CLI SAPI
 371 max_execution_time = 30
 372 
 373 ; Maximum amount of time each script may spend parsing request data. It's a good
 374 ; idea to limit this time on productions servers in order to eliminate unexpectedly
 375 ; long running scripts.
 376 ; Note: This directive is hardcoded to -1 for the CLI SAPI
 377 ; Default Value: -1 (Unlimited)
 378 ; Development Value: 60 (60 seconds)
 379 ; Production Value: 60 (60 seconds)
 380 ; http://php.net/max-input-time
 381 max_input_time = 60
 382 
 383 ; Maximum input variable nesting level
 384 ; http://php.net/max-input-nesting-level
 385 ;max_input_nesting_level = 64
 386 
 387 ; How many GET/POST/COOKIE input variables may be accepted
 388 ; max_input_vars = 1000
 389 
 390 ; Maximum amount of memory a script may consume (128MB)
 391 ; http://php.net/memory-limit
 392 memory_limit = 128M

----------

资源控制
每一个脚本的最大执行时间，以秒为单位，参考：http://php.net/max-execution-time，注意：在CLI SAPI情况下这一指令被硬编码为0
max_execution_time = 30

每一个脚本解析请求数据最大消耗时间。为了在生产服务器上排除不可预期的长时间运行脚本，最好限制此时间值。
注意：在CLI SAPI情况下这条指令被硬编码为-1
Default Value: -1 (Unlimited)
Development Value: 60 (60 seconds)
Production Value: 60 (60 seconds)
http://php.net/max-input-time
max_input_time = 60

最大输入变量嵌套层级，参考：http://php.net/max-input-nesting-level
max_input_nesting_level = 64

可以接受多少的GET/POST/COOKIE输入变量
max_input_vars = 1000

一个脚本可能消耗的最大内存，参考：http://php.net/memory-limit
memory_limit = 128M
说明： 设定一个脚本所能够申请到的最大内存字节数。
这有助于防止劣质脚本消耗完服务器上的所有内存。
要使用此指令必须在编译的时候激活。
因此 configure 一行中应该包括：--enable-memory-limit
如果不需要任何内存上的限制，必须将其设为 -1
自php4.3.2 起，当设置了memory_limit后，memory_get_usage()函数将变为可用

----------

 393 
 394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 395 ; Error handling and logging ;
 396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 397 
 398 ; This directive informs PHP of which errors, warnings and notices you would like
 399 ; it to take action for. The recommended way of setting values for this
 400 ; directive is through the use of the error level constants and bitwise
 401 ; operators. The error level constants are below here for convenience as well as
 402 ; some common settings and their meanings.
 403 ; By default, PHP is set to take action on all errors, notices and warnings EXCEPT
 404 ; those related to E_NOTICE and E_STRICT, which together cover best practices and
 405 ; recommended coding standards in PHP. For performance reasons, this is the
 406 ; recommend error reporting setting. Your production server shouldn't be wasting
 407 ; resources complaining about best practices and coding standards. That's what
 408 ; development servers and development settings are for.
 409 ; Note: The php.ini-development file has this setting as E_ALL. This
 410 ; means it pretty much reports everything which is exactly what you want during
 411 ; development and early testing.

----------

错误处理和日志
这条指令使得你告诉PHP哪些错误、警告、注意需要采取适当的处理。建议通过使用错误等级常量和按位操作符为这条指令设置值。下面给出了错误等级常量，为了方便还给出了通常的设置方式和他们的含义。默认情况下，PHP会对所有的错误、警告和注意采取适当的操作，除了那些与E_NOTICE和E_STRICT相关的。这些配置使得PHP表现良好并且建议使用PHP进行标准的编辑。为了性能的原因，这是推荐的错误报告配置，你的生产情况下服务器不应该在好的做法和标准的编码方面浪费资源。那是开发阶段服务器和开发阶段配置需要做的事情。
注意：php.ini开发版文件将此项设置为E_ALL。这意味着它非常好的和多的报道了所有在开发和测试阶段你想要的东西。

----------

 412 ;
 413 ; Error Level Constants:
 414 ; E_ALL             - All errors and warnings (includes E_STRICT as of PHP 5.4.0)
 415 ; E_ERROR           - fatal run-time errors
 416 ; E_RECOVERABLE_ERROR  - almost fatal run-time errors
 417 ; E_WARNING         - run-time warnings (non-fatal errors)
 418 ; E_PARSE           - compile-time parse errors
 419 ; E_NOTICE          - run-time notices (these are warnings which often result
 420 ;                     from a bug in your code, but it's possible that it was
 421 ;                     intentional (e.g., using an uninitialized variable and
 422 ;                     relying on the fact it is automatically initialized to an
 423 ;                     empty string)
 424 ; E_STRICT          - run-time notices, enable to have PHP suggest changes
 425 ;                     to your code which will ensure the best interoperability
 426 ;                     and forward compatibility of your code
 427 ; E_CORE_ERROR      - fatal errors that occur during PHP's initial startup
 428 ; E_CORE_WARNING    - warnings (non-fatal errors) that occur during PHP's
 429 ;                     initial startup
 430 ; E_COMPILE_ERROR   - fatal compile-time errors
 431 ; E_COMPILE_WARNING - compile-time warnings (non-fatal errors)
 432 ; E_USER_ERROR      - user-generated error message
 433 ; E_USER_WARNING    - user-generated warning message
 434 ; E_USER_NOTICE     - user-generated notice message
 435 ; E_DEPRECATED      - warn about code that will not work in future versions
 436 ;                     of PHP
 437 ; E_USER_DEPRECATED - user-generated deprecation warnings

错误等级常量
E_ALL             - 所有错误和警告 (includes E_STRICT as of PHP 5.4.0)
E_ERROR           - 致命的运行阶段错误
E_RECOVERABLE_ERROR  - 几乎执行的运行阶段错误
E_WARNING         - 运行阶段警告 (non-fatal errors)
E_PARSE           - 编译阶段 解析错误
E_NOTICE          - 运行阶段notes,这些也是警告，通常是源自于代码的bug，但是他可能是故意的，例如使用了未经初始化的变量以为这样会自动初始化为一个空字符串，而PHP实际并不会自动初始化
E_STRICT          - 编码标准化警告, 可以获得PHP更改建议，这将能够保证好的交互性和代码的兼容性
E_CORE_ERROR      - 在PHP启动时初始化阶段产生的致命作物
E_CORE_WARNING    - 在PHP启动时初始化阶段产生警告而非致命错误
E_COMPILE_ERROR   - 致命的编译错误
E_COMPILE_WARNING - 编译阶段产生的警告而非致命错误
E_USER_ERROR      - 用户自己生成的错误信息
E_USER_WARNING    - 用户自己生成的警告信息
E_USER_NOTICE     - 用户自己生成的注意信息
E_DEPRECATED      - 警告这已经被未来的PHP版本放弃
E_USER_DEPRECATED - 用户自定义的PHP放弃警告

 438 ;
 439 ; Common Values:
 440 ;   E_ALL (Show all errors, warnings and notices including coding standards.)
 441 ;   E_ALL & ~E_NOTICE  (Show all errors, except for notices)
 442 ;   E_ALL & ~E_NOTICE & ~E_STRICT  (Show all errors, except for notices and coding standards warnings.)
 443 ;   E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR  (Show only errors)
 444 ; Default Value: E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED
 445 ; Development Value: E_ALL
 446 ; Production Value: E_ALL & ~E_DEPRECATED & ~E_STRICT
 447 ; http://php.net/error-reporting
 448 error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT

一般的值
E_ALL (显示所有得errors, warnings and notices，包括不标准的代码)
E_ALL & ~E_NOTICE  (除了notice显示所有错误警告)
E_ALL & ~E_NOTICE & ~E_STRICT  (除了notice和标准编码警告外显示所有的错误)
E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR  (只显示错误)
默认值为：E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED
开发阶段值：E_ALL
生产阶段值：E_ALL & ~E_DEPRECATED & ~E_STRICT
参考：http://php.net/error-reporting
error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT，这个是当前设置
说明：当前的配置为报告所有的错误除了函数被放弃和编码标准化错误。

 449 
 450 ; This directive controls whether or not and where PHP will output errors,
 451 ; notices and warnings too. Error output is very useful during development, but
 452 ; it could be very dangerous in production environments. Depending on the code
 453 ; which is triggering the error, sensitive information could potentially leak
 454 ; out of your application such as database usernames and passwords or worse.
 455 ; For production environments, we recommend logging errors rather than
 456 ; sending them to STDOUT.
 457 ; Possible Values:
 458 ;   Off = Do not display any errors
 459 ;   stderr = Display errors to STDERR (affects only CGI/CLI binaries!)
 460 ;   On or stdout = Display errors to STDOUT
 461 ; Default Value: On
 462 ; Development Value: On
 463 ; Production Value: Off
 464 ; http://php.net/display-errors
 465 display_errors = Off

----------

这条指令控制PHP是否以及在哪里输出错误、notice/warning信息。在开发阶段输出错误非常有用，但是在生产环境输出错误信息则非常危险。这依赖于产生错误的代码，某些敏感信息可能会潜在的泄露到你的应用，如数据库用户名和密码或者更糟糕。在生产环境下，我们建议日志记录错误信息而不是将他们标准输出：
可能的值：
Off = 不显示任何错误信息
stderr = 将错误显示到终端/文件 (仅仅影响CGI/CLI 文件!)
On or stdout = 输出错误信息到标准输出设备
 461 ; Default Value: On
 462 ; Development Value: On
 463 ; Production Value: Off
 464 ; http://php.net/display-errors
 465 display_errors = Off
默认值是开启的，即为On,开发环境下值为On,生产环境下值为Off,参考：http://php.net/display-errors，display_errors = Off，这是此配置的设置

----------

 466 
 467 ; The display of errors which occur during PHP's startup sequence are handled
 468 ; separately from display_errors. PHP's default behavior is to suppress those
 469 ; errors from clients. Turning the display of startup errors on can be useful in
 470 ; debugging configuration problems. We strongly recommend you
 471 ; set this to 'off' for production servers.
 472 ; Default Value: Off
 473 ; Development Value: On
 474 ; Production Value: Off
 475 ; http://php.net/display-startup-errors
 476 display_startup_errors = Off

----------

显示错误信息发生在PHP的运行队列开始运行时。PHP的默认行为是抑制来自客户端浏览器的错误。开启显示错误配置在debug环境下非常的有用，我们强烈建议你在生产阶段关闭此配置
默认值为：Off,开发阶段值为On,生产阶段值为Off,参考：http://php.net/display-startup-errors，这里配置为
display_startup_errors = Off
说明：这条指令是控制是否显示PHP启动时的错误的。

----------

 477 
 478 ; Besides displaying errors, PHP can also log errors to locations such as a
 479 ; server-specific log, STDERR, or a location specified by the error_log
 480 ; directive found below. While errors should not be displayed on productions
 481 ; servers they should still be monitored and logging is a great way to do that.
 482 ; Default Value: Off
 483 ; Development Value: On
 484 ; Production Value: On
 485 ; http://php.net/log-errors
 486 log_errors = On

----------

除了显示错误，PHP也能够将错误记录到指定的服务器日志文件里、标准文件或者下面error_log指令可以找到的路径。尽管在生产环境下错误不应该显示，但是服务器应该仍然能够监视并记录错误
默认值为Off,开发环境下的值为Off,生产环境下的值为On,参考：http://php.net/log-errors，这里配置为：log_errors = On

----------

 487 
 488 ; Set maximum length of log_errors. In error_log information about the source is
 489 ; added. The default is 1024 and 0 allows to not apply any maximum length at all.
 490 ; http://php.net/log-errors-max-len
 491 log_errors_max_len = 1024

----------

设置记录错误的最大长度。在错误日志信息中加入此项，默认的是1024，0表示不限制大小。参考：http://php.net/log-errors-max-len，这里的配置是
log_errors_max_len = 1024

----------

 492 
 493 ; Do not log repeated messages. Repeated errors must occur in same file on same
 494 ; line unless ignore_repeated_source is set true.
 495 ; http://php.net/ignore-repeated-errors
 496 ignore_repeated_errors = Off

----------

不要记录重复的信息。记录重复的错误信息指的是在同一文件的同一行发生的错误除非将此配置项设置为true。参考：http://php.net/ignore-repeated-errors，这里的配置为ignore_repeated_errors = Off

----------

 497 
 498 ; Ignore source of message when ignoring repeated messages. When this setting
 499 ; is On you will not log errors with repeated messages from different files or
 500 ; source lines.
 501 ; http://php.net/ignore-repeated-source
 502 ignore_repeated_source = Off

----------

当忽略了重复信息的同时忽略信息的源。当这个配置被开启，将不会记录不同的文件或不同行产生的重复信息，参考：http://php.net/ignore-repeated-source，这里的配置为ignore_repeated_source = Off

----------

 503 
 504 ; If this parameter is set to Off, then memory leaks will not be shown (on
 505 ; stdout or in the log). This has only effect in a debug compile, and if
 506 ; error reporting includes E_WARNING in the allowed list
 507 ; http://php.net/report-memleaks
 508 report_memleaks = On

----------

如果这里的配置设置为Off,那么内存泄露将不会显示在标准输出终端或者日志中。只有在debug编译下以及设置了error reporting includes E_WARNING情况下此配置项才会起作用，参考：http://php.net/report-memleaks，这里的配置为report_memleaks = On
说明：这个参数只在调试编译中起作用，并且必须在错误报告中包含 E_WARNING
----------

 509 
 510 ; This setting is on by default.
 511 ;report_zend_debug = 0

----------

默认的这项配置开启了，report_zend_debug = 0这个被注释了则是开启

----------

 512 
 513 ; Store the last error/warning message in $php_errormsg (boolean). Setting this value
 514 ; to On can assist in debugging and is appropriate for development servers. It should
 515 ; however be disabled on production servers.
 516 ; Default Value: Off
 517 ; Development Value: On
 518 ; Production Value: Off
 519 ; http://php.net/track-errors
 520 track_errors = Off

----------

在$php_errormsg中存储最后的错误和警告信息。开启这个配置项在debug和开发环境下有帮助。在生产环境下应该关闭
默认值为Off,开发环境下为Off，生产环境下为On,参考：http://php.net/track-errors，这里的配置为track_errors = Off

----------

 521 
 522 ; Turn off normal error reporting and emit XML-RPC error XML
 523 ; http://php.net/xmlrpc-errors
 524 ;xmlrpc_errors = 0

----------

关闭正常的错误报告，输出XML-RPC错误，参考：http://php.net/xmlrpc-errors，这里的配置是xmlrpc_errors = 0

----------

 525 
 526 ; An XML-RPC faultCode
 527 ;xmlrpc_error_number = 0

----------

一个XML-RPC故障代码
xmlrpc_error_number = 0

----------

 528 
 529 ; When PHP displays or logs an error, it has the capability of formatting the
 530 ; error message as HTML for easier reading. This directive controls whether
 531 ; the error message is formatted as HTML or not.
 532 ; Note: This directive is hardcoded to Off for the CLI SAPI
 533 ; Default Value: On
 534 ; Development Value: On
 535 ; Production value: On
 536 ; http://php.net/html-errors
 537 html_errors = On

----------

当PHP显示或者将一个错误计入了日志，它就有能力以html的格式来格式化错误信息以便于阅读。纸条指令控制错误信息是否以html格式来组织。注意：在CLI SAPI情况下这条指令被硬编码为Off。
默认值为On,开发环境下为On,生产环境下为On,参考：http://php.net/html-errors，
这配置为：html_errors = On
说明：这条指令是为了控制当错误出生时渲染错误页面，如果设置为Off，则错误信息在html页面上不会有任何样式。
----------

 538 
 539 ; If html_errors is set to On *and* docref_root is not empty, then PHP
 540 ; produces clickable error messages that direct to a page describing the error
 541 ; or function causing the error in detail.
 542 ; You can download a copy of the PHP manual from http://php.net/docs
 543 ; and change docref_root to the base URL of your local copy including the
 544 ; leading '/'. You must also specify the file extension being used including
 545 ; the dot. PHP's default behavior is to leave these settings empty, in which
 546 ; case no links to documentation are generated.
 547 ; Note: Never use this feature for production boxes.
 548 ; http://php.net/docref-root
 549 ; Examples
 550 ;docref_root = "/phpmanual/"
 551 
 552 ; http://php.net/docref-ext
 553 ;docref_ext = .html

----------

如果html_errors设置为On并且docref_root不为空，那么PHP产生出一个可以点击的错误信息用于点击后直接跳转到一个详细描述此错误或者导致此错误的函数的页面。你可以下载一份PHP手册的副本从http://php.net/docs，然后改变docref_root为你本地副本的基本url（包含最后的/）。你还必须指定特定的文件扩展名（包含.）。PHP的默认将这些值设置为空值，因此没有产生连接到文档的链接。
注意：在生产环境下不要使用此特性。
示例：docref_root = "/phpmanual/"，（参考：http://php.net/docref-ext）docref_ext = .html

----------

 554 
 555 ; String to output before an error message. PHP's default behavior is to leave
 556 ; this setting blank.
 557 ; http://php.net/error-prepend-string
 558 ; Example:
 559 ;error_prepend_string = "<span style='color: #ff0000'>"

----------

在错误信息输出之前输出这里配置的字符串，PHP默认此配置项为空。参考：http://php.net/error-prepend-string
示例：error_prepend_string = "<span style='color: #ff0000'>"

----------

 560 
 561 ; String to output after an error message. PHP's default behavior is to leave
 562 ; this setting blank.
 563 ; http://php.net/error-append-string
 564 ; Example:
 565 ;error_append_string = "</span>"

----------

在错误信息输出之后输出这里配置的字符串，PHP默认此配置项为空。参考：http://php.net/error-prepend-string
示例：error_append_string = "</span>"

----------

 566 
 567 ; Log errors to specified file. PHP's default behavior is to leave this value
 568 ; empty.
 569 ; http://php.net/error-log
 570 ; Example:
 571 ;error_log = php_errors.log
 572 ; Log errors to syslog (Event Log on Windows).
 573 ;error_log = syslog

----------

记录错误信息到指定的文件。PHP默认此配置项为空，参考：http://php.net/error-log
示例：error_log = php_errors.log
记录错误信息到syslog (Event Log on Windows)，这样配置error_log = syslog

----------

 574 
 575 ;windows.show_crt_warning
 576 ; Default value: 0
 577 ; Development value: 0
 578 ; Production value: 0

----------

windows显示crt_warning警告，默认值为0，开发环境下为0，生产环境下为0

----------

 579 
 580 ;;;;;;;;;;;;;;;;;
 581 ; Data Handling ;
 582 ;;;;;;;;;;;;;;;;;
 583 
 584 ; The separator used in PHP generated URLs to separate arguments.
 585 ; PHP's default setting is "&".
 586 ; http://php.net/arg-separator.output
 587 ; Example:
 588 ;arg_separator.output = "&amp;"，

----------

数据处理
在PHP中使用的分离器用于分离参数以分离URL地址。PHP的默认设置为&符号。参考：http://php.net/arg-separator.output，例如：arg_separator.output = "&amp;"这里的&amp;为html实体

----------

 589 
 590 ; List of separator(s) used by PHP to parse input URLs into variables.
 591 ; PHP's default setting is "&".
 592 ; NOTE: Every character in this directive is considered as separator!
 593 ; http://php.net/arg-separator.input
 594 ; Example:
 595 ;arg_separator.input = ";&"

----------

这个配置是被PHP使用的解析输入的url地址参数的分离器列表。PHP的默认设置为&。注意：这条指令的每个字符都被当做分离器。参考：http://php.net/arg-separator.input，示例：arg_separator.input = ";&"

----------

 596 
 597 ; This directive determines which super global arrays are registered when PHP
 598 ; starts up. G,P,C,E & S are abbreviations for the following respective super
 599 ; globals: GET, POST, COOKIE, ENV and SERVER. There is a performance penalty
 600 ; paid for the registration of these arrays and because ENV is not as commonly
 601 ; used as the others, ENV is not recommended on productions servers. You
 602 ; can still get access to the environment variables through getenv() should you
 603 ; need to.
 604 ; Default Value: "EGPCS"
 605 ; Development Value: "GPCS"
 606 ; Production Value: "GPCS";
 607 ; http://php.net/variables-order
 608 variables_order = "GPCS"

----------

这条指令决定当PHP启动时哪些全局数组被注册。G,P,C,E & S是下面相关全局数组的缩写：GET, POST, COOKIE, ENV and SERVER。为了注册这些数组，PHP会存在一些性能上的损失，在生产环境下不推荐开启ENV。但是你仍然可以通过使用函数getenv()来连接使用环境变量。默认的值为"EGPCS"，开发环境下默认值为"GPCS"，生产环境下值为"GPCS"，参考：http://php.net/variables-order，这里的配置为variables_order = "GPCS"

----------

 609 
 610 ; This directive determines which super global data (G,P & C) should be
 611 ; registered into the super global array REQUEST. If so, it also determines
 612 ; the order in which that data is registered. The values for this directive
 613 ; are specified in the same manner as the variables_order directive,
 614 ; EXCEPT one. Leaving this value empty will cause PHP to use the value set
 615 ; in the variables_order directive. It does not mean it will leave the super
 616 ; globals array REQUEST empty.
 617 ; Default Value: None
 618 ; Development Value: "GP"
 619 ; Production Value: "GP"
 620 ; http://php.net/request-order
 621 request_order = "GP"

----------

这条指令决定哪些全局变量数据(G,P & C)应该被注册到全局数组REQUEST中。如果设置了的话，它也决定了数据被注册的顺序（即同名变量会保存后面的），从左到右新值会覆盖旧值。这条指令的值的含义与variables_order指令相同。将这条指令设置为空会导致PHP使用variables_order指令设置的值。它并不意味着将全局数组REQUEST设置为空。默认的值为none,开发环境下的值为GP，生产环境下的值为GP，参考：http://php.net/request-order，这里的配置为request_order = "GP"。

----------

 622 
 623 ; This directive determines whether PHP registers $argv & $argc each time it
 624 ; runs. $argv contains an array of all the arguments passed to PHP when a script
 625 ; is invoked. $argc contains an integer representing the number of arguments
 626 ; that were passed when the script was invoked. These arrays are extremely
 627 ; useful when running scripts from the command line. When this directive is
 628 ; enabled, registering these variables consumes CPU cycles and memory each time
 629 ; a script is executed. For performance reasons, this feature should be disabled
 630 ; on production servers.
 631 ; Note: This directive is hardcoded to On for the CLI SAPI
 632 ; Default Value: On
 633 ; Development Value: Off
 634 ; Production Value: Off
 635 ; http://php.net/register-argc-argv
 636 register_argc_argv = Off

----------

这条指令决定当PHP每次运行时是否注册$argv 和 $argc。$argv包括一个当脚本被调用时所有传递到PHP的参数的一个数组。$argc为一个当脚本被调用时传递到PHP的参数的个数的整数。当在命令行运行脚本时这些数组非常的有用。当这条指令被开启时，每一次脚本被执行时注册这些变量都要消耗CPU和内存。处于性能的原因，应该在生产环境下禁用这些特性。注意：在CLI SAPI情况下，这条指令被硬编码为On。默认值为On,开发环境下值为Off,生产环境下值为Off,参考：http://php.net/register-argc-argv。这里的配置值为register_argc_argv = Off

----------

 637 
 638 ; When enabled, the ENV, REQUEST and SERVER variables are created when they're
 639 ; first used (Just In Time) instead of when the script starts. If these
 640 ; variables are not used within a script, having this directive on will result
 641 ; in a performance gain. The PHP directive register_argc_argv must be disabled
 642 ; for this directive to have any affect.
 643 ; http://php.net/auto-globals-jit
 644 auto_globals_jit = On

----------

当这条指令被开启时，ENV, REQUEST and SERVER在第一次被使用时就被创建了而不是在脚本开始时。如果在一个脚本中这些变量没有被使用，开启这条指令将会导致性能增益。为了使得这条指令起作用必须禁用PHP的register_argc_argv指令。参考：http://php.net/auto-globals-jit。这里的配置为：auto_globals_jit = On。

----------

 645 
 646 ; Whether PHP will read the POST data.
 647 ; This option is enabled by default.
 648 ; Most likely, you won't want to disable this option globally. It causes $_POST
 649 ; and $_FILES to always be empty; the only way you will be able to read the
 650 ; POST data will be through the php://input stream wrapper. This can be useful
 651 ; to proxy requests or to process the POST data in a memory efficient fashion.
 652 ; http://php.net/enable-post-data-reading
 653 ;enable_post_data_reading = Off

----------

无论PHP是否读取POST数据，这个选项默认都是开启的。更可能的是，你不想整体的禁用这个选项。这会导致￥——POST和$_FILES总是为空。你可能读取$_POST数据的唯一途径是通过php://input流包装。在代理请求或者在内存中运行$_POST数据时非常有用。

----------

 654 
 655 ; Maximum size of POST data that PHP will accept.
 656 ; Its value may be 0 to disable the limit. It is ignored if POST data reading
 657 ; is disabled through enable_post_data_reading.
 658 ; http://php.net/post-max-size
 659 post_max_size = 8M

----------

这条指令规定PHP通过POST方式可接受的数据的最大大小。如果设置为0表示没有限制。如果通过enable_post_data_reading指令禁用了读取POST数据则会忽略这条指令。参考：http://php.net/post-max-siz，这里的配置为post_max_size = 8M。

----------

 660 
 661 ; Automatically add files before PHP document.
 662 ; http://php.net/auto-prepend-file
 663 auto_prepend_file =

----------

这条指令会在PHP文档之前自动添加文件，参考：http://php.net/auto-prepend-file。这里的配置为：auto_prepend_file =
说明：该函数就像调用了include函数一样被包含了进来
----------

 664 
 665 ; Automatically add files after PHP document.
 666 ; http://php.net/auto-append-file
 667 auto_append_file =

----------

这条指令会在PHP文档之后自动添加文件，参考：http://php.net/auto-prepend-file。这里的配置为：auto_prepend_file =
说明：该函数就像调用了include函数一样被包含了进来
----------

 668 
 669 ; By default, PHP will output a media type using the Content-Type header. To
 670 ; disable this, simply set it to be empty.
 671 ;
 672 ; PHP's built-in default media type is set to text/html.
 673 ; http://php.net/default-mimetype
 674 default_mimetype = "text/html"

----------

默认的，PHP能够通过制定头部Content-Type header来输出一个媒体类型的数据。为了禁用此项设置，只需简单的将此指令设置为空。
PHP内置的默认媒体类型被设置为text/html。参考：http://php.net/default-mimetype。这里的配置为：default_mimetype = "text/html"
说明： PHP总是默认地在"Content-type:"头中设置输出文档的MIME类型和字符集的编码方式。
要让输出字符集失效，只要设置为空或注释掉即可。
PHP的默认设置会输出"Content-Type: text/html"
若去掉"default_charset"前的注释并将其设为"gb2312"，
那么将会输出"Content-Type: text/html; charset=gb2312"
----------

 675 
 676 ; PHP's default character set is set to UTF-8.
 677 ; http://php.net/default-charset
 678 default_charset = "UTF-8"

----------

PHP默认的字符集被设置为UTF-8，参考： http://php.net/default-charset。这里的配置为default_charset = "UTF-8"。

----------

 679 
 680 ; PHP internal character encoding is set to empty.
 681 ; If empty, default_charset is used.
 682 ; http://php.net/internal-encoding
 683 ;internal_encoding =

----------

PHP内部的字符集encoding被设置为空，如果设置为空则默认的default_charset被使用，即使用上调指令的设置值。参考：http://php.net/internal-encoding。这里的配置为：internal_encoding =

----------

 684 
 685 ; PHP input character encoding is set to empty.
 686 ; If empty, default_charset is used.
 687 ; http://php.net/input-encoding
 688 ;input_encoding =

----------

PHP读输入数据的编码被设置为空，如果被设置为空则使用default_charset指定的字符集。参考：http://php.net/input-encoding。这里的配置为input_encoding =。

----------

 689 
 690 ; PHP output character encoding is set to empty.
 691 ; If empty, default_charset is used.
 692 ; mbstring or iconv output handler is used.
 693 ; See also output_buffer.
 694 ; http://php.net/output-encoding
 695 ;output_encoding =

----------

PHP输出数据的编码被设置为空，如果被设置为空则使用default_charset的设置值。mbstring 或者 iconv输出处理会被使用。查看输出缓冲。参考：http://php.net/output-encoding。这里的配置为output_encoding =。

----------

 696 
 697 ;;;;;;;;;;;;;;;;;;;;;;;;;
 698 ; Paths and Directories ;路径和目录
 699 ;;;;;;;;;;;;;;;;;;;;;;;;;
 700 
 701 ; UNIX: "/path1:/path2"
 702 ;include_path = ".:/php/includes"
 703 ;
 704 ; Windows: "\path1;\path2"
 705 ;include_path = ".;c:\php\includes"

----------

UNIX的格式为："/path1:/path2"，示例：include_path = ".:/php/includes"
Windows的格式为：Windows: "\path1;\path2"，示例：include_path = ".;c:\php\includes"

----------

 706 ;
 707 ; PHP's default setting for include_path is ".;/path/to/php/pear"
 708 ; http://php.net/include-path

----------

PHP的为include_path默认设置为".;/path/to/php/pear"，参考：http://php.net/include-path

----------

 709 
 710 ; The root of the PHP pages, used only if nonempty.
 711 ; if PHP was not compiled with FORCE_REDIRECT, you SHOULD set doc_root
 712 ; if you are running php as a CGI under any web server (other than IIS)
 713 ; see documentation for security issues.  The alternate is to use the
 714 ; cgi.force_redirect configuration below
 715 ; http://php.net/doc-root
 716 doc_root =

----------

PHP文件的根目录，只有非空时才被使用。如果PHP没有被FORCE_REDIRECT编译，你应该设置此选项
如果你在除了IIS以外得服务器下将PHP作为CGI来运行时则查看文档中以了解更多的安全问题。这时可以选择使用下面的cgi.force_redirect配置。参考：http://php.net/doc-root。这里的配置为doc_root =

----------

 717 
 718 ; The directory under which PHP opens the script using /~username used only
 719 ; if nonempty.
 720 ; http://php.net/user-dir
 721 user_dir =

----------

只有在下一条指令不为空的情况下，当PHP使用/~username打开脚本时下面的指令才被使用，参考：http://php.net/user-dir。这里的配置为：user_dir =

----------

 722 
 723 ; Directory in which the loadable extensions (modules) reside.
 724 ; http://php.net/extension-dir
 725 ; extension_dir = "./"
 726 ; On windows:
 727 ; extension_dir = "ext"

----------

这个选项指定可以加载的扩展模块存储的目录。参考：http://php.net/extension-dir。扩展目录设置：extension_dir = "./"，在windows下配置为extension_dir = "ext"。

----------

 728 
 729 ; Directory where the temporary files should be placed.
 730 ; Defaults to the system default (see sys_get_temp_dir)
 731 ; sys_temp_dir = "/tmp"

----------

这条指令指定临时文件存储的目录，默认的存储路径为系统默认的路径（查看选项sys_get_temp_dir),这里的配置为：sys_temp_dir = "/tmp"

----------

 732 
 733 ; Whether or not to enable the dl() function.  The dl() function does NOT work
 734 ; properly in multithreaded servers, such as IIS or Zeus, and is automatically
 735 ; disabled on them.
 736 ; http://php.net/enable-dl
 737 enable_dl = Off

----------

这个选项指定是否启用dl()函数。在多线程服务器上dl()函数工作的不是很好，如IIS或者Zeus，而且在这些服务器上自动禁用了这个函数。参考：http://php.net/enable-dl。这里的配置为enable_dl = Off。

----------

 738 
 739 ; cgi.force_redirect is necessary to provide security running PHP as a CGI under
 740 ; most web servers.  Left undefined, PHP turns this on by default.  You can
 741 ; turn it off here AT YOUR OWN RISK
 742 ; **You CAN safely turn this off for IIS, in fact, you MUST.**
 743 ; http://php.net/cgi.force-redirect
 744 ;cgi.force_redirect = 1

----------

在大多数服务器中，将PHP作为CGI来运行时cgi.force_redirect选项能够提供必要的安全性。如果这个选项不被定义则PHP默认开启此项配置。你可以在这里将它关闭。你可以在IIS下安全的关闭此项设置，事实上你必须这样做。
参考：http://php.net/cgi.force-redirect。这里的配置为：cgi.force_redirect = 1

----------

 745 
 746 ; if cgi.nph is enabled it will force cgi to always sent Status: 200 with
 747 ; every request. PHP's default behavior is to disable this feature.
 748 ;cgi.nph = 1

----------

如果cgi.nph被开启的话，他将会总是对每一个请求发送200状态码。PHP默认禁用了这一特性。这里的配置为：cgi.nph = 1

----------

 749 
 750 ; if cgi.force_redirect is turned on, and you are not running under Apache or Netscape
 751 ; (iPlanet) web servers, you MAY need to set an environment variable name that PHP
 752 ; will look for to know it is OK to continue execution.  Setting this variable MAY
 753 ; cause security issues, KNOW WHAT YOU ARE DOING FIRST.
 754 ; http://php.net/cgi.redirect-status-env
 755 ;cgi.redirect_status_env =

----------

如果选项cgi.force_redirect被开启了而且你没有再apache或者netscape网路服务器下运行PHP，你也许需要设置一个环境变量名供PHP查询以是PHP知道继续运行时ok的。设置这个变量也许会导致安全问题，你要知道自己正在做什么。参考：http://php.net/cgi.redirect-status-env，这里的配置为：cgi.redirect_status_env =

----------

 756 
 757 ; cgi.fix_pathinfo provides *real* PATH_INFO/PATH_TRANSLATED support for CGI.  PHP's
 758 ; previous behaviour was to set PATH_TRANSLATED to SCRIPT_FILENAME, and to not grok
 759 ; what PATH_INFO is.  For more information on PATH_INFO, see the cgi specs.  Setting
 760 ; this to 1 will cause PHP CGI to fix its paths to conform to the spec.  A setting
 761 ; of zero causes PHP to behave as before.  Default is 1.  You should fix your scripts
 762 ; to use SCRIPT_FILENAME rather than PATH_TRANSLATED.
 763 ; http://php.net/cgi.fix-pathinfo
 764 ;cgi.fix_pathinfo=1

----------

cgi.fix_pathinfo选项为CGI提供了绝对路径转换。PHP的之前的行为是将PATH_TRANSLATED设置到SCRIPT_FILENAME。并且不获得PATH_INFO是什么。查看cgi specs以获得更多信息。将这个值设置为1将会导致PHP项以前一样工作。默认值为1。你需要修改你的脚本使用SCRIPT_FILENAME而不是PATH_TRANSLATED。参考：http://php.net/cgi.fix-pathinfo，这里的配置为：cgi.fix_pathinfo=1

----------

 765 
 766 ; FastCGI under IIS (on WINNT based OS) supports the ability to impersonate
 767 ; security tokens of the calling client.  This allows IIS to define the
 768 ; security context that the request runs under.  mod_fastcgi under Apache
 769 ; does not currently support this feature (03/17/2002)
 770 ; Set to 1 if running under IIS.  Default is zero.
 771 ; http://php.net/fastcgi.impersonate
 772 ;fastcgi.impersonate = 1

----------

在基于winnt系统的IIS服务器下的FastCGI支持冒充客户端的安全令牌功能。这个选项允许IIS定义在他之下运行的请求的安全上下文。在apache下的mod_fastcgi目前不支持这个特性。如果在IIS下运行将此选项设置为1，默认值为0.参考：http://php.net/fastcgi.impersonate。这里的配置为：fastcgi.impersonate = 1

----------

 773 
 774 ; Disable logging through FastCGI connection. PHP's default behavior is to enable
 775 ; this feature.
 776 ;fastcgi.logging = 0

----------

这条指令使得通过FashCGI连接时禁用日志。PHP的默认行为会启用这个特性。这里的配置为fastcgi.logging = 0

----------

 777 
 778 ; cgi.rfc2616_headers configuration option tells PHP what type of headers to
 779 ; use when sending HTTP response code. If set to 0, PHP sends Status: header that
 780 ; is supported by Apache. When this option is set to 1, PHP will send
 781 ; RFC2616 compliant header.
 782 ; Default is zero.
 783 ; http://php.net/cgi.rfc2616-headers
 784 ;cgi.rfc2616_headers = 0

----------

cgi.rfc2616_headers配置选项告诉PHP当发送HTTP相应代码时使用哪些headers类型。如果爱能够此项设置为0，PHP发送得状态码为：apache支持的头类型。当这个选项设置为1，PHP将会发送RFC2616兼容的头。默认值为0，参考：http://php.net/cgi.rfc2616-headers。这里的配置为：cgi.rfc2616_headers = 0。

----------

 785 
 786 ;;;;;;;;;;;;;;;;
 787 ; File Uploads ;
 788 ;;;;;;;;;;;;;;;;
 789 
 790 ; Whether to allow HTTP file uploads.
 791 ; http://php.net/file-uploads
 792 file_uploads = On
 793 
 794 ; Temporary directory for HTTP uploaded files (will use system default if not
 795 ; specified).
 796 ; http://php.net/upload-tmp-dir
 797 ;upload_tmp_dir =
 798 
 799 ; Maximum allowed size for uploaded files.
 800 ; http://php.net/upload-max-filesize
 801 upload_max_filesize = 2M
 802 
 803 ; Maximum number of files that can be uploaded via a single request
 804 max_file_uploads = 20

----------

文件上传配置
是否允许http文件上传功能，参考：http://php.net/file-uploads，这里的配置为：file_uploads = On

http上传文件存储的路径（如果没有指定则默认使用系统的），参考：http://php.net/upload-tmp-dir。这里的配置为upload_tmp_dir =。该目录必须要是PHP用户可读可写的目录

最大允许上传文件的大小，参考：http://php.net/upload-max-filesize。这里的配置为：upload_max_filesize = 2M。

在一个单一请求中最大允许上传的文件数目，这里的配置为：upload_max_filesize = 2M

----------

 805 
 806 ;;;;;;;;;;;;;;;;;;
 807 ; Fopen wrappers ;
 808 ;;;;;;;;;;;;;;;;;;
 809 
 810 ; Whether to allow the treatment of URLs (like http:// or ftp://) as files.
 811 ; http://php.net/allow-url-fopen
 812 allow_url_fopen = On
 813 
 814 ; Whether to allow include/require to open URLs (like http:// or ftp://) as files.
 815 ; http://php.net/allow-url-include
 816 allow_url_include = Off
 817 
 818 ; Define the anonymous ftp password (your email address). PHP's default setting
 819 ; for this is empty.
 820 ; http://php.net/from
 821 ;from="john@doe.com"
 822 
 823 ; Define the User-Agent string. PHP's default setting for this is empty.
 824 ; http://php.net/user-agent
 825 ;user_agent="PHP"
 826 
 827 ; Default timeout for socket based streams (seconds)
 828 ; http://php.net/default-socket-timeout
 829 default_socket_timeout = 60
 830 
 831 ; If your scripts have to deal with files from Macintosh systems,
 832 ; or you are running on a Mac and need to deal with files from
 833 ; unix or win32 systems, setting this flag will cause PHP to
 834 ; automatically detect the EOL character in those files so that
 835 ; fgets() and file() will work regardless of the source of the file.
 836 ; http://php.net/auto-detect-line-endings
 837 ;auto_detect_line_endings = Off

----------

文件打开封装
是否允许将url地址（像http:// 或者ftp://样式的)当做文件来看待。参考：http://php.net/allow-url-fopen。这里的配置为：allow_url_fopen = On（应该是使得fopen可以打开网址）

定义匿名的ftp账户密码（你的电子邮件地址）。PHP默认将此项设置为空。参考：http://php.net/from。这里的配置为：from="john@doe.com"

定义User-Agent字符串。PHP为此选项的默认值空的。参考：http://php.net/user-agent。这类的配置为user_agent="PHP"。
为基于流的socket设置的过期时间。参考:http://php.net/default-socket-timeout。这里的配置为default_socket_timeout = 60，单位为秒。
如果你的脚本不得不处理来自Mac系统文件或者你不得不在正在运行的Mac电脑上处理来自Unix或者win32系统的文件时，设置这个选项将会使得PHP自动检测文件末尾字符以便于fgets() and file()这两个函数能够工作而不管文件的来源。参考：http://php.net/auto-detect-line-endings。这里的配置为auto_detect_line_endings = Off。

----------

 838 
 839 ;;;;;;;;;;;;;;;;;;;;;;
 840 ; Dynamic Extensions ;
 841 ;;;;;;;;;;;;;;;;;;;;;;
 842 
 843 ; If you wish to have an extension loaded automatically, use the following
 844 ; syntax:
 845 ;
 846 ;   extension=modulename.extension
 847 ;
 848 ; For example, on Windows:
 849 ;
 850 ;   extension=msql.dll
 851 ;
 852 ; ... or under UNIX:
 853 ;
 854 ;   extension=msql.so
 855 ;
 856 ; ... or with a path:
 857 ;
 858 ;   extension=/path/to/extension/msql.so
 859 ;
 860 ; If you only provide the name of the extension, PHP will look for it in its
 861 ; default extension directory.
 862 ;
 863 ; Windows Extensions
 864 ; Note that ODBC support is built in, so no dll is needed for it.
 865 ; Note that many DLL files are located in the extensions/ (PHP 4) ext/ (PHP 5+)
 866 ; extension folders as well as the separate PECL DLL download (PHP 5+).
 867 ; Be sure to appropriately set the extension_dir directive.

----------

如果你希望扩展自动加载，使用下面的语法：extension=modulename.extension
示例：
在windows中：extension=msql.dll
或者在unix下，extension=msql.so
或者添加路径，extension=/path/to/extension/msql.so

如果你只提供了扩展的名字，PHP将会在它的默认扩展文件中查找此文件（即上面前两种情况）
windows扩展：
注意：PHP内置了ODBC支持。因此dll不是必须的。
注意：许多动态扩展文件被放在了PHP4的extension文件夹或者PHP5+的ext文件夹下，也包括单独下载的PECL动态库。因此确定恰当的设置了扩展文件目录。

----------

 868 ;
 869 ;extension=php_bz2.dll
 870 ;extension=php_curl.dll
 871 ;extension=php_fileinfo.dll
 872 ;extension=php_ftp.dll
 873 ;extension=php_gd2.dll
 874 ;extension=php_gettext.dll
 875 ;extension=php_gmp.dll
 876 ;extension=php_intl.dll
 877 ;extension=php_imap.dll
 878 ;extension=php_interbase.dll
 879 ;extension=php_ldap.dll
 880 ;extension=php_mbstring.dll
 881 ;extension=php_exif.dll      ; Must be after mbstring as it depends on it
 882 ;extension=php_mysqli.dll
 883 ;extension=php_oci8_12c.dll  ; Use with Oracle Database 12c Instant Client
 884 ;extension=php_openssl.dll
 885 ;extension=php_pdo_firebird.dll
 886 ;extension=php_pdo_mysql.dll
 887 ;extension=php_pdo_oci.dll
 888 ;extension=php_pdo_odbc.dll
 889 ;extension=php_pdo_pgsql.dll
 890 ;extension=php_pdo_sqlite.dll
 891 ;extension=php_pgsql.dll
 892 ;extension=php_shmop.dll
 893 
 894 ; The MIBS data available in the PHP distribution must be installed.
 895 ; See http://www.php.net/manual/en/snmp.installation.php
 896 ;extension=php_snmp.dll
 897 
 898 ;extension=php_soap.dll
 899 ;extension=php_sockets.dll
 900 ;extension=php_sqlite3.dll
 901 ;extension=php_tidy.dll
 902 ;extension=php_xmlrpc.dll
 903 ;extension=php_xsl.dll
 904 
 905 ;;;;;;;;;;;;;;;;;;;
 906 ; Module Settings ;
 907 ;;;;;;;;;;;;;;;;;;;
 908 
 909 [CLI Server]
 910 ; Whether the CLI web server uses ANSI color coding in its terminal output.
 911 cli_server.color = On
 912 
 913 [Date]
 914 ; Defines the default timezone used by the date functions
 915 ; http://php.net/date.timezone
 916 ;date.timezone =
 917 
 918 ; http://php.net/date.default-latitude
 919 ;date.default_latitude = 31.7667
 920 
 921 ; http://php.net/date.default-longitude
 922 ;date.default_longitude = 35.2333
 923 
 924 ; http://php.net/date.sunrise-zenith
 925 ;date.sunrise_zenith = 90.583333
 926 
 927 ; http://php.net/date.sunset-zenith
 928 ;date.sunset_zenith = 90.583333
 929 
 930 [filter]
 931 ; http://php.net/filter.default
 932 ;filter.default = unsafe_raw
 933 
 934 ; http://php.net/filter.default-flags
 935 ;filter.default_flags =
 936 
 937 [iconv]
 938 ; Use of this INI entry is deprecated, use global input_encoding instead.
 939 ; If empty, default_charset or input_encoding or iconv.input_encoding is used.
 940 ; The precedence is: default_charset < intput_encoding < iconv.input_encoding
 941 ;iconv.input_encoding =
 942 
 943 ; Use of this INI entry is deprecated, use global internal_encoding instead.
 944 ; If empty, default_charset or internal_encoding or iconv.internal_encoding is used.
 945 ; The precedence is: default_charset < internal_encoding < iconv.internal_encoding
 946 ;iconv.internal_encoding =
 947 
 948 ; Use of this INI entry is deprecated, use global output_encoding instead.
 949 ; If empty, default_charset or output_encoding or iconv.output_encoding is used.
 950 ; The precedence is: default_charset < output_encoding < iconv.output_encoding
 951 ; To use an output encoding conversion, iconv's output handler must be set
 952 ; otherwise output encoding conversion cannot be performed.
 953 ;iconv.output_encoding =
 954 
 955 [intl]
 956 ;intl.default_locale =
 957 ; This directive allows you to produce PHP errors when some error
 958 ; happens within intl functions. The value is the level of the error produced.
 959 ; Default is 0, which does not produce any errors.
 960 ;intl.error_level = E_WARNING
 961 ;intl.use_exceptions = 0
 962 
 963 [sqlite3]
 964 ;sqlite3.extension_dir =
 965 
 966 [Pcre]
 967 ;PCRE library backtracking limit.
 968 ; http://php.net/pcre.backtrack-limit
 969 ;pcre.backtrack_limit=100000
 970 
 971 ;PCRE library recursion limit.
 972 ;Please note that if you set this value to a high number you may consume all
 973 ;the available process stack and eventually crash PHP (due to reaching the
 974 ;stack size limit imposed by the Operating System).
 975 ; http://php.net/pcre.recursion-limit
 976 ;pcre.recursion_limit=100000
 977 
 978 ;Enables or disables JIT compilation of patterns. This requires the PCRE
 979 ;library to be compiled with JIT support.
 980 ;pcre.jit=1
 981 
 982 [Pdo]
 983 ; Whether to pool ODBC connections. Can be one of "strict", "relaxed" or "off"
 984 ; http://php.net/pdo-odbc.connection-pooling
 985 ;pdo_odbc.connection_pooling=strict
 986 
 987 ;pdo_odbc.db2_instance_name
 988 
 989 [Pdo_mysql]
 990 ; If mysqlnd is used: Number of cache slots for the internal result set cache
 991 ; http://php.net/pdo_mysql.cache_size
 992 pdo_mysql.cache_size = 2000
 993 
 994 ; Default socket name for local MySQL connects.  If empty, uses the built-in
 995 ; MySQL defaults.
 996 ; http://php.net/pdo_mysql.default-socket
 997 pdo_mysql.default_socket=
 998 
 999 [Phar]
1000 ; http://php.net/phar.readonly
1001 ;phar.readonly = On
1002 
1003 ; http://php.net/phar.require-hash
1004 ;phar.require_hash = On
1005 
1006 ;phar.cache_list =
1007 
1008 [mail function]
1009 ; For Win32 only.
1010 ; http://php.net/smtp
1011 SMTP = localhost
1012 ; http://php.net/smtp-port
1013 smtp_port = 25
1014 
1015 ; For Win32 only.
1016 ; http://php.net/sendmail-from
1017 ;sendmail_from = me@example.com
1018 
1019 ; For Unix only.  You may supply arguments as well (default: "sendmail -t -i").
1020 ; http://php.net/sendmail-path
1021 ;sendmail_path =
1022 
1023 ; Force the addition of the specified parameters to be passed as extra parameters
1024 ; to the sendmail binary. These parameters will always replace the value of
1025 ; the 5th parameter to mail().
1026 ;mail.force_extra_parameters =
1027 
1028 ; Add X-PHP-Originating-Script: that will include uid of the script followed by the filename
1029 mail.add_x_header = On
1030 
1031 ; The path to a log file that will log all mail() calls. Log entries include
1032 ; the full path of the script, line number, To address and headers.
1033 ;mail.log =
1034 ; Log mail to syslog (Event Log on Windows).
1035 ;mail.log = syslog
1036 
1037 [SQL]
1038 ; http://php.net/sql.safe-mode
1039 sql.safe_mode = Off
1040 
1041 [ODBC]
1042 ; http://php.net/odbc.default-db
1043 ;odbc.default_db    =  Not yet implemented
1044 
1045 ; http://php.net/odbc.default-user
1046 ;odbc.default_user  =  Not yet implemented
1047 
1048 ; http://php.net/odbc.default-pw
1049 ;odbc.default_pw    =  Not yet implemented
1050 
1051 ; Controls the ODBC cursor model.
1052 ; Default: SQL_CURSOR_STATIC (default).
1053 ;odbc.default_cursortype
1054 
1055 ; Allow or prevent persistent links.
1056 ; http://php.net/odbc.allow-persistent
1057 odbc.allow_persistent = On
1058 
1059 ; Check that a connection is still valid before reuse.
1060 ; http://php.net/odbc.check-persistent
1061 odbc.check_persistent = On
1062 
1063 ; Maximum number of persistent links.  -1 means no limit.
1064 ; http://php.net/odbc.max-persistent
1065 odbc.max_persistent = -1
1066 
1067 ; Maximum number of links (persistent + non-persistent).  -1 means no limit.
1068 ; http://php.net/odbc.max-links
1069 odbc.max_links = -1
1070 
1071 ; Handling of LONG fields.  Returns number of bytes to variables.  0 means
1072 ; passthru.
1073 ; http://php.net/odbc.defaultlrl
1074 odbc.defaultlrl = 4096
1075 
1076 ; Handling of binary data.  0 means passthru, 1 return as is, 2 convert to char.
1077 ; See the documentation on odbc_binmode and odbc_longreadlen for an explanation
1078 ; of odbc.defaultlrl and odbc.defaultbinmode
1079 ; http://php.net/odbc.defaultbinmode
1080 odbc.defaultbinmode = 1
1081 
1082 ;birdstep.max_links = -1
1083 
1084 [Interbase]
1085 ; Allow or prevent persistent links.
1086 ibase.allow_persistent = 1
1087 
1088 ; Maximum number of persistent links.  -1 means no limit.
1089 ibase.max_persistent = -1
1090 
1091 ; Maximum number of links (persistent + non-persistent).  -1 means no limit.
1092 ibase.max_links = -1
1093 
1094 ; Default database name for ibase_connect().
1095 ;ibase.default_db =
1096 
1097 ; Default username for ibase_connect().
1098 ;ibase.default_user =
1099 
1100 ; Default password for ibase_connect().
1101 ;ibase.default_password =
1102 
1103 ; Default charset for ibase_connect().
1104 ;ibase.default_charset =
1105 
1106 ; Default timestamp format.
1107 ibase.timestampformat = "%Y-%m-%d %H:%M:%S"
1108 
1109 ; Default date format.
1110 ibase.dateformat = "%Y-%m-%d"
1111 
1112 ; Default time format.
1113 ibase.timeformat = "%H:%M:%S"
1114 
1115 [MySQLi]
1116 
1117 ; Maximum number of persistent links.  -1 means no limit.
1118 ; http://php.net/mysqli.max-persistent
1119 mysqli.max_persistent = -1
1120 
1121 ; Allow accessing, from PHP's perspective, local files with LOAD DATA statements
1122 ; http://php.net/mysqli.allow_local_infile
1123 ;mysqli.allow_local_infile = On
1124 
1125 ; Allow or prevent persistent links.
1126 ; http://php.net/mysqli.allow-persistent
1127 mysqli.allow_persistent = On
1128 
1129 ; Maximum number of links.  -1 means no limit.
1130 ; http://php.net/mysqli.max-links
1131 mysqli.max_links = -1
1132 
1133 ; If mysqlnd is used: Number of cache slots for the internal result set cache
1134 ; http://php.net/mysqli.cache_size
1135 mysqli.cache_size = 2000
1136 
1137 ; Default port number for mysqli_connect().  If unset, mysqli_connect() will use
1138 ; the $MYSQL_TCP_PORT or the mysql-tcp entry in /etc/services or the
1139 ; compile-time value defined MYSQL_PORT (in that order).  Win32 will only look
1140 ; at MYSQL_PORT.
1141 ; http://php.net/mysqli.default-port
1142 mysqli.default_port = 3306
1143 
1144 ; Default socket name for local MySQL connects.  If empty, uses the built-in
1145 ; MySQL defaults.
1146 ; http://php.net/mysqli.default-socket
1147 mysqli.default_socket =
1148 
1149 ; Default host for mysql_connect() (doesn't apply in safe mode).
1150 ; http://php.net/mysqli.default-host
1151 mysqli.default_host =
1152 
1153 ; Default user for mysql_connect() (doesn't apply in safe mode).
1154 ; http://php.net/mysqli.default-user
1155 mysqli.default_user =
1156 
1157 ; Default password for mysqli_connect() (doesn't apply in safe mode).
1158 ; Note that this is generally a *bad* idea to store passwords in this file.
1159 ; *Any* user with PHP access can run 'echo get_cfg_var("mysqli.default_pw")
1160 ; and reveal this password!  And of course, any users with read access to this
1161 ; file will be able to reveal the password as well.
1162 ; http://php.net/mysqli.default-pw
1163 mysqli.default_pw =
1164 
1165 ; Allow or prevent reconnect
1166 mysqli.reconnect = Off
1167 
1168 [mysqlnd]
1169 ; Enable / Disable collection of general statistics by mysqlnd which can be
1170 ; used to tune and monitor MySQL operations.
1171 ; http://php.net/mysqlnd.collect_statistics
1172 mysqlnd.collect_statistics = On
1173 
1174 ; Enable / Disable collection of memory usage statistics by mysqlnd which can be
1175 ; used to tune and monitor MySQL operations.
1176 ; http://php.net/mysqlnd.collect_memory_statistics
1177 mysqlnd.collect_memory_statistics = Off
1178 
1179 ; Size of a pre-allocated buffer used when sending commands to MySQL in bytes.
1180 ; http://php.net/mysqlnd.net_cmd_buffer_size
1181 ;mysqlnd.net_cmd_buffer_size = 2048
1182 
1183 ; Size of a pre-allocated buffer used for reading data sent by the server in
1184 ; bytes.
1185 ; http://php.net/mysqlnd.net_read_buffer_size
1186 ;mysqlnd.net_read_buffer_size = 32768
1187 
1188 [OCI8]
1189 
1190 ; Connection: Enables privileged connections using external
1191 ; credentials (OCI_SYSOPER, OCI_SYSDBA)
1192 ; http://php.net/oci8.privileged-connect
1193 ;oci8.privileged_connect = Off
1194 
1195 ; Connection: The maximum number of persistent OCI8 connections per
1196 ; process. Using -1 means no limit.
1197 ; http://php.net/oci8.max-persistent
1198 ;oci8.max_persistent = -1
1199 
1200 ; Connection: The maximum number of seconds a process is allowed to
1201 ; maintain an idle persistent connection. Using -1 means idle
1202 ; persistent connections will be maintained forever.
1203 ; http://php.net/oci8.persistent-timeout
1204 ;oci8.persistent_timeout = -1
1205 
1206 ; Connection: The number of seconds that must pass before issuing a
1207 ; ping during oci_pconnect() to check the connection validity. When
1208 ; set to 0, each oci_pconnect() will cause a ping. Using -1 disables
1209 ; pings completely.
1210 ; http://php.net/oci8.ping-interval
1211 ;oci8.ping_interval = 60
1212 
1213 ; Connection: Set this to a user chosen connection class to be used
1214 ; for all pooled server requests with Oracle 11g Database Resident
1215 ; Connection Pooling (DRCP).  To use DRCP, this value should be set to
1216 ; the same string for all web servers running the same application,
1217 ; the database pool must be configured, and the connection string must
1218 ; specify to use a pooled server.
1219 ;oci8.connection_class =
1220 
1221 ; High Availability: Using On lets PHP receive Fast Application
1222 ; Notification (FAN) events generated when a database node fails. The
1223 ; database must also be configured to post FAN events.
1224 ;oci8.events = Off
1225 
1226 ; Tuning: This option enables statement caching, and specifies how
1227 ; many statements to cache. Using 0 disables statement caching.
1228 ; http://php.net/oci8.statement-cache-size
1229 ;oci8.statement_cache_size = 20
1230 
1231 ; Tuning: Enables statement prefetching and sets the default number of
1232 ; rows that will be fetched automatically after statement execution.
1233 ; http://php.net/oci8.default-prefetch
1234 ;oci8.default_prefetch = 100
1235 
1236 ; Compatibility. Using On means oci_close() will not close
1237 ; oci_connect() and oci_new_connect() connections.
1238 ; http://php.net/oci8.old-oci-close-semantics
1239 ;oci8.old_oci_close_semantics = Off
1240 
1241 [PostgreSQL]
1242 ; Allow or prevent persistent links.
1243 ; http://php.net/pgsql.allow-persistent
1244 pgsql.allow_persistent = On
1245 
1246 ; Detect broken persistent links always with pg_pconnect().
1247 ; Auto reset feature requires a little overheads.
1248 ; http://php.net/pgsql.auto-reset-persistent
1249 pgsql.auto_reset_persistent = Off
1250 
1251 ; Maximum number of persistent links.  -1 means no limit.
1252 ; http://php.net/pgsql.max-persistent
1253 pgsql.max_persistent = -1
1254 
1255 ; Maximum number of links (persistent+non persistent).  -1 means no limit.
1256 ; http://php.net/pgsql.max-links
1257 pgsql.max_links = -1
1258 
1259 ; Ignore PostgreSQL backends Notice message or not.
1260 ; Notice message logging require a little overheads.
1261 ; http://php.net/pgsql.ignore-notice
1262 pgsql.ignore_notice = 0
1263 
1264 ; Log PostgreSQL backends Notice message or not.
1265 ; Unless pgsql.ignore_notice=0, module cannot log notice message.
1266 ; http://php.net/pgsql.log-notice
1267 pgsql.log_notice = 0
1268 
1269 [bcmath]
1270 ; Number of decimal digits for all bcmath functions.
1271 ; http://php.net/bcmath.scale
1272 bcmath.scale = 0
1273 
1274 [browscap]
1275 ; http://php.net/browscap
1276 ;browscap = extra/browscap.ini
1277 
1278 [Session]
1279 ; Handler used to store/retrieve data.
1280 ; http://php.net/session.save-handler
1281 session.save_handler = files
1282 
1283 ; Argument passed to save_handler.  In the case of files, this is the path
1284 ; where data files are stored. Note: Windows users have to change this
1285 ; variable in order to use PHP's session functions.
1286 ;
1287 ; The path can be defined as:
1288 ;
1289 ;     session.save_path = "N;/path"
1290 ;
1291 ; where N is an integer.  Instead of storing all the session files in
1292 ; /path, what this will do is use subdirectories N-levels deep, and
1293 ; store the session data in those directories.  This is useful if
1294 ; your OS has problems with many files in one directory, and is
1295 ; a more efficient layout for servers that handle many sessions.
1296 ;
1297 ; NOTE 1: PHP will not create this directory structure automatically.
1298 ;         You can use the script in the ext/session dir for that purpose.
1299 ; NOTE 2: See the section on garbage collection below if you choose to
1300 ;         use subdirectories for session storage
1301 ;
1302 ; The file storage module creates files using mode 600 by default.
1303 ; You can change that by using
1304 ;
1305 ;     session.save_path = "N;MODE;/path"
1306 ;
1307 ; where MODE is the octal representation of the mode. Note that this
1308 ; does not overwrite the process's umask.
1309 ; http://php.net/session.save-path
1310 ;session.save_path = "/tmp"
1311 
1312 ; Whether to use strict session mode.
1313 ; Strict session mode does not accept uninitialized session ID and regenerate
1314 ; session ID if browser sends uninitialized session ID. Strict mode protects
1315 ; applications from session fixation via session adoption vulnerability. It is
1316 ; disabled by default for maximum compatibility, but enabling it is encouraged.
1317 ; https://wiki.php.net/rfc/strict_sessions
1318 session.use_strict_mode = 0
1319 
1320 ; Whether to use cookies.
1321 ; http://php.net/session.use-cookies
1322 session.use_cookies = 1
1323 
1324 ; http://php.net/session.cookie-secure
1325 ;session.cookie_secure =
1326 
1327 ; This option forces PHP to fetch and use a cookie for storing and maintaining
1328 ; the session id. We encourage this operation as it's very helpful in combating
1329 ; session hijacking when not specifying and managing your own session id. It is
1330 ; not the be-all and end-all of session hijacking defense, but it's a good start.
1331 ; http://php.net/session.use-only-cookies
1332 session.use_only_cookies = 1
1333 
1334 ; Name of the session (used as cookie name).
1335 ; http://php.net/session.name
1336 session.name = PHPSESSID
1337 
1338 ; Initialize session on request startup.
1339 ; http://php.net/session.auto-start
1340 session.auto_start = 0
1341 
1342 ; Lifetime in seconds of cookie or, if 0, until browser is restarted.
1343 ; http://php.net/session.cookie-lifetime
1344 session.cookie_lifetime = 0
1345 
1346 ; The path for which the cookie is valid.
1347 ; http://php.net/session.cookie-path
1348 session.cookie_path = /
1349 
1350 ; The domain for which the cookie is valid.
1351 ; http://php.net/session.cookie-domain
1352 session.cookie_domain =
1353 
1354 ; Whether or not to add the httpOnly flag to the cookie, which makes it inaccessible to browser scripting languages such as JavaScript.
1355 ; http://php.net/session.cookie-httponly
1356 session.cookie_httponly =
1357 
1358 ; Handler used to serialize data.  php is the standard serializer of PHP.
1359 ; http://php.net/session.serialize-handler
1360 session.serialize_handler = php
1361 
1362 ; Defines the probability that the 'garbage collection' process is started
1363 ; on every session initialization. The probability is calculated by using
1364 ; gc_probability/gc_divisor. Where session.gc_probability is the numerator
1365 ; and gc_divisor is the denominator in the equation. Setting this value to 1
1366 ; when the session.gc_divisor value is 100 will give you approximately a 1% chance
1367 ; the gc will run on any give request.
1368 ; Default Value: 1
1369 ; Development Value: 1
1370 ; Production Value: 1
1371 ; http://php.net/session.gc-probability
1372 session.gc_probability = 1
1373 
1374 ; Defines the probability that the 'garbage collection' process is started on every
1375 ; session initialization. The probability is calculated by using the following equation:
1376 ; gc_probability/gc_divisor. Where session.gc_probability is the numerator and
1377 ; session.gc_divisor is the denominator in the equation. Setting this value to 1
1378 ; when the session.gc_divisor value is 100 will give you approximately a 1% chance
1379 ; the gc will run on any give request. Increasing this value to 1000 will give you
1380 ; a 0.1% chance the gc will run on any give request. For high volume production servers,
1381 ; this is a more efficient approach.
1382 ; Default Value: 100
1383 ; Development Value: 1000
1384 ; Production Value: 1000
1385 ; http://php.net/session.gc-divisor
1386 session.gc_divisor = 1000
1387 
1388 ; After this number of seconds, stored data will be seen as 'garbage' and
1389 ; cleaned up by the garbage collection process.
1390 ; http://php.net/session.gc-maxlifetime
1391 session.gc_maxlifetime = 1440
1392 
1393 ; NOTE: If you are using the subdirectory option for storing session files
1394 ;       (see session.save_path above), then garbage collection does *not*
1395 ;       happen automatically.  You will need to do your own garbage
1396 ;       collection through a shell script, cron entry, or some other method.
1397 ;       For example, the following script would is the equivalent of
1398 ;       setting session.gc_maxlifetime to 1440 (1440 seconds = 24 minutes):
1399 ;          find /path/to/sessions -cmin +24 -type f | xargs rm
1400 
1401 ; Check HTTP Referer to invalidate externally stored URLs containing ids.
1402 ; HTTP_REFERER has to contain this substring for the session to be
1403 ; considered as valid.
1404 ; http://php.net/session.referer-check
1405 session.referer_check =
1406 
1407 ; How many bytes to read from the file.
1408 ; http://php.net/session.entropy-length
1409 ;session.entropy_length = 32
1410 
1411 ; Specified here to create the session id.
1412 ; http://php.net/session.entropy-file
1413 ; Defaults to /dev/urandom
1414 ; On systems that don't have /dev/urandom but do have /dev/arandom, this will default to /dev/arandom
1415 ; If neither are found at compile time, the default is no entropy file.
1416 ; On windows, setting the entropy_length setting will activate the
1417 ; Windows random source (using the CryptoAPI)
1418 ;session.entropy_file = /dev/urandom
1419 
1420 ; Set to {nocache,private,public,} to determine HTTP caching aspects
1421 ; or leave this empty to avoid sending anti-caching headers.
1422 ; http://php.net/session.cache-limiter
1423 session.cache_limiter = nocache
1424 
1425 ; Document expires after n minutes.
1426 ; http://php.net/session.cache-expire
1427 session.cache_expire = 180
1428 
1429 ; trans sid support is disabled by default.
1430 ; Use of trans sid may risk your users' security.
1431 ; Use this option with caution.
1432 ; - User may send URL contains active session ID
1433 ;   to other person via. email/irc/etc.
1434 ; - URL that contains active session ID may be stored
1435 ;   in publicly accessible computer.
1436 ; - User may access your site with the same session ID
1437 ;   always using URL stored in browser's history or bookmarks.
1438 ; http://php.net/session.use-trans-sid
1439 session.use_trans_sid = 0
1440 
1441 ; Select a hash function for use in generating session ids.
1442 ; Possible Values
1443 ;   0  (MD5 128 bits)
1444 ;   1  (SHA-1 160 bits)
1445 ; This option may also be set to the name of any hash function supported by
1446 ; the hash extension. A list of available hashes is returned by the hash_algos()
1447 ; function.
1448 ; http://php.net/session.hash-function
1449 session.hash_function = 0
1450 
1451 ; Define how many bits are stored in each character when converting
1452 ; the binary hash data to something readable.
1453 ; Possible values:
1454 ;   4  (4 bits: 0-9, a-f)
1455 ;   5  (5 bits: 0-9, a-v)
1456 ;   6  (6 bits: 0-9, a-z, A-Z, "-", ",")
1457 ; Default Value: 4
1458 ; Development Value: 5
1459 ; Production Value: 5
1460 ; http://php.net/session.hash-bits-per-character
1461 session.hash_bits_per_character = 5
1462 
1463 ; The URL rewriter will look for URLs in a defined set of HTML tags.
1464 ; form/fieldset are special; if you include them here, the rewriter will
1465 ; add a hidden <input> field with the info which is otherwise appended
1466 ; to URLs.  If you want XHTML conformity, remove the form entry.
1467 ; Note that all valid entries require a "=", even if no value follows.
1468 ; Default Value: "a=href,area=href,frame=src,form=,fieldset="
1469 ; Development Value: "a=href,area=href,frame=src,input=src,form=fakeentry"
1470 ; Production Value: "a=href,area=href,frame=src,input=src,form=fakeentry"
1471 ; http://php.net/url-rewriter.tags
1472 url_rewriter.tags = "a=href,area=href,frame=src,input=src,form=fakeentry"
1473 
1474 ; Enable upload progress tracking in $_SESSION
1475 ; Default Value: On
1476 ; Development Value: On
1477 ; Production Value: On
1478 ; http://php.net/session.upload-progress.enabled
1479 ;session.upload_progress.enabled = On
1480 
1481 ; Cleanup the progress information as soon as all POST data has been read
1482 ; (i.e. upload completed).
1483 ; Default Value: On
1484 ; Development Value: On
1485 ; Production Value: On
1486 ; http://php.net/session.upload-progress.cleanup
1487 ;session.upload_progress.cleanup = On
1488 
1489 ; A prefix used for the upload progress key in $_SESSION
1490 ; Default Value: "upload_progress_"
1491 ; Development Value: "upload_progress_"
1492 ; Production Value: "upload_progress_"
1493 ; http://php.net/session.upload-progress.prefix
1494 ;session.upload_progress.prefix = "upload_progress_"
1495 
1496 ; The index name (concatenated with the prefix) in $_SESSION
1497 ; containing the upload progress information
1498 ; Default Value: "PHP_SESSION_UPLOAD_PROGRESS"
1499 ; Development Value: "PHP_SESSION_UPLOAD_PROGRESS"
1500 ; Production Value: "PHP_SESSION_UPLOAD_PROGRESS"
1501 ; http://php.net/session.upload-progress.name
1502 ;session.upload_progress.name = "PHP_SESSION_UPLOAD_PROGRESS"
1503 
1504 ; How frequently the upload progress should be updated.
1505 ; Given either in percentages (per-file), or in bytes
1506 ; Default Value: "1%"
1507 ; Development Value: "1%"
1508 ; Production Value: "1%"
1509 ; http://php.net/session.upload-progress.freq
1510 ;session.upload_progress.freq =  "1%"
1511 
1512 ; The minimum delay between updates, in seconds
1513 ; Default Value: 1
1514 ; Development Value: 1
1515 ; Production Value: 1
1516 ; http://php.net/session.upload-progress.min-freq
1517 ;session.upload_progress.min_freq = "1"
1518 
1519 ; Only write session data when session data is changed. Enabled by default.
1520 ; http://php.net/session.lazy-write
1521 ;session.lazy_write = On
1522 
1523 [Assertion]
1524 ; Switch whether to compile assertions at all (to have no overhead at run-time)
1525 ; -1: Do not compile at all
1526 ;  0: Jump over assertion at run-time
1527 ;  1: Execute assertions
1528 ; Changing from or to a negative value is only possible in php.ini! (For turning assertions on and off at run-time, see assert.active, when zend.assertions = 1)
1529 ; Default Value: 1
1530 ; Development Value: 1
1531 ; Production Value: -1
1532 ; http://php.net/zend.assertions
1533 zend.assertions = -1
1534 
1535 ; Assert(expr); active by default.
1536 ; http://php.net/assert.active
1537 ;assert.active = On
1538 
1539 ; Throw an AssertationException on failed assertions
1540 ; http://php.net/assert.exception
1541 ;assert.exception = On
1542 
1543 ; Issue a PHP warning for each failed assertion. (Overridden by assert.exception if active)
1544 ; http://php.net/assert.warning
1545 ;assert.warning = On
1546 
1547 ; Don't bail out by default.
1548 ; http://php.net/assert.bail
1549 ;assert.bail = Off
1550 
1551 ; User-function to be called if an assertion fails.
1552 ; http://php.net/assert.callback
1553 ;assert.callback = 0
1554 
1555 ; Eval the expression with current error_reporting().  Set to true if you want
1556 ; error_reporting(0) around the eval().
1557 ; http://php.net/assert.quiet-eval
1558 ;assert.quiet_eval = 0
1559 
1560 [COM]
1561 ; path to a file containing GUIDs, IIDs or filenames of files with TypeLibs
1562 ; http://php.net/com.typelib-file
1563 ;com.typelib_file =
1564 
1565 ; allow Distributed-COM calls
1566 ; http://php.net/com.allow-dcom
1567 ;com.allow_dcom = true
1568 
1569 ; autoregister constants of a components typlib on com_load()
1570 ; http://php.net/com.autoregister-typelib
1571 ;com.autoregister_typelib = true
1572 
1573 ; register constants casesensitive
1574 ; http://php.net/com.autoregister-casesensitive
1575 ;com.autoregister_casesensitive = false
1576 
1577 ; show warnings on duplicate constant registrations
1578 ; http://php.net/com.autoregister-verbose
1579 ;com.autoregister_verbose = true
1580 
1581 ; The default character set code-page to use when passing strings to and from COM objects.
1582 ; Default: system ANSI code page
1583 ;com.code_page=
1584 
1585 [mbstring]
1586 ; language for internal character representation.
1587 ; This affects mb_send_mail() and mbstring.detect_order.
1588 ; http://php.net/mbstring.language
1589 ;mbstring.language = Japanese
1590 
1591 ; Use of this INI entry is deprecated, use global internal_encoding instead.
1592 ; internal/script encoding.
1593 ; Some encoding cannot work as internal encoding. (e.g. SJIS, BIG5, ISO-2022-*)
1594 ; If empty, default_charset or internal_encoding or iconv.internal_encoding is used.
1595 ; The precedence is: default_charset < internal_encoding < iconv.internal_encoding
1596 ;mbstring.internal_encoding =
1597 
1598 ; Use of this INI entry is deprecated, use global input_encoding instead.
1599 ; http input encoding.
1600 ; mbstring.encoding_traslation = On is needed to use this setting.
1601 ; If empty, default_charset or input_encoding or mbstring.input is used.
1602 ; The precedence is: default_charset < intput_encoding < mbsting.http_input
1603 ; http://php.net/mbstring.http-input
1604 ;mbstring.http_input =
1605 
1606 ; Use of this INI entry is deprecated, use global output_encoding instead.
1607 ; http output encoding.
1608 ; mb_output_handler must be registered as output buffer to function.
1609 ; If empty, default_charset or output_encoding or mbstring.http_output is used.
1610 ; The precedence is: default_charset < output_encoding < mbstring.http_output
1611 ; To use an output encoding conversion, mbstring's output handler must be set
1612 ; otherwise output encoding conversion cannot be performed.
1613 ; http://php.net/mbstring.http-output
1614 ;mbstring.http_output =
1615 
1616 ; enable automatic encoding translation according to
1617 ; mbstring.internal_encoding setting. Input chars are
1618 ; converted to internal encoding by setting this to On.
1619 ; Note: Do _not_ use automatic encoding translation for
1620 ;       portable libs/applications.
1621 ; http://php.net/mbstring.encoding-translation
1622 ;mbstring.encoding_translation = Off
1623 
1624 ; automatic encoding detection order.
1625 ; "auto" detect order is changed according to mbstring.language
1626 ; http://php.net/mbstring.detect-order
1627 ;mbstring.detect_order = auto
1628 
1629 ; substitute_character used when character cannot be converted
1630 ; one from another
1631 ; http://php.net/mbstring.substitute-character
1632 ;mbstring.substitute_character = none
1633 
1634 ; overload(replace) single byte functions by mbstring functions.
1635 ; mail(), ereg(), etc are overloaded by mb_send_mail(), mb_ereg(),
1636 ; etc. Possible values are 0,1,2,4 or combination of them.
1637 ; For example, 7 for overload everything.
1638 ; 0: No overload
1639 ; 1: Overload mail() function
1640 ; 2: Overload str*() functions
1641 ; 4: Overload ereg*() functions
1642 ; http://php.net/mbstring.func-overload
1643 ;mbstring.func_overload = 0
1644 
1645 ; enable strict encoding detection.
1646 ; Default: Off
1647 ;mbstring.strict_detection = On
1648 
1649 ; This directive specifies the regex pattern of content types for which mb_output_handler()
1650 ; is activated.
1651 ; Default: mbstring.http_output_conv_mimetype=^(text/|application/xhtml\+xml)
1652 ;mbstring.http_output_conv_mimetype=
1653 
1654 [gd]
1655 ; Tell the jpeg decode to ignore warnings and try to create
1656 ; a gd image. The warning will then be displayed as notices
1657 ; disabled by default
1658 ; http://php.net/gd.jpeg-ignore-warning
1659 ;gd.jpeg_ignore_warning = 1
1660 
1661 [exif]
1662 ; Exif UNICODE user comments are handled as UCS-2BE/UCS-2LE and JIS as JIS.
1663 ; With mbstring support this will automatically be converted into the encoding
1664 ; given by corresponding encode setting. When empty mbstring.internal_encoding
1665 ; is used. For the decode settings you can distinguish between motorola and
1666 ; intel byte order. A decode setting cannot be empty.
1667 ; http://php.net/exif.encode-unicode
1668 ;exif.encode_unicode = ISO-8859-15
1669 
1670 ; http://php.net/exif.decode-unicode-motorola
1671 ;exif.decode_unicode_motorola = UCS-2BE
1672 
1673 ; http://php.net/exif.decode-unicode-intel
1674 ;exif.decode_unicode_intel    = UCS-2LE
1675 
1676 ; http://php.net/exif.encode-jis
1677 ;exif.encode_jis =
1678 
1679 ; http://php.net/exif.decode-jis-motorola
1680 ;exif.decode_jis_motorola = JIS
1681 
1682 ; http://php.net/exif.decode-jis-intel
1683 ;exif.decode_jis_intel    = JIS
1684 
1685 [Tidy]
1686 ; The path to a default tidy configuration file to use when using tidy
1687 ; http://php.net/tidy.default-config
1688 ;tidy.default_config = /usr/local/lib/php/default.tcfg
1689 
1690 ; Should tidy clean and repair output automatically?
1691 ; WARNING: Do not use this option if you are generating non-html content
1692 ; such as dynamic images
1693 ; http://php.net/tidy.clean-output
1694 tidy.clean_output = Off
1695 
1696 [soap]
1697 ; Enables or disables WSDL caching feature.
1698 ; http://php.net/soap.wsdl-cache-enabled
1699 soap.wsdl_cache_enabled=1
1700 
1701 ; Sets the directory name where SOAP extension will put cache files.
1702 ; http://php.net/soap.wsdl-cache-dir
1703 soap.wsdl_cache_dir="/tmp"
1704 
1705 ; (time to live) Sets the number of second while cached file will be used
1706 ; instead of original one.
1707 ; http://php.net/soap.wsdl-cache-ttl
1708 soap.wsdl_cache_ttl=86400
1709 
1710 ; Sets the size of the cache limit. (Max. number of WSDL files to cache)
1711 soap.wsdl_cache_limit = 5
1712 
1713 [sysvshm]
1714 ; A default size of the shared memory segment
1715 ;sysvshm.init_mem = 10000
1716 
1717 [ldap]
1718 ; Sets the maximum number of open links or -1 for unlimited.
1719 ldap.max_links = -1
1720 
1721 [mcrypt]
1722 ; For more information about mcrypt settings see http://php.net/mcrypt-module-open
1723 
1724 ; Directory where to load mcrypt algorithms
1725 ; Default: Compiled in into libmcrypt (usually /usr/local/lib/libmcrypt)
1726 ;mcrypt.algorithms_dir=
1727 
1728 ; Directory where to load mcrypt modes
1729 ; Default: Compiled in into libmcrypt (usually /usr/local/lib/libmcrypt)
1730 ;mcrypt.modes_dir=
1731 
1732 [dba]
1733 ;dba.default_handler=
1734 
1735 [opcache]
1736 ; Determines if Zend OPCache is enabled
1737 ;opcache.enable=0
1738 
1739 ; Determines if Zend OPCache is enabled for the CLI version of PHP
1740 ;opcache.enable_cli=0
1741 
1742 ; The OPcache shared memory storage size.
1743 ;opcache.memory_consumption=64
1744 
1745 ; The amount of memory for interned strings in Mbytes.
1746 ;opcache.interned_strings_buffer=4
1747 
1748 ; The maximum number of keys (scripts) in the OPcache hash table.
1749 ; Only numbers between 200 and 100000 are allowed.
1750 ;opcache.max_accelerated_files=2000
1751 
1752 ; The maximum percentage of "wasted" memory until a restart is scheduled.
1753 ;opcache.max_wasted_percentage=5
1754 
1755 ; When this directive is enabled, the OPcache appends the current working
1756 ; directory to the script key, thus eliminating possible collisions between
1757 ; files with the same name (basename). Disabling the directive improves
1758 ; performance, but may break existing applications.
1759 ;opcache.use_cwd=1
1760 
1761 ; When disabled, you must reset the OPcache manually or restart the
1762 ; webserver for changes to the filesystem to take effect.
1763 ;opcache.validate_timestamps=1
1764 
1765 ; How often (in seconds) to check file timestamps for changes to the shared
1766 ; memory storage allocation. ("1" means validate once per second, but only
1767 ; once per request. "0" means always validate)
1768 ;opcache.revalidate_freq=2
1769 
1770 ; Enables or disables file search in include_path optimization
1771 ;opcache.revalidate_path=0
1772 
1773 ; If disabled, all PHPDoc comments are dropped from the code to reduce the
1774 ; size of the optimized code.
1775 ;opcache.save_comments=1
1776 
1777 ; If enabled, a fast shutdown sequence is used for the accelerated code
1778 ;opcache.fast_shutdown=0
1779 
1780 ; Allow file existence override (file_exists, etc.) performance feature.
1781 ;opcache.enable_file_override=0
1782 
1783 ; A bitmask, where each bit enables or disables the appropriate OPcache
1784 ; passes
1785 ;opcache.optimization_level=0xffffffff
1786 
1787 ;opcache.inherited_hack=1
1788 ;opcache.dups_fix=0
1789 
1790 ; The location of the OPcache blacklist file (wildcards allowed).
1791 ; Each OPcache blacklist file is a text file that holds the names of files
1792 ; that should not be accelerated. The file format is to add each filename
1793 ; to a new line. The filename may be a full path or just a file prefix
1794 ; (i.e., /var/www/x  blacklists all the files and directories in /var/www
1795 ; that start with 'x'). Line starting with a ; are ignored (comments).
1796 ;opcache.blacklist_filename=
1797 
1798 ; Allows exclusion of large files from being cached. By default all files
1799 ; are cached.
1800 ;opcache.max_file_size=0
1801 
1802 ; Check the cache checksum each N requests.
1803 ; The default value of "0" means that the checks are disabled.
1804 ;opcache.consistency_checks=0
1805 
1806 ; How long to wait (in seconds) for a scheduled restart to begin if the cache
1807 ; is not being accessed.
1808 ;opcache.force_restart_timeout=180
1809 
1810 ; OPcache error_log file name. Empty string assumes "stderr".
1811 ;opcache.error_log=
1812 
1813 ; All OPcache errors go to the Web server log.
1814 ; By default, only fatal errors (level 0) or errors (level 1) are logged.
1815 ; You can also enable warnings (level 2), info messages (level 3) or
1816 ; debug messages (level 4).
1817 ;opcache.log_verbosity_level=1
1818 
1819 ; Preferred Shared Memory back-end. Leave empty and let the system decide.
1820 ;opcache.preferred_memory_model=
1821 
1822 ; Protect the shared memory from unexpected writing during script execution.
1823 ; Useful for internal debugging only.
1824 ;opcache.protect_memory=0
1825 
1826 ; Allows calling OPcache API functions only from PHP scripts which path is
1827 ; started from specified string. The default "" means no restriction
1828 ;opcache.restrict_api=
1829 
1830 ; Mapping base of shared memory segments (for Windows only). All the PHP
1831 ; processes have to map shared memory into the same address space. This
1832 ; directive allows to manually fix the "Unable to reattach to base address"
1833 ; errors.
1834 ;opcache.mmap_base=
1835 
1836 ; Enables and sets the second level cache directory.
1837 ; It should improve performance when SHM memory is full, at server restart or
1838 ; SHM reset. The default "" disables file based caching.
1839 ;opcache.file_cache=
1840 
1841 ; Enables or disables opcode caching in shared memory.
1842 ;opcache.file_cache_only=0
1843 
1844 ; Enables or disables checksum validation when script loaded from file cache.
1845 ;opcache.file_cache_consistency_checks=1
1846 
1847 ; Enables or disables copying of PHP code (text segment) into HUGE PAGES.
1848 ; This should improve performance, but requires appropriate OS configuration.
1849 ;opcache.huge_code_pages=1
1850 
1851 [curl]
1852 ; A default value for the CURLOPT_CAINFO option. This is required to be an
1853 ; absolute path.
1854 ;curl.cainfo =
1855 
1856 [openssl]
1857 ; The location of a Certificate Authority (CA) file on the local filesystem
1858 ; to use when verifying the identity of SSL/TLS peers. Most users should
1859 ; not specify a value for this directive as PHP will attempt to use the
1860 ; OS-managed cert stores in its absence. If specified, this value may still
1861 ; be overridden on a per-stream basis via the "cafile" SSL stream context
1862 ; option.
1863 ;openssl.cafile=
1864 
1865 ; If openssl.cafile is not specified or if the CA file is not found, the
1866 ; directory pointed to by openssl.capath is searched for a suitable
1867 ; certificate. This value must be a correctly hashed certificate directory.
1868 ; Most users should not specify a value for this directive as PHP will
1869 ; attempt to use the OS-managed cert stores in its absence. If specified,
1870 ; this value may still be overridden on a per-stream basis via the "capath"
1871 ; SSL stream context option.
1872 ;openssl.capath=
1873 
1874 ; Local Variables:
1875 ; tab-width: 4
1876 ; End:
