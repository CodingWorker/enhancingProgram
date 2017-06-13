package Chapter07;

/**
 * Created by DaiYan on 2017/6/13.
 */
class Supper{
    private int a;
    private int b;
    public int c;
    public Supper(int a,int b,int c){this.a=a;this.b=b;this.c=c;}

    @Override
    public String toString(){
        return String.format("a:%d,b:%d,c:%d",this.a,this.b,this.c);
    }
}

class Child extends Supper{
    public Child(){
        super(10,12,20);
    }
}


public class Test4 {
    public static void main(String[] args){
        Child c=new Child();
        System.out.println(c.toString());
    }

}
