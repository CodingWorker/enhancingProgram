package initcodeblock;

/**
 * Created by DaiYan on 2017/6/28.
 */
class Test{
    //静态代码块，在类被调用时会被调用，而且只被调用一次即再次调用时不会再执行
    static{
        System.out.println("out put from static block");
    }

    public static void t(){
        System.out.println("t is called");
    }
}
public class StaticTest {
    public static void main(String[] args){
        Test.t();
        Test.t();
    }
}
