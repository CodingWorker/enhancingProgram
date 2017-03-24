import javax.sound.midi.SysexMessage;
import java.nio.charset.Charset;
class Test{

}

public class Main {
    public static void main(String[] args) throws Exception{
        String s1="fadfaf";
        String s2=new String(s1);
        System.out.println(s1==s2);
        System.out.println(s1.equals(s2));

        char[] cc=new char[]{'a','b','c',','};
        String s3=new String(cc);
        System.out.println(s3);
        //String s4=new String(cc,1,1234);
        //System.out.println(s4+'c');
        int[] num=new int[]{1,2,3,12,92};
        String s5=new String(num,0,4);
        System.out.println(s5);

        byte[] b=new byte[]{0x12,67,93};
        System.out.println(new String(b,0,0,3) + "sfs");
        System.out.println(new String(b,0,3,"utf-8"));
        System.out.println(new String(b,0,2, Charset.forName("utf-8")));
        System.out.println(new String(b,"utf-8"));
        System.out.println(new String(b,Charset.forName("utf-8")));
        System.out.println(new String("faf").codePointCount(0,2));
        System.out.println(new String("faf").codePointAt(2));
    }
}

