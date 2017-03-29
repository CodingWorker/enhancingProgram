import sun.tools.jar.CommandLine;

import javax.print.DocFlavor;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created by DaiYan on 2017/3/29.
 */
public class ServerDemo {
    public static void main(String[] args) throws Exception{
        System.out.println("客户端，你来了，怎么？");

        //创建服务，指定端口为8888
        ServerSocket server=new ServerSocket(8888);
        System.out.println("服务已经准备就绪...");
        while(true){
            Socket client=server.accept();
            if(!client.isConnected()){
                client.close();
                continue;
            }
            System.out.println("连接过来的客户端："+client.getInetAddress());

            PrintStream out=new PrintStream(client.getOutputStream());
            out.println();

            out.close();
            client.close();
        }

        //server.close();
    }
}
