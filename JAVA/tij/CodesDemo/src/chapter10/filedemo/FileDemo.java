package chapter10.filedemo;

import com.sun.xml.internal.fastinfoset.tools.FI_SAX_Or_XML_SAX_SAXEvent;

import java.io.*;
import java.util.StringTokenizer;

/**
 * Created by DaiYan on 2017/6/15.
 */
public class FileDemo {
    public static void main(String[] args){
        //create an File object for current directory
        File file=new File(".");

        //get the files name of the File object
        String[] fileNames=file.list();

        //get the files name that match some pattern
        String[] fileNames2=file.list(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                if(name.indexOf("iml")!=-1){
                    return true;
                }

                return false;
            }
        });

        for(String name:fileNames2){
            System.out.println(name);
        }

        String temp="this is a test";
        byte[] bytes=temp.getBytes();
        FileOutputStream out=null;
        try {
            out=new FileOutputStream("e:/temp.txt");//create file if not exists
            out.write(bytes);
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(null!=out){
                try {
                    out.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        try{
            StringTokenizer st=new StringTokenizer("this is a test.that is true!");

//            StreamTokenizer st2=new StreamTokenizer(new FileReader("e:/temp.txt"));
            System.out.println("st\r\n");
            while(st.hasMoreElements()){
                System.out.println(st.nextToken());
            }
            System.out.println("st2\r\n");
//            int val=st2.nextToken();
//            while(val!=StreamTokenizer.TT_EOF){
//                System.out.println(val);
//                val=st2.nextToken();
//            }

        }catch(Exception e){
            e.printStackTrace();
        }

    }

}
