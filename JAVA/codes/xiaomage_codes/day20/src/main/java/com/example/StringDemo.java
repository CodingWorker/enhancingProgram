package main.java.com.example;

import java.lang.System;
/**
 * Created by DaiYan on 2017/7/10.
 */
public class StringDemo {
    public static void main(String[] args){
        String s1="ABCD";
        String s2=new String("ABCD");

        System.out.println(s1==s2);
        System.out.println(s1.equals(s2));
        System.out.println(s1.hashCode());//strin重写了equals方法则必然重写了hashCode方法
        System.out.println(s2.hashCode());





        
    }
}
