package com.test.java.lang;

import com.sun.org.apache.xpath.internal.SourceTree;

/**
 * Created by IntelliJ IDEA
 * Project: sourcecodes_study
 * User: DaiYan
 * Date: 2017/10/5
 */
public class IntegerTest {
    public static void main(String[] args) {
        IntegerTest integerTest=new IntegerTest();
        integerTest.toHex();
    }

    //int的min 和 max
    public void minAndMax(){
        System.out.println(Integer.MIN_VALUE);//-2147483648
        System.out.println(Integer.MAX_VALUE);//2147483647
    }

    //Type
    public void type(){
        System.out.println(Integer.TYPE);//int
    }

    //char to int
    public void charToInt(){
        System.out.println(123);
        System.out.println((int)'A');//65
        System.out.println((int)'a');//97
    }

    //数字的进制表示
    public void radixInt(){
        System.out.println(Integer.toString(-12,2));//-1100
        System.out.println(Integer.toString(12,10));//12
    }

    //to unsigned radix
    public void unsignedRadixInt(){
        System.out.println(Integer.toUnsignedString(-120,2));
        System.out.println(Integer.toString(-120,2));
    }

    //to hex oct
    public void toHex(){
        System.out.println(Integer.toHexString(126));//7e
        System.out.println(Integer.toOctalString(126));//176
    }

}
