import sun.print.PrinterGraphicsDevice;

/**
 * Created by DaiYan on 2017/3/3.
 */
class InternalDmo{
    public static int num=12;
    public int a;
    public InternalDmo(int a){
        this.a=a;
    }

    public InternalDmo(){
    }

}
public class Test01 {
    public static void main(String[] args){
        System.out.println(getNum());
        InternalDmo id=new InternalDmo(12);
        System.out.println(id.num);
        System.out.println(InternalDmo.num);
        InternalDmo id2=new InternalDmo();
        int cc='a';
        Character c='a';
        System.out.println(cc);
    }

    public static int getNum(){
        final int num
                =
                12;
        try {
            System.out.println("a");
            return
                    num;
        }catch(Exception e){
            System.out.println("B");
            return 0;
        }finally {
            System.out.println("C");
        }
    }

}
