package com.test.java.lang;

/**
 * Created by daiya on 2017/9/11.
 */
class Person {
    private String name;
    private int age;
    public Person(){}

    public Person(Person oldClass){
        this.name=oldClass.name;      //private变量可以在类的内部被访问
        this.age=oldClass.age;
    }
}

public class String {
    public static void main(String[] args){
        Person p=new Person();

    }
}
