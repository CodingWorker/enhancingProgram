package chapter02.item03.SingletonDemo;

/**
 * Created by DaiYan on 2017/4/18.
 */

/**
 * Test是单例的
 * 通过静态方法返回私有静态变量
 */

public class ShiXianDemo2 {
    private ShiXianDemo2(){}
    /*
    private static ShiXianDemo2 INSTANCE=new ShiXianDemo2();

    public static ShiXianDemo2 getInstance(){
        if(null==_instance)
            _instance=new ShiXianDemo2();

        return _instance;
    }
    */
    //方法2：
    private static final ShiXianDemo2 INSTANCE=new ShiXianDemo2();

    public static ShiXianDemo2 getInstance(){
        return INSTANCE;
    }
}
