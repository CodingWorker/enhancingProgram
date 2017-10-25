package com.test.java.util;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/10/25
 * Project: my-study
 */
public class HashMapTest {
    @Test
    public void run(){
        Map<String,String> map=new HashMap<>();
        map.put("key1","value1");
        System.out.println(map.size());
    }

    @Test
    public void run1(){
        Map<MyClass,String> map=new HashMap<>(1);
        MyClass myClass1=new MyClass(1);
        MyClass myClass2=new MyClass(1);
        map.put(myClass2,"a");
        System.out.println(map.put(myClass1,"b"));
        System.out.println(map.containsValue("a"));//true,由此可见显示使用hashcode,然后在单项链表中使用equals比较key的是否相等
        //如果相等的话就将原值替换为新的值，如果不相等的话就放在链表的头部即第一个
    }

    @Test
    public void run2(){
        HashMap<String,String> map1=new HashMap<>();
        HashMap<String,String> map2=(HashMap<String, String>) map1.clone();
        System.out.println(map1==map2);
    }

}

class MyClass{
    private  int a;
    public MyClass(int a){
        this.a=a;
    }
    @Override
    public boolean equals(Object obj) {
        MyClass o=(MyClass)obj;
        return this.a!=o.a;
    }

    @Override
    public int hashCode() {
        return 12;
    }
}