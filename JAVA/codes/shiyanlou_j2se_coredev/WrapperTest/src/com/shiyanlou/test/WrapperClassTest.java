package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class WrapperClassTest {
    public static void main(String[] args){
        String str=new String("基本数据类型，也称原始数据类型。byte,short,char,int,long,float,double,boolean ");
        System.out.println(str);
        int num=new Integer("12");
        System.out.println(num);
        Double d1=new Double(12);
        Double d2=new Double(12);
        System.out.println(d1.doubleValue()==d2.doubleValue());    //直接比价会比较引用类型的内存地址
        Double d3=new Double(12);
        try {
            d3=Double.parseDouble("s_2");     //抛出了异常就不会执行这句
        }catch(NumberFormatException e){
            System.out.println("出错了");
            System.out.println(d3);
        }

        System.out.println(d3.isNaN());


    }

}
