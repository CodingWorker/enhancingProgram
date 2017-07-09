/**
 * Created by DaiYan on 2017/6/24.
 */
interface ITest{

}

abstract class AbstractTest{

}

public class Niming {
    public static void main(String[] args){
        System.out.println(new ITest() {
            protected Object clone() throws CloneNotSupportedException {
                return super.clone();
            }
        });

        System.out.println(new AbstractTest() {
            protected Object clone() throws CloneNotSupportedException {
                return super.clone();
            }
        });
    }
}
