package chapter01;

/**
 * Created by DaiYan on 2017/6/12.
 */
class Super{
    private int a;
    public int b;
    public Super(int a){
        this.a=a;
        this.b=this.a+10;
    }

    public int getA(){
        return this.a;
    }

    public void publicMethod(){
        privateMethod();
    }

    private void privateMethod(){
        System.out.println(this.hashCode());
        System.out.println(this.a);
        System.out.println(this.b);
    }
}

class Child extends  Super{
    private int a;
    public Child(int a){
        super(a);
        this.a=0;
    }

    public void cc(){
        System.out.println(this.a);
    }


    private void privateMethod(){
        System.out.println("c.privateMethod is called");
    }
}

public class Test1 {
    public static void main(String[] args){
        //测试子类是否会继承父类的私有成员
        //java 对成员的访问也类似js的查找顺序
        Child c=new Child(12);
        System.out.println(c.b);//22
        System.out.println(c.getA());//0
        c.publicMethod();//12而不是0，因为访问的是父类的访问，父类调用时this指代的是父类 22
        System.out.println(c.hashCode());
        System.out.println(c.getA());//0
        System.out.println(c.getA());//12
        c.cc();//0
    }
}
