package Chapter07;

/**
 * Created by DaiYan on 2017/6/13.
 */
class SuperClass{

}


public class Test3 {
    private static int a;
    public static void main(String[] args){

    }

    public static void test(){}

    public void test2(){
        Temp t=new Temp();
    }

    public static SuperClass getInnerObject(){
        SuperClass sc=new SuperClass();
        //return new SuperClass();//这是返回一个SuperClass
        return new SuperClass(){//这是返回一个匿名内部类，此类继承自SuperClass
            public int a;
            public SuperClass scc=sc;
            public void test(){
                int a=Test3.a;//可以访问到直接外部类的私有成员
                Test3.test();
            }
        };
    }

    public static class Temp{
        public int a;
        public int b;
    }
}
