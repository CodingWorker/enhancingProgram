package main.java.com.example;

import java.lang.System;
/**
 * Created by DaiYan on 2017/7/10.
 */
public class StringDemo {
    public static void main(String[] args) {
        String s1 = "ABCD";
        String s2 = new String("ABCD");

        System.out.println(s1 == s2);
        System.out.println(s1.equals(s2));
        System.out.println(s1.hashCode());//strin重写了equals方法则必然重写了hashCode方法
        System.out.println(s2.hashCode());
    }

    //空间局部性的例子
    public void test(){
        int sum=0;

        //
    }

    public int[] generateNum(){
        int[][] nums=new int[100][100];
        for(int i=0;i<nums.length;i++){
            nums[i]=i*2+1;
        }

        return nums;
    }
}
