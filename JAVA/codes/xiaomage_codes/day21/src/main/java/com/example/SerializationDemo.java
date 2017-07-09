package main.java.com.example;

import java.io.*;

/**
 * Created by DaiYan on 2017/7/10.
 */
class SerialClass implements Serializable{
    private static final long serialVersionUID=1L;
    public String name;
}

public class SerializationDemo {
    public static void main(String[] args)throws Exception{
//        SerialClass serialClass=new SerialClass();
//        ObjectOutputStream write=new ObjectOutputStream(new FileOutputStream("./day21/temp.file"));
//        write.writeObject(serialClass);
//        write.close();

        ObjectInputStream inputStream=new ObjectInputStream(new FileInputStream("./day21/temp.file"));
        SerialClass serialClass=(SerialClass)inputStream.readObject();
        inputStream.close();
    }
}
