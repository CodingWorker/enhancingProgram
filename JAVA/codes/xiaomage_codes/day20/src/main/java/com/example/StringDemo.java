package main.java.com.example;

import java.lang.System;
import java.sql.Time;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

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
        test();
    }

    //空间局部性的例子
    public static void test(){
        int[][] nums1=generateNum();
        int[][] nums2=generateNum();
        int sum1=0;
        int sum2=0;

        long start1=System.currentTimeMillis();
        //先行后列遍历
        for(int i=0;i<100;i++){
            for(int j=0;j<100l;j++){
                sum1+=nums1[i][j];
            }
        }
        long end1=System.currentTimeMillis();

        long start2=System.currentTimeMillis();
        //先列后行遍历
        for(int i=0;i<100;i++){
            for(int j=0;j<100;j++){
                sum2+=nums2[j][i];
            }
        }
        long end2=System.currentTimeMillis();

        long timeSpan1=end1-start1;
        long timeSpan2=end2-start2;
        System.out.println(timeSpan1);//1
        System.out.println(timeSpan2);//0

    }

    public static int[][] generateNum(){
        int[][] nums=new int[100][100];
        for(int i=0;i<nums.length;i++){
            for(int j=0;j<100;j++){
                nums[i][j]=2*i+j;
            }
        }

        return nums;
    }
}
