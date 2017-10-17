package chapter11;

/**
 * Created by DaiYan on 2017/3/27.
 */
public class Out {
    public int a=12;
    public class In{
        public int aa=new Out().a;
        public In(){
            System.out.println(this.aa);
            System.out.println(Out.this.a);    //访问外部类成员
        }
    }

    public static class StaticIn{//就把它当做为静态成员
        public static int aa=new Out().a;
    }

    public class UnStaticIn{

    }
}

class Test{
    public static void main(String[] args) {
        Out.StaticIn staticIn=new chapter11.Out.StaticIn();//静态内部类可以独立于
        // 外部类的实例而存在
        final Out out=new Out();
        Out.UnStaticIn unStaticIn=out.new UnStaticIn();//非静态内部类的实例需要
        // 存在外部类的实例

        final class LocalIn{//局部内部类就看做是局部变量
            LocalIn(String name){
                this.name=name;
            }
            private String name;

            public void run(){
                System.out.println(staticIn);//局部内部类只能访问外部类的常量
            }
        }

        LocalIn localIn=new LocalIn("Daniel");
        System.out.println(localIn.name);
        localIn.run();
    }
}

enum EnumTest1{

}

