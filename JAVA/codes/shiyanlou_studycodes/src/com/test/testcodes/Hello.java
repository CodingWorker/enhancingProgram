package com.test.testcodes;

/**
 * Created by DaiYan on 2017/2/3.
 */
public class Hello {
    public Hello(){   //任何地方都可以访问
        System.out.println("construct method of Hello");
    }

    static void hello(){     //默认的访问控制符只能在类内部和同一个包内被访问的到
        System.out.println("welcome to java!");

    }

    public void test(){   //仅能在类内部 同一个包内和子类中被访问
        System.out.println("Hello::test() is called");
        this.hello();
    }

    public static void test2(){
        System.out.println("Hello::test2");
    }

    public final static String info="Hello::info";

    private static SubHello _sh=null;
    public SubHello getSubClass(){
        if(null==_sh){
            _sh=new SubHello();
        }

        return _sh;
    }


    public class SubHello{
//        public String info="SubHello::info";
        public SubHello(){
            System.out.println("SubHello class is inside of Hello class");
            System.out.println(info);
//            System.out.println(this.info);

        }

        public void test(){
            System.out.println("SubHello::test() is called");
        }
    }

    public static class SubHello2{
        SubHello sh=new Hello().getSubClass();    //内部静态类访问外部非静态方法需要new 外部类
        public SubHello2(){
            test2();      //静态类成员可以直接访问外部类的静态方法
        }
    }

    public void helloInfo(){
        class cc{
            public String name="helloInfo";
            public int age=12;

            public void printInfo() {
                System.out.println(String.format("name: %s, age: %d", name, age));
            }
        }

        cc c=new cc();
        c.name+=" is a good name";
        c.printInfo();
    }

}
