package chapter02.item03.SingletonDemo;

/**
 * Created by DaiYan on 2017/4/18.
 */

/**
 * Test 类是单例的:
 * 定义一个公有的可访问的final的静态变量
 */
class Test{
    private Test(){}
    public static final Test instance=new Test();
}

public class ShiXianDemo1 {

}


