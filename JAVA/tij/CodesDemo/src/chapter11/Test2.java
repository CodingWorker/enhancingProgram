package chapter11;

import sun.plugin2.message.TextEventMessage;

import java.awt.font.TextHitInfo;

/**
 * Created by DaiYan on 2017/6/15.
 */
class Temp{
    public Temp(){
        this.a=12;
        System.out.println("the constructor with no params is called");
    }

    public Temp(int a){
        this.a=a;
        System.out.println("the constructor is called");
    }
    private int a;
    public int getA(){
        return this.a;
    }

}

public class Test2 {
    public static void main(String[] args){
        try {
            Temp t = Temp.class.newInstance();
        }catch (InstantiationException e){
            e.printStackTrace();
        }catch (IllegalAccessException e){
            e.printStackTrace();
        }
    }

}
