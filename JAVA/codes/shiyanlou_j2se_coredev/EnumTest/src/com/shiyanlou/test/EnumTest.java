package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class EnumTest {
    public static void main(String[] args){
        Week mon=Week.Monday;
        System.out.println(mon.getAbbr());

        Country china=Country.China;
        System.out.println(china.getZhName());
        System.out.println(china.getEnName());
        System.out.println(china.getCapital());

    }
}
