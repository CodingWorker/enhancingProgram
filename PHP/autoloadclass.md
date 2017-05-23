#自动载入类

## `__autoload`自动加载函数

1. 
		function __autoload($class_name) {
			echo '__autoload class:',$class_name,'<br/>';
		}
		
		new Demo();
输出结果：

	__autload class:Demo。
	并在此之后报错显示： Fatal error: Class ‘Demo’ not found

2. __autoload实现类的自动加载

**file1**

		<?php
		function __autoload($class_name) {
			require $class_name.'.class.php';
		}
		
		$demo=new Demo();   

**Demo.class.php**
	
		<?php
		class Demo
		{
			public function __construct()
			{
				echo __CLASS__;
			}
		}

输出结果： Demo

    我们可以看出_autoload至少要做三件事情，第一件事是根据类名确定类文件名，第二件事是确定类文件所在的磁盘路径(在我们的例子是最简单的情况，类与调用它们的PHP程序文件在同一个文件夹下)，第三件事是将类从磁盘文件中加载到系统中。第三步最简单，只需要使用include/require即可。要实现第一步，第二步的功能，必须在开发时约定类名与磁盘文件的映射方法，只有这样我们才能根据类名找到它对应的磁盘文件。 
    
    因此，当有大量的类文件要包含的时候，我们只要确定相应的规则，然后在__autoload()函数中，将类名与实际的磁盘文件对应起来，就可以实现lazy loading的效果。从这里我们也可以看出__autoload()函数的实现中最重要的是类名与实际的磁盘文件映射规则的实现。 
    
    但现在问题来了，假如在一个系统的实现中，假如需要使用很多其它的类库，这些类库可能是由不同的开发工程师开发，其类名与实际的磁盘文件的映射规则不尽相同。这时假如要实现类库文件的自动加载，就必须在__autoload()函数中将所有的映射规则全部实现，因此__autoload()函数有可能会非常复杂，甚至无法实现。最后可能会导致__autoload()函数十分臃肿，这时即便能够实现，也会给将来的维护和系统效率带来很大的负面影响。在这种情况下，在PHP5引入SPL标准库,一种新的解决方案，即spl_autoload_register()函数。

##`spl_autoload_register`函数

此函数的功能是把函数注册至SPL的`__autoload`函数栈中，并移除系统默认的`__autoload`函数。


示例：

	<?php
	function __autoload($class_name) {
		echo '__autoload class:', $class_name, '<br/>';
	}
	
	function classLoader($class_name) {
		echo 'SPL load class:', $class_name, '<br/>';
	}
	
	spl_autoload_register('classLoader');
	
	new Test();

输出结果：`SPL load class:Test`，并报错，报错是因为没有找到该类

可见这个函数`spl_autoload_register`将`__autoload`函数移除了

如果将注释掉`spl_autoload_register`函数，则输出结果
`__autoload class:Test`，并报错，报错是因为没有找到该类

语法：

		语法：bool  spl_autoload_register ( [callback $autoload_function] )    接受两个参数：一个是添加到自动加载栈的函数，另外一个是加载器不能找到这个类时是否抛出异常的标志。第一个参数是可选的，并且默认指向spl_autoload()函数，这个函数会自动在路径中查找具有小写类名和.php扩展或者.ini扩展名，或者任何注册到spl_autoload_extensions()函数中的其它**扩展名**的文件。

示例：

	class CalssLoader     
	{     
	    public static function loader($classname)     
	    {     
	        $class_file = strtolower($classname).".class.php";     
	        if (file_exists($class_file)){     
	            require_once($class_file);     
	        }     
	    }     
	}      
	// 方法为静态方法     
	spl_autoload_register('CalssLoader::loader');      
	$test = new Demo(); 

输出结果：Demo

**一旦调用spl_autoload_register()函数，当调用未定义类时，系统会按顺序调用注册到spl_autoload_register()函数的所有函数，而不是自动调用__autoload()函数-该函数被屏蔽了。如果要避免这种情况，需采用一种更加安全的spl_autoload_register()函数的初始化调用方法：**

	function loader() {

	}    
	    
	spl_autoload_register('loader');      
	var_dump(spl_autoload_functions());
	输出结果：
	array (size=1)
  	  0 => string 'loader' (length=6)

如果注释掉注册函数`spl_autoload_register('loader');`，输出结果为bool false

为了避免调用未定义的类，可以采用函数spl_autoload_functions()函数来判断

	spl_autoload_register('loader');      
	var_dump(spl_autoload_functions());

虽然注册了函数，**但是并没有定义该自动加载函数，因此会报错**

	spl_autoload_register('loader');      
	if(false === spl_autoload_functions()){      
	    if(function_exists('__autoload')){      
	        spl_autoload_register('__autoload',false);      
	    }      
	 }

	function __autoload($class_name) {
		echo '__autoload class:',$class_name;
		require $class_name.'.class.php';
	} 
	
	new Demo();

输出结果：`__autoload class:DemoDemo`

**spl_autoload_functions()函数会返回已注册函数的一个数组,如果SPL自动加载栈还没有被初始化,它会返回布尔值false。然后，检查是否有一个名为__autoload()的函数存在,如果存在，可以将它注册为自动加载栈中的第一个函数，从而保留它的功能。之后，可以继续注册自动加载函数。**

还可以**调用`spl_autoload_register()`函数以注册一个回调函数,而不是为函数提供一个字符串名称**。如提供一个如array('class','method')这样的数组,使得可以使用某个对象的方法。



**下一步，通过调用`spl_autoload_call('className')`函数，可以手动调用加载器，而不用尝试去使用那个类。这个函数可以和函数`class_exists('className',false)`组合在一起使用以尝试去加载一个类，并且在所有的自动加载器都不能找到那个类的情况下失败。**

	f(spl_autoload_call('className') && class_exists('className',false)){      
    
    } else {      
    }  

SPL自动加载功能是由`spl_autoload() ,spl_autoload_register(), spl_autoload_functions() ,spl_autoload_extensions()`和`spl_autoload_call()`函数提供的。

###`spl_autoload_register`函数调用静态方法

		class Test
		{
			public static function load($class_name) {//必须声明为静态
				require $class_name.'.class.php';
			}
		}
		
		spl_autoload_register(array('Test', 'load'));
		new Demo();

输出结果：Demo

##Yii框架的自动加载类

	<?php
	class YiiBase
	{
		public static function autoload($className)
		      {
		          // use include so that the error PHP file may appear
		          if(isset(self::$_coreClasses[$className]))
		              include(YII_PATH.self::$_coreClasses[$className]);
		          else if(isset(self::$_classes[$className]))
		              include(self::$_classes[$className]);
		          else
		          {
		              include($className.'.php');
		              return class_exists($className,false) || interface_exists($className,false);
		          }
		          return true;
		      }
		private static $_coreClasses=array(
		          'CApplication' => '/base/CApplication.php',
		          'CApplicationComponent' => '/base/CApplicationComponent.php',
		          'CBehavior' => '/base/CBehavior.php',
		          'CComponent' => '/base/CComponent.php',
		          'CErrorEvent' => '/base/CErrorEvent.php',
		          'CErrorHandler' => '/base/CErrorHandler.php',
		          'CException' => '/base/CException.php',
		);
	 
	}
	 
	spl_autoload_register(array('YiiBase','autoload'));

- **注意：静态加载类一定要用静态方法,static**

- 通过条件判断来把相应的文件include进去。这样，可以根据需要来include文件而不是全盘包含进去，性能会好一些的。


