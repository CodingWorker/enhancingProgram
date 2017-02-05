package com.shiyanlou.test.test;

/**
 * Created by Administrator on 2017/2/5.
 */
public class HumanFactory {
    public static Human createHuman(String gender){
        Human h=null;
        if(gender.equals("man")) {
            h = new Man();
        }else if(gender.equals("woman")){
            h=new Woman();
        }

        return h;
    }
}
