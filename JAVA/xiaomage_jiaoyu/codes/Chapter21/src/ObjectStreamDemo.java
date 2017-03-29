import common.User;

import java.io.*;

/**
 * Created by DaiYan on 2017/3/29.
 */
public class ObjectStreamDemo{
    public static void main(String[] args) throws Exception{
        File f=new File("F:/temp.txt");
        writeObject(f);
        User u=readObject(f);
        System.out.println(u.getName());
    }

    private static void writeObject(File f)throws Exception{
        ObjectOutputStream objOut=new ObjectOutputStream(new FileOutputStream(f));
        User u=new User();
        u.setName("a");
        u.setAge(12);
        u.setCountry("China");
        objOut.writeObject(u);
        objOut.close();
    }

    private static User readObject(File f)throws Exception{
        ObjectInputStream objIn=new ObjectInputStream(new FileInputStream(f));
        User u=(User) objIn.readObject();
        objIn.close();
        return u;
    }
}
