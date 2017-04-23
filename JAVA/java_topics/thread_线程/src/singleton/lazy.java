package singleton;

/**
 * Created by DaiYan on 2017/4/23.
 */

import com.sun.org.apache.xpath.internal.WhitespaceStrippingElementMatcher;
import sun.text.resources.in.FormatData_in;

/**
 * 单例模式的懒加载存在线程安全问题
 */
class Test{
    private static Test _instance;
    synchronized public static Test getInstance(){//同步机制避免线程安全问题，但是synchronized的
        //作用域太大影响性能，只需要修饰下面的代码块即可，不需要同步方法
        if(null==_instance)
            _instance=new Test();

        return _instance;
    }
}

public class lazy {
}
