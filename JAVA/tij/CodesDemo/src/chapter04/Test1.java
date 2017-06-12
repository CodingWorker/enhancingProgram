package chapter04;

import sun.misc.GC;

import javax.lang.model.element.NestingKind;

/**
 * Created by DaiYan on 2017/6/12.
 */

class DestructorDemo{
    public DestructorDemo(){
        System.out.println("the instance is created");
    }

    @Override
    public void finalize()throws Throwable{
            super.finalize();
            System.out.println("the instance is destruct");
    }
}


public class Test1 {
    public static void main(String[] args){
        char c=12;
        a(c);//12,自动将char 转换为int

        //析构方法测试
        DestructorDemo demo=new DestructorDemo();
        demo=null;
        System.gc();
        for (int i=0;i<100000;i++){
            new String("this is nothing");
        }

        //数组的初始化
        int[] intArr;//现在intArr并未初始化，为null
        int[] intArr2=new int[12];//intArr2被初始化了，在内存中分配了空间
        System.out.println(intArr2.length);


    }

    public static void a(int i){
        System.out.println(i);
    }



}
