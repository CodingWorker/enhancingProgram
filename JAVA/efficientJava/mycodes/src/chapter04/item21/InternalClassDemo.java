package chapter04.item21;

import com.sun.org.apache.xpath.internal.patterns.ContextMatchStepPattern;

import java.io.Serializable;
import java.util.SimpleTimeZone;

/**
 * Created by DaiYan on 2017/4/26.
 */
public class InternalClassDemo {  //这里应该命名为比较类名，表示这是一个提供某种方法的类
    //使用静态私有的类实现多个接口，而匿名类只能通过一个接口创建
    private static class StrLen implements
            Comparator<String>,Serializable{
        @Override
        public int compare(String s1,String s2){
            return s1.length()-s2.length();
        }

        //导出内部创建得到私有类为静态域
        public static final Comparator<String> STRING_COMPARATOR=new StrLen();
    }
}
