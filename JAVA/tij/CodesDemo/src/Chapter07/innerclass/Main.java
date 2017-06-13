package Chapter07.innerclass;

/**
 * Created by DaiYan on 2017/6/13.
 */

interface IDemo2{

}



public class Main {
    public static void main(String[] args){
        //定义匿名内部类
        IDemo demo=getInnerDemo();
        demo.outputName();
    }

    public static IDemo getInnerDemo(){
        return new IDemo(){
            @Override
            public void outputName() {
                System.out.println("this is the inner class");
            }
        };
    }

}
