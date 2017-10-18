package com.test.resume.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

/**
 * Created by IntelliJ IDEA
 * Project: resume-app
 * User: DaiYan
 * Date: 2017/10/18
 */
public class ReflectDemo {
    public static void main(String[] args) throws Exception{
        Demo demo=new Demo();
        System.out.println(demo.getClass());
        System.out.println(Demo.class);
        System.out.println(Class.forName("com.test.resume.reflect.ReflectDemo$Demo"));
        System.out.println(Integer.TYPE);

        Class claz=demo.getClass();
        Field[] fields= claz.getDeclaredFields();
        System.out.println(fields.length);
        for(Field field:fields){
            System.out.println(field.getName());
        }
        Annotation[] annotations=claz.getAnnotations();
        System.out.println(annotations.length);//0
        for(Annotation annotation:annotations){
            System.out.println(annotation.toString());
        }
    }

    /**
     * comment
     */
    @Deprecated
    static class Demo{
        /**
         * id
         */
        private int id;
        private String name;
        private int age;
    }

}
