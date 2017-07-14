package chapter11.item74;

import java.io.*;

/**
 * Created by DaiYan on 2017/4/14.
 */
class Super{
    public String SuperFiled;

    //public Super(){}
    public Super(String field){}

}
class Child extends Super implements Serializable{
    public String ChildField;
    public Child(String field){
        super(field);
    }
    @Override
    public String toString(){
        return String.format("SuperField:%s, ChildField:%s",this.SuperFiled,this.ChildField);
    }
}

public class Extends {
    public static void main(String[] args)throws Exception{
        Child obj=new Child("child");
        obj.SuperFiled="superField";
        obj.ChildField="childField";
        System.out.println(obj);
        String path="src/staticfiles/chapter11.extends.out";
        ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream(path));
        out.writeObject(obj);
        out.close();

        ObjectInputStream in=new ObjectInputStream(new FileInputStream(path));
        Child newObj=(Child)in.readObject();
        in.close();
        System.out.println(newObj);

    }
}
