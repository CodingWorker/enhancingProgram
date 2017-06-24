/**
 * Created by DaiYan on 2017/6/24.
 */
class Static2{
    static{
        System.out.println("static block in Static2");
    }
}

public class StaticDemo {
    static{
        System.out.println("the static block is called");
        outStaticBlock();
    }

    public static void main(String[] args){
        System.out.println("the method of main is called");
    }

    public static void outStaticBlock(){
        System.out.println("the method out of the static block is called");
    }
}
