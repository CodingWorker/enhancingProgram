package chapter11.item74;

import java.io.*;

/**
 * Created by DaiYan on 2017/4/14.
 */
class Test implements Serializable{
    private String Name;
    public void setName(String name){
        this.Name=name;
    }
    public String getName(){
        return this.Name;
    }

    int Age;
    public String Address;

    public String temp;

    @Override
    public String toString(){
        return String.format("Name:%s, Age: %d, Address: %s",this.Name,this.Age,this.Address);
    }
}

public class Price01 implements Serializable{
    public static void main(String[] ars) throws Exception{
        Test obj=new Test();
        obj.setName("test");
        obj.Age=12;
        obj.Address="some place";
        obj.temp="temp add field";
        System.out.println(obj.temp);
        System.out.println(obj);
        String path="src/staticfiles/chapter11.price01.out";
        //ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream(path));
        //out.writeObject(obj);
        //out.close();
        ObjectInputStream in=new ObjectInputStream(new FileInputStream(path));
        Test newObj=(Test)in.readObject();//临时改Test的字段，增加了temp，此时在反序列化的时候就会报错
        //Exception in thread "main" java.io.InvalidClassException:
        // chapter11.item74.Test; local class incompatible: stream classdesc
        // serialVersionUID = -1594914747696570785,
        // local class serialVersionUID = 5837105316341272767
        in.close();
        System.out.println(newObj);


    }
}
