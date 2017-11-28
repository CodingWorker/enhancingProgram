package com.test.study.lambdademo;

import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class CollectionOptDemo {
    public static void main(String[] args) {
        //迭代列表
        List<String> strings= Arrays.asList("a","b","c");
        //原始的foreach方法
        System.out.println("========原始的foreach方法========");
        for(String str:strings){
            System.out.println(str);
        }

        //lambda方法
        System.out.println("=======lambda方法==========");
        strings.forEach((str)-> System.out.println(str));

        //使用方法的引用
        System.out.println("=======方法的引用=========");
        strings.forEach(System.out::println);
    }
}
