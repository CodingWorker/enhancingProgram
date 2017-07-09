/**
 * Created by DaiYan on 2017/6/24.
 */
public class SwitchDemo {
    public static void main(String[] args)throws Exception{
        char test='a';
        switch (test){
            case 'a':
                System.out.println("cc");
                break;
            case 'c':
                System.out.println("hello");
                break;
            default:
                throw new Exception("invalid test");
        }
    }
}
