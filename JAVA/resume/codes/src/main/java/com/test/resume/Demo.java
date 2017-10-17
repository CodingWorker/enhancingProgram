package com.test.resume;

/**
 * Created by IntelliJ IDEA
 * Project: resume-app
 * User: DaiYan
 * Date: 2017/10/17
 */
public class Demo {
    public static void main(String[] args) {
        String str1="abc";
        String str2=new String("abc");
        String str3="a"+"b"+"c";
        System.out.println(str1==str2);
        System.out.println(str1==str3);
        System.out.println(str1==str1.intern());
        System.out.println(Food.Coffee.CAPPUCCINO);
    }

    static class StaticInnerClass{

    }

    class innerClass{

    }
}

class Demo1{
    public static void main(String[] args) {
        //可以不依赖外部对象直接实例化
        Demo.StaticInnerClass staticInnerClass=new Demo.StaticInnerClass();

        Demo demo=new Demo();
        //需要依赖外部类的对象
        Demo.innerClass innerClass=demo.new innerClass();
    }
}
