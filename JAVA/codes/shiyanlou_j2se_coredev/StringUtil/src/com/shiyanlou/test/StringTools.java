package com.shiyanlou.test;

import jdk.internal.cmm.SystemResourcePressureImpl;

import java.util.Scanner;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class StringTools {
    public static void main(String[] args){
        String str="    •\tString substring(int beginIndex, int endIndex)，\r\n该方法返回一个新字符串，新的字符串包含原来字符串中从";
        String subStr1=str.substring(5,10);
        CharSequence subStr2=str.subSequence(3,5);
        String subStr3=str.trim();
        System.out.println(subStr1);
        System.out.println(subStr2);
        System.out.println(subStr3);
        String s1="string";
        String s2="STRING";
        System.out.println(s1==s2);
        Scanner scan=new Scanner(System.in);     //自动会启动一个等待输入的入口
//        System.out.println("Please input a number: ");
        String a=scan.nextLine();
        System.out.println(a);

    }

}
