package initcodeblock;

/**
 * Created by DaiYan on 2017/6/28.
 */
class NonStaticBlock{
    //非静态代码块在每次创建对象的时候会被执行
    {
        System.out.println("out put from non-static block");
    }

    public NonStaticBlock(){}
}
public class NonStaticTEST {
    public static void main(String[] args){
        new NonStaticBlock();
        new NonStaticBlock();
    }
}
