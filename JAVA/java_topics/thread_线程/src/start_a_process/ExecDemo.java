package start_a_process;

import java.io.IOException;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class ExecDemo {
    public static void main(String[] args){
        //使用RunTime的exec方法来启动一个进程
        Runtime runtime=Runtime.getRuntime();
        try{
            //命令就是可以在运行中执行的命令

            //打开一个记事本是NotePad
            //runtime.exec("NotePad");

            //打开远程
            runtime.exec("mstsc");
        }catch(IOException e){
            e.printStackTrace();
            //log
        }
    }
}
