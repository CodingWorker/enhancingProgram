package chapter02.item03;

/**
 * Created by DaiYan on 2017/4/18.
 */

import java.io.*;

/**
 * 通过枚举实现单例，只包含一个元素的枚举
 */
enum Test implements Serializable{
    INSTANCE;

    private String Name;
    public int Age;
    public void setName(String name){
        this.Name=name;
    }

    public void setAge(int age){
        this.Age=age;
    }

    @Override
    public String toString(){
        return String.format("Name:%s, Age:%d",this.Name,this.Age);
    }
}

public class EnumSingleDemo {
    public static void main(String[] args)throws Exception{
        Test t=Test.INSTANCE;
        t.setName("aaa");
        t.setAge(12);
        System.out.println("before:");
        System.out.println("T==> "+t);

        ObjectOutput out=new ObjectOutputStream(
                new FileOutputStream("src/chapter02/item03/destroysingledemo/test2.out"));
        out.writeObject(t);
        out.close();
        System.out.println("serialize Done");
        System.out.println("modified T");
        t.setName("haha");
        System.out.println("T==> "+t);
        ObjectInput in=new ObjectInputStream(
                new FileInputStream("src/chapter02/item03/destroysingledemo/test2.bak.out")); //真的会读取反序列化文件，如果破坏就会异常
        Test t2=(Test) in.readObject();//这时得到的t2和t是一样的
        System.out.println(t==t2);  //true
        in.close();
        System.out.println("after:");
        System.out.println("T==> "+t);
        System.out.println("T2==> "+t2);

        System.out.println("modified T");
        t.setName("haha");
        System.out.println("T==> "+t);
        System.out.println("T2==> "+t2);
    }
}
