package chapter09;

/**
 * Created by DaiYan on 2017/6/14.
 */
public class Test1 {
    public static void main(String[] args){
        try{
            test();
        }catch(Exception e){
            e.printStackTrace();
        }catch(Throwable th){
            
        }
    }

    public static void test()throws Throwable{
        try {
            int a=1/0;
        }catch(Throwable th){
//            System.out.println(th.getClass().getName());//java.lang.ArithmeticException
//            System.out.println(th.getMessage());//  / by zero
//            th.printStackTrace();
            Throwable e= th.fillInStackTrace();
            throw  e;
        }
    }

}
