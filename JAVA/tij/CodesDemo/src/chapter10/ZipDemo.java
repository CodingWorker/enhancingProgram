package chapter10;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

/**
 * Created by DaiYan on 2017/6/15.
 */
public class ZipDemo {
    public static void main(String[] args){
        GZIPOutputStream zipOut=null;
        try{
            String s="this is a test";
            zipOut=new GZIPOutputStream(new FileOutputStream("e:/temp2.txt.zip"));
            zipOut.write(s.getBytes());
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(null!=zipOut){
                try {
                    zipOut.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }

    }

}
