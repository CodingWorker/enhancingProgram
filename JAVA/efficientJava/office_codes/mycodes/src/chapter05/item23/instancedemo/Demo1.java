package chapter05.item23.instancedemo;

import chapter11.item75.StringList;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/27.
 */
public class Demo1 {
    public static void main(String[] args){
        //instanceof不可以用于参数化的泛型
        List<String> strList=new ArrayList<>();
        if(strList instanceof List)//这样是非法的
        {

        }


    }

    public static void test(List<?> list){
        String str="";
        if(list instanceof List){

        }
    }
}
