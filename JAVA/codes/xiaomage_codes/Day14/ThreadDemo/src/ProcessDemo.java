import jdk.nashorn.internal.runtime.ECMAException;

import java.io.IOException;

/**
 * Created by DaiYan on 2017/4/1.
 */

//在java中开启进程
public class ProcessDemo {
    public static void main(String[] args)throws IOException{
        //方式1：使用runtime的exec方法
        Runtime rt=Runtime.getRuntime();
        //rt.exec("NotePad");//打开记事本

        //方式2：使用ProcessBuilder的start方法
        ProcessBuilder pb=new ProcessBuilder("NotePad");
        pb.start();
    }
}
