package com.shiyanlou.test;

import javax.lang.model.element.NestingKind;
import java.util.Random;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class MathTest {
    public static void main(String[] args){
        double pi= Math.sin(0.5*Math.PI);
        System.out.println(Math.asin(1)*2);
        System.out.println(Math.E);
        System.out.println(Math.random()*10+1);
        Random r=new Random();
        System.out.println(r.nextBoolean());
        System.out.println(r.nextInt(100));    //100为随机数的上限，不带参数的话以最大值为上限
    }

}
