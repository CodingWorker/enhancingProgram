package com.shiyanlou.test;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class People {
    //成员变量
    private String name;
    private int age;
    private String address;

    //构造方法
    public People(String name,int age,String address){
        this.name=name!=null?name:"unknown";
        this.age=age;
        this.address=address!=null?address:"unkown";
    }

    //getter and  setter
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name=name;
    }
}
