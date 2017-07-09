package _final;

/**
 * Created by DaiYan on 2017/6/28.
 */
class Test{
    //final修饰类变量如果不在定义时初始化需要在构造器中指定值
    public final String name="Daniel";
    public final int age;
    public Test(){
        age=12;
    }

    public void t(){
        final String vart="final var";
        System.out.println(vart);
    }

    @Override
    public String toString(){
        return this.name+"|"+this.age;
    }
}

public class Demo {
    public static void main(String[] args){
        Test t=new Test();
        t.t();
        System.out.println(t);
    }
}
