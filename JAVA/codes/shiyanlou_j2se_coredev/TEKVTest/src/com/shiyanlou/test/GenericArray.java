package com.shiyanlou.test;

import java.util.ArrayList;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class GenericArray<T> {

    //定义一个容器
    private ArrayList<T> container;

    public GenericArray(){
        this.container=new ArrayList<T>();
    }

    public T get(int index){
        return this.container.get(index);
    }

    public void put(T value){
        container.add(value);
    }

    public void rm(int index){
        container.remove(index);
    }

    public int length(){
        return this.container.size();
    }

    public boolean isEmpty(){
        return this.container.isEmpty();
    }

}
