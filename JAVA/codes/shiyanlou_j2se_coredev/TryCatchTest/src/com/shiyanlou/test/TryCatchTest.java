package com.shiyanlou.test;

import java.util.List;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class TryCatchTest {
    public static void main(String[] args) throws Exception{
        int a=10;
        int b=0;
        try{
            double c=((double)a)/b;
            System.out.println(c);
        }catch(ArithmeticException e){
//            e.printStackTrace();
            System.out.println("some exception show\r\n" +e);
        }

        int[] num_arr=new int[] {1,3,2,4};
        System.out.println(num_arr[1]);
        try {
            System.out.println(num_arr[12]);
        }catch(ArrayIndexOutOfBoundsException e){
            System.out.println("exception show \r\n"+e);
        }

        People p=null;
        try {
            p.getName();
        }catch(NullPointerException e){
            System.out.println("some exception show \r\n"+e);
            String c=null;
            try {
                c.charAt(12);
            }catch(Exception ex){
                System.out.println("some exception show \r\n"+ex);
                System.out.println(ex.getLocalizedMessage());
            }
        }finally {
            System.out.println("finally is called");
        }

        try {
            throw new MyException("my exception is shown");
        }catch(MyException e){
            System.out.println(e.getMessage());
//            e.printStackTrace();
            System.out.println(e.getLocalizedMessage());
        }finally{
            System.out.println("finally is called");
        }

        try {
            int ac=1/2;
            System.out.println("return is next");
            return;
        }finally {
            System.out.println("zhixingle");
        }

//        System.out.println("不会被执行");

    }
}
