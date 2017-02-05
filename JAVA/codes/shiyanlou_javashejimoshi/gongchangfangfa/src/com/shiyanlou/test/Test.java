package com.shiyanlou.test;

import com.shiyanlou.test.test.Human;

/**
 * Created by Administrator on 2017/2/5.
 */
public class Test {
    public static void main(String[] args){
        Human man=new ManFactory().createHuman();
        Human woman=new WomanFactory().createHuman();
        man.eat();
        woman.beat();
    }
}
