package com.test.study.lambdademo;

import com.sun.org.apache.xpath.internal.SourceTree;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class StreamAndMap {
    public static void main(String[] args) {
        //不使用stream和map
        List<Integer> v1= Arrays.asList(1,2,3,4,5);
        List<Double> v1New=new ArrayList<>();
        for(Integer v:v1){
            double newV=v*1.12;
            v1New.add(newV);
        }

        System.out.println("old method:");
        v1New.forEach((v)-> System.out.println(v));

        //使用stream和map
        List<Double> v1New2=new ArrayList<>();
        v1.stream()
        .map((v)->v*1.12).forEach((v)->v1New2.add(v));

        System.out.println("new method:");
        v1New2.forEach((v)-> System.out.println(v));

        //统计总的税收
        System.out.println("统计总的税收:");
        double bill= v1.stream()
        .map((v)->v*1.12)
        .reduce((sum,item)->sum+item).get();
        System.out.println(bill);
    }
}
