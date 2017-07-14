package chapter02.item03.destroysingledemo;

import com.sun.corba.se.pept.encoding.InputObject;
import org.omg.CORBA.PERSIST_STORE;
import org.omg.CORBA.ShortSeqHelper;
import org.omg.CORBA.portable.InputStream;

import javax.lang.model.element.NestingKind;
import java.io.*;

/**
 * Created by DaiYan on 2017/4/18.
 */
class Person implements Serializable{
    private String Name;
    private int Age;
    public static final Person INSTANCE=new Person();

    private Person(){}
    public static Person getInstance(){
        return INSTANCE;
    }

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

public class SerializeDemo {
   public static void main(String[] args)throws Exception{
       Person p=Person.getInstance();
       p.setName("aaa");
       p.setAge(12);
       System.out.println("before:");
       System.out.println("P==> "+p);

       ObjectOutput out=new ObjectOutputStream(
               new FileOutputStream("src/chapter02/item03/destroysingledemo/test.out"));
       out.writeObject(p);
        out.close();
       ObjectInput in=new ObjectInputStream(
               new FileInputStream("src/chapter02/item03/destroysingledemo/test.bak.out")); //临时破坏序列化的文件的话不能反序列化
       Person p2=(Person)in.readObject();
       in.close();
       System.out.println("after:");
       System.out.println("P==> "+p);
       System.out.println("P2==> "+p2);

       System.out.println("modified p");
       p.setName("haha");
       System.out.println("P==> "+p);
       System.out.println("P2==> "+p2);
   }
}
