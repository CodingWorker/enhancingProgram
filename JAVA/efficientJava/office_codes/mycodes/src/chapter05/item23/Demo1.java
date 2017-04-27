package chapter05.item23;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/27.
 */
public class Demo1 {
    public static void main(String[] args){
        List<String> strList=new ArrayList<>();
        strList.add("a");

        //test(strList);//这样是错误的，List<String>不是List<Object>的类型也不是其子类型

        List<Object> objList=new ArrayList<>();
        objList.add("a");
    }

    public static void test(List<Object> objects){

    }
}
