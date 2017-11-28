package com.test.study.lambdademo;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/27
 * Project: some-stuff-study
 */
public class LambdaThis {
    private int count;
    public static void main(String[] args) {
        new LambdaThis().testThis();
    }

    public void testThis(){
        //lambda中的this指代外面包围的类
        Runnable runnable=()->{
            for(;;){
                System.out.println(this.count++);
                if(this.count>10){
                    break;
                }
            }
        };

        new Thread(runnable).start();
    }
}
