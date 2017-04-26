package start_a_process;

import com.sun.deploy.net.proxy.AutoProxyScript;

import java.io.IOException;
import java.security.cert.PKIXRevocationChecker;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class ProcessBuilderDemo {
    public static void main(String[] args){
        //使用ProcessBuilder的start方法开启一个进程
        ProcessBuilder processBuilder=new ProcessBuilder();

        try{
            //打开记事本
            //processBuilder.command("notepad");

            //打开远程
            processBuilder.command("mstsc");
            processBuilder.start();
        } catch(IOException e){
            e.printStackTrace();
            //log
        }

    }
}
