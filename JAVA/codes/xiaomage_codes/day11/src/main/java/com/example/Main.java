package main.java.com.example;

/**
 * Created by DaiYan on 2017/7/5.
 */
public class Main {
    public static void main(String[] args){
        System.out.println(test());
    }

    private static int test(){
        //使用try-finally
        int a=0;
        try{
            return a;
        }finally{
            ++a;
        }
    }
}
