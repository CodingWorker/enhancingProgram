package chapter10;

import com.sun.org.apache.bcel.internal.generic.IFLE;
import jdk.nashorn.internal.ir.CatchNode;

import java.io.*;

/**
 * Created by DaiYan on 2017/6/15.
 */
class Temp implements Serializable{
    private int a;
    public Temp(int a){
        this.a=a;
    }
    public int getA(){
        return this.a;
    }
}

public class SerialiazeDemo {
    public static void main(String[] args){
        ObjectOutputStream objOut=null;
        try {
            objOut=new ObjectOutputStream(new FileOutputStream("e:/obj.txt"));
            objOut.writeObject(new Temp(12));
        }catch(IOException e){
            e.printStackTrace();
        }finally {
            if(null!=objOut){
                try {
                    objOut.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }

        //unserializable
        ObjectInputStream objIn=null;
        Temp t1=null;
        Temp t2=null;
        try {
            objIn=new ObjectInputStream(new FileInputStream("e:/obj.txt"));
            t1=(Temp)objIn.readObject();
            objIn.close();
            objIn=new ObjectInputStream(new FileInputStream("e:/obj.txt"));
            t2=(Temp)objIn.readObject();
        }catch (IOException e) {
            e.printStackTrace();
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }finally{
            if(null!=objIn){
                try {
                    objIn.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }

        System.out.println(t1);;
        System.out.println(t2);
    }

}
