package com.test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by daiya on 2017/8/31.
 */
public class StaticTest {
    private static List<String> list;

    public void push(String val){
        if(list==null) list=new ArrayList<>();
        list.add(val);
    }

    public static List<String> getList() {
        return list;
    }

    public static void setList(List<String> list) {
        StaticTest.list = list;
    }
}
