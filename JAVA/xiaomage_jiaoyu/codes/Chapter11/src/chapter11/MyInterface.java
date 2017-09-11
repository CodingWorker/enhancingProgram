package chapter11;

/**
 * Created by DaiYan on 2017/3/27.
 */
interface MyInterface {
    String fieldName="abc";   //接口变量自动为static final的，所以需要定义时初始化
    int age=12;
    int a= chapter11.Main.a;     //只会被初始化一次

    class InternalClass{
        public static int a=12;
    }
}
