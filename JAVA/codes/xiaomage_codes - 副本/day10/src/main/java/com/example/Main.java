package main.java.com.example;

/**
 * Created by DaiYan on 2017/7/5.
 */
public class Main {
    public static void main(String[] args){
        //实例内部类：只能拥有实例成员
        InstanceInnerClass innerClass=new InstanceInnerClass("Daniel",12);
        InstanceInnerClass.InnerInstance innerInstance=innerClass.new InnerInstance();
        System.out.println(innerInstance.toString());

        //静态内部类：可以拥有实例和静态成员,创建静态内部类的实例时不需要有外部类的实例
        StaticInnerClass.InnerStaticClass innerStaticClass=new StaticInnerClass.InnerStaticClass();
        System.out.println(innerStaticClass.innerName);
        StaticInnerClass.InnerStaticClass.outOutterName();
        StaticInnerClass.InnerStaticClass.outInnerName();

        //局部内部类
        final class LocalClass{
            public String name;
            public int age;
            public LocalClass(String name,int age){
                this.name=name;
                this.age=age;
            }
        }

        LocalClass localClass=new LocalClass("Danile",12);
        System.out.println(localClass.name);


    }
}
