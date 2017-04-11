import java.io.*;

/**
 * Created by DaiYan on 2017/4/11.
 */
public class NewIODemo {
    public static void main(String[] args) {
        try {
            //1. reading input by lines
            BufferedReader r1 = new BufferedReader(new FileReader("f:/temp.txt"));
            String s = null, s2;
            while ((s2 = r1.readLine()) != null) {
                s += s2;
            }
            r1.close();
            //2. input from memory
            BufferedReader r2 = new BufferedReader(new InputStreamReader(System.in));
            int c;
            while((c=r2.read())!=-1){
                System.out.println((char)c);
            }

            r2.close();

            //3. formatted memory input
            try{
                DataInputStream in=new DataInputStream(new StringBufferInputStream(s2));
                while(true){
                    System.out.println((char)in.readByte());
                }
            }catch(EOFException e){
                e.printStackTrace();
            }

            //4.line number & file output
            try{
                LineNumberReader li=new LineNumberReader(new StringReader(s2));
                BufferedReader r4=new BufferedReader(li);
                PrintWriter out1=new PrintWriter(new BufferedWriter(new FileWriter("tmp.txt")));
                while((s=r4.readLine())!=null){
                    out1.println("Line number:"+li.getLineNumber()+s);
                }

                r4.close();
            }catch (Exception e){
                e.printStackTrace();
            }

            //5. stored and recoving data
            DataOutputStream out=null;
            try {
                out=new DataOutputStream(new BufferedOutputStream(new FileOutputStream("f:temp.txt")));
                byte[] bytes=new byte[out.size()];
                out.write(bytes,0,out.size());

            }catch (Exception e){
                e.printStackTrace();
            }finally {
                if(null!=out){
                    try {
                        out.close();
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
