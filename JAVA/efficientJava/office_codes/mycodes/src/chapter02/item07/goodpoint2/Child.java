package chapter02.item07.goodpoint2;

import jdk.nashorn.internal.runtime.ECMAException;

/**
 * Created by DaiYan on 2017/4/19.
 */
public class Child extends Super {
    @Override
    public void finalize(){
        try {
            //do self work
        }catch (ECMAException e){

        }finally{
            //在finally中调用super的终结方法
            super.finalize();
        }
    }
}
