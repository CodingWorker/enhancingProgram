
/**
 * Created by DaiYan on 2017/4/6.
 */
public class CatchDemo {
    public static void main(String[] args){
        try{
            int i=0;
            int c=12/i;
        }catch (Throwable e){
            System.out.println(e.getClass());
        }
    }
}
