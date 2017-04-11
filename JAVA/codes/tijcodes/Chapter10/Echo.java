import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.IOException;

/**
 * Created by DaiYan on 2017/4/11.
 */
public class Echo {
    public static void main(String[] args){
        DataInputStream in=null;
        try{
            in=new DataInputStream(new BufferedInputStream(System.in));
            String s;
            while((s=in.readLine()).length()>0){
                System.out.println(s);
            }

            in.close();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(null!=in){
                try{
                    in.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
    }
}
