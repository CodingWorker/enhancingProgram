package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class TEKVTest {
    public static void main(String[] args) throws Exception{
        Class<?> classType=Class.forName("java.lang.String");
        GenericArray<Integer> arr=new GenericArray<Integer>();
        arr.put(1);
        arr.put(2);
        System.out.println(arr.get(1));
    }
}
