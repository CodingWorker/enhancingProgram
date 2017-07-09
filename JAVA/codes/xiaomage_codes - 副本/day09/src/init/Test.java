package init;

import com.sun.corba.se.impl.orb.ParserTable;

/**
 * Created by DaiYan on 2017/6/28.
 */
class TestDemo{
    public int cc=12;
    public String name="Daniel";
    public static int max_score=100;
}
public class Test {
    public static void main(String[] args){
        System.out.println(new TestDemo().name);
        System.out.println(new TestDemo().cc);
    }
}
