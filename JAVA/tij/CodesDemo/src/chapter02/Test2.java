package chapter02;

/**
 * Created by DaiYan on 2017/6/12.
 */

/**
 * @version 0.1
 * @author Daniel
 *
 */
abstract class ASuper{
    public int a;

    /**
     *
     * @param a a property
     */
    public ASuper(int a){
        this.a=a;
    }

    /**
     * abstract method
     */
    abstract void doSome();
}

/**
 * @see ASuper
 */
class AChild extends ASuper{
    public AChild(){
        super(12);
    }

    public void doSome(){
        System.out.println(this.a);
    }
}

/**
 * @see ASuper
 */
class A2Child extends ASuper{
    public A2Child(){
        super(10);
    }

    public void doSome(){
        System.out.println(this.a);
    }
}

public class Test2 {
    //静态代码段的会在第一次访问类或者创建该类的对象是调用
    static {
        System.out.println("the codes in static zone are called");
    }

    public static void main(String[] args){
        AChild c=new AChild();
        c.doSome();//12
        A2Child c2=new A2Child();
        c2.doSome();//10
        c.doSome();//12

        char chr=97;//自动ACII码值转换为对应的字符
        System.out.println((int)chr);

        //for循环是程序代码块
        for(int i=1;i<10;i++){

        }
        //i++;//在此作用域内找不到i
    }
}
