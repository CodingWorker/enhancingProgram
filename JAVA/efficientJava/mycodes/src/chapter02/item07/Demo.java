package chapter02.item07;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.sun.xml.internal.messaging.saaj.soap.ver1_1.Fault1_1Impl;
import sun.security.x509.AVA;

import java.rmi.AccessException;

/**
 * Created by DaiYan on 2017/4/19.
 */
class FinalizeDemo{
    private boolean isAvailable;
    private String Name;
    public FinalizeDemo(){
        isAvailable=true;
    }

    public boolean isAvailable(){
        return isAvailable;
    }

    public void doWork()throws Exception{
        if(!isAvailable)
            throw new AccessException("cannot access the object");

        //do work
        System.out.println("do work");
    }

    public void close(){
        isAvailable=false;
    }
}

public class Demo {
    public static void main(String[] args)throws Exception{
        FinalizeDemo f1=new FinalizeDemo();
        f1.doWork();
        f1.close();
        f1.doWork();
    }
}
