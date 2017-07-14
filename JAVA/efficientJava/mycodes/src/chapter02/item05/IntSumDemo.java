package chapter02.item05;

import java.sql.SQLSyntaxErrorException;

/**
 * Created by DaiYan on 2017/4/19.
 */
public class IntSumDemo {
    public static void main(String[] args){
//        Long sum=0L;   //bad
        long sum=0L;     //good
        for(int i=0;i<Integer.MAX_VALUE;){
            sum+=i++;
        }

        System.out.println(sum);
    }
}
