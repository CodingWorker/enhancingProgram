package com.test.study.lambdademo;

import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class LambdaAndPredicateDemo {
    public static void main(String[] args) {
        List<String> stringList= Arrays.asList("Java", "Scala", "C++", "Haskell", "Lisp","C","PHP","CSS","HTML");
        System.out.println("output:start with J:");
        filter(stringList,(str)->((String)str).startsWith("J"));

        System.out.println("output:start with C:");
        filter(stringList,(str)->((String)str).startsWith("C"));

        System.out.println("output:end with a:");
        filter(stringList,(str)->((String)str).endsWith("a"));

        System.out.println("print all:");
        filter(stringList,(str)->true);

        System.out.println("print none:");
        filter(stringList,(str)->false);

        System.out.println("print length>3:");
        filter(stringList,(str)->((String)str).length()>3);

        System.out.println("合并多条Predicate:");
        Predicate<String> p1=(param)->param.startsWith("C");
        Predicate<String> p2=(param)->((String)param).length()>2;
        filter(stringList,p1.and(p2));
    }

    private static void filter(List<String> stringList, Predicate condition){
        stringList.forEach((str)->{
            if(condition.test(str))
                System.out.print(str+" , ");
        });
        System.out.println();
    }
}
