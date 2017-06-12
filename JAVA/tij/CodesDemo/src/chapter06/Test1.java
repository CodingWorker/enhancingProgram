package chapter06;

/**
 * Created by DaiYan on 2017/6/12.
 */

class ConstTest{
    public final int a;

    public ConstTest(int a){
        this.a=a;//只允许被初始化一次
    }

    public void t1(final int a){//声明为final的自变量不能在方法中修改

    }

}

abstract class Demo extends Number{}

public class Test1 {
    public static void main(String[] args){
        final String name;
        name="";
    }
}
