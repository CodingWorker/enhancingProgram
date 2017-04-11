import com.sun.org.apache.bcel.internal.classfile.LineNumber;

import javax.sound.sampled.Line;
import java.io.*;

/**
 * Created by DaiYan on 2017/4/11.
 */
public class IOStreamDemo {
    public static void main(String[] args){
        try{
            //buffered input file
            DataInputStream in=new DataInputStream(new BufferedInputStream(new FileInputStream(args[0])));
            String s,s2=new String();
            while((s=in.readLine())!=null)
                s2+=s+"\n";
            in.close();

            //input from memory
            StringBufferInputStream in2=new StringBufferInputStream(s2);
            int c;
            while((c=in2.read())!=-1)
                System.out.println((char)c);
            in2.close();

            //formatted memory input
            try{
                DataInputStream in3=new DataInputStream(new StringBufferInputStream(s2));
                while(true){
                    System.out.println((char)in3.readByte());
                }
            }catch(EOFException e){
                System.out.println("end of stream encountered");
            }

            //line number and file output
            try{
                LineNumberInputStream li=new LineNumberInputStream(new StringBufferInputStream(s2));
                DataInputStream in4=new DataInputStream(li);
                PrintStream out1=new PrintStream(new BufferedOutputStream(new FileOutputStream("IODemo.out")));
                
                while((s=in4.readLine())!=null){
                    out1.println("Line "+li.getLineNumber()+s);
                }
                out1.close();
            }catch(EOFException e){
                System.out.println("End of stream encountered");
            }

            //string or recoving data
            try{
                DataOutputStream out2=new DataOutputStream(new BufferedOutputStream(new FileOutputStream("Data..txt")));
                out2.writeBytes("here is the value of pi:\n");
                out2.writeDouble(3.141592653);
                out2.close();
                DataInputStream in5=new DataInputStream(new BufferedInputStream(new FileInputStream("Data.txt")));
                System.out.println(in5.readLine());
                System.out.println(in5.readDouble());
            }catch(EOFException e){
                System.out.println("End of stream encountered");
            }

            //reading/writing random access files
            RandomAccessFile rf=new RandomAccessFile("rtest.dat","rw");
            for(int i=0;i<10;i++){
                rf.writeDouble(i*1.414);
            }

            rf.close();

            rf=new RandomAccessFile("ttest.dat","rw");
            rf.seek(5*8);
            rf.writeDouble(47.001);
            rf.close();

            rf=new RandomAccessFile("rtest.dat","rw");
            for(int i=0;i<10;i++){
                System.out.println("Value "+i+": "+rf.readDouble());
            }

            rf.close();
        }catch(IOException e){

        }

    }
}
