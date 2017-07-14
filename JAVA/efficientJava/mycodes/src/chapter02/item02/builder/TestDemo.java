package chapter02.item02.builder;

/**
 * Created by DaiYan on 2017/4/18.
 */
public class TestDemo {
    public void test(){
//        IBuilder<Node1.Builder> b1=
        IBuilder<Node1> b1=  new Node1.Builder(1,2);
        IBuilder<Node2> b2=new Node2.Builder2(1,2);

        Node1 n1=b1.build();
        Node2 n2=b2.build();
    }

}
