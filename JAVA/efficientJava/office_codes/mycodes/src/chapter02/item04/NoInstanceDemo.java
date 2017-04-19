package chapter02.item04;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class NoInstanceDemo {
    private NoInstanceDemo()throws Exception{
        //防止在类的内部调用私有构造器
        throw new Exception();
    }
}
