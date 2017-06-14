package chapter09;

import java.io.IOException;

/**
 * Created by DaiYan on 2017/6/14.
 */
public class Test2 {
    public static void main(String[] args)throws Exception{
        try{
            f();
        }finally {
            //g();
        }
    }

    public static void f()throws Exception{
        throw new IOException();
    }

    public static void g()throws Exception{
        throw new IllegalArgumentException();
    }

}
