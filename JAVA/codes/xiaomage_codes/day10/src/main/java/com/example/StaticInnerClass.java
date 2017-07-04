package main.java.com.example;

import javax.lang.model.element.NestingKind;

/**
 * Created by DaiYan on 2017/7/5.
 */
public class StaticInnerClass {
    public String name;
    public int age;

    public static String className(){
        return StaticInnerClass.class.getName();
    }

    public static class InnerStaticClass{
        public String innerName;
        public static void outOutterName(){
            System.out.println(className());
        }

        public static void outInnerName(){
            System.out.println(InnerStaticClass.class.getName());
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
