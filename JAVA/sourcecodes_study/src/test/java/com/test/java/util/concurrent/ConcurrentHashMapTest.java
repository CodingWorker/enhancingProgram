package com.test.java.util.concurrent;

import org.junit.Test;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/10/26
 * Project: my-study
 */
public class ConcurrentHashMapTest {
    @Test
    public void run(){
        //获取cpu核心数
        int count=Runtime   .getRuntime().availableProcessors();//8,这个值不怎么准确
        System.out.println(count);
    }
}
