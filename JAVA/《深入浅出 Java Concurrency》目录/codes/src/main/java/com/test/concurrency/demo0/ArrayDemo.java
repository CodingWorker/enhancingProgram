package com.test.concurrency.demo0;

import com.sun.org.apache.xpath.internal.SourceTree;

import java.util.concurrent.atomic.AtomicIntegerArray;

/**
 * Created by DaiYan on 2017/9/9.
 */
public class ArrayDemo {
    public static void main(String[] args){
        AtomicIntegerArray array=new AtomicIntegerArray(10);

        //获取索引为0的值
        System.out.println(array.get(0));//0

    }
}
