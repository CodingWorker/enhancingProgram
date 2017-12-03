package com.test.study.lambdademo;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class StreamAndCollect {
    public static void main(String[] args) {
        List<Integer> numbers= Arrays.asList(1,2,3,4,5,6);
        System.out.println("old data:");
        numbers.forEach((v)-> System.out.println(v));

        List<Integer> numbersNew=numbers.stream()
                .map((v)->v*v)
                .collect(Collectors.toList());
        System.out.println("new data:");
        numbersNew.forEach((v)-> System.out.println(v));

        List<String> stringList=Arrays.asList("USA", "Japan", "France", "Germany", "Italy", "U.K.","Canada");
        System.out.println("join with ,:");
        String joinStr=stringList.stream()
        .collect(Collectors.joining(", "));
        System.out.println(joinStr);
    }
}
