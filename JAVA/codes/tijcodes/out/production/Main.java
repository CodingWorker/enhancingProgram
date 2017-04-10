import java.io.*;
import java.sql.SQLSyntaxErrorException;

/**
 * Created by DaiYan on 2017/4/10.
 */
public class Main {
    public static void main(String[] args){
        /*
        InputStream is;//抽象类，其他输入流继承自此类
        FileInputStream fis=new FileInputStream('F:/temp.txt');//extends InputStream
        StringBufferInputStream sbis=new StringBufferInputStream("abc");
        FileInputStream fis=new FileInputStream("f:/temp.txt");//底层实现调用了new File
        // 将文件名->File对象
        fis=new FileInputStream(new File("f:temp.txt"));//底层实现调用了下面的FileDescriptor
        fis=new FileInputStream(new FileDescriptor());
        is=new SequenceInputStream(fis,fis);//将多个InputStream合并为一个InputStream

        OutputStream os;
        FileOutputStream fos=new FileOutputStream("f:/temp.txt");
        fos=new FileOutputStream(new File("f:/temp.txt"));
        fos=new FileOutputStream(new FileDescriptor());

        PrintStream out;
        DataOutputStream dos=new DataOutputStream(out);
        */

        File f=new File("f:");
        String[] files=f.list();
        for(String fileName:files){
            System.out.println(fileName);
        }

    }
}
