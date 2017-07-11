package day23.main.java.com.exmple;

import java.lang.reflect.Constructor;

/**
 * Created by DaiYan on 2017/7/11.
 */
public class Main {
    public static void main(String[] args)throws Exception{
        Class clz1=ReflectDemo.class;
        Class clz2=new ReflectDemo().getClass();
        Class clz3=Class.forName("day23.main.java.com.exmple.ReflectDemo");
        System.out.println(clz1==clz2);
        System.out.println(clz1==clz3);

        Constructor constructor=clz1.getConstructor();
        ReflectDemo reflectDemo=(ReflectDemo) constructor.newInstance();
        System.out.println(reflectDemo);

    }
}
