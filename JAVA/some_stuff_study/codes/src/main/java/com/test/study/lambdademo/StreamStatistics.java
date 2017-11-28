package com.test.study.lambdademo;

import java.text.ParseException;
import java.util.Arrays;
import java.util.IntSummaryStatistics;
import java.util.List;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class StreamStatistics {
    public static void main(String[] args) {
        List<Integer> primes = Arrays.asList(2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
        IntSummaryStatistics intSummaryStatistics= primes.stream()
                .mapToInt((x)->x)
                .summaryStatistics();

        System.out.println("max: "+intSummaryStatistics.getMax());
        System.out.println("min: "+intSummaryStatistics.getMin());
        System.out.println("avg: "+intSummaryStatistics.getAverage());
        System.out.println("count: "+intSummaryStatistics.getCount());
        System.out.println("sum: "+intSummaryStatistics.getSum());
    }
}
