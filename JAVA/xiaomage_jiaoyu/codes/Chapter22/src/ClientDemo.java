import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Scanner;

/**
 * Created by DaiYan on 2017/3/29.
 */
public class ClientDemo {
    public static void main(String[] args)throws Exception{
        String data="dfaaf";
        Socket client=new Socket("localhost",8888);
        DatagramSocket sender=new DatagramSocket(10010);
        DatagramPacket dp=new DatagramPacket(data.getBytes(),
                data.getBytes().length,
                InetAddress.getLocalHost(),
                8888);

        sender.send(dp);

        Scanner sc=new Scanner(client.getInputStream());
        while(sc.hasNextLine()){
            String line=sc.nextLine();
            System.out.println(line);
        }

        sc.close();
        client.close();
    }

}
