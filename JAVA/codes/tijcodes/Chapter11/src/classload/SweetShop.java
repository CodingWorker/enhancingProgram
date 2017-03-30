package classload;

/**
 * Created by DaiYan on 2017/3/30.
 */
public class SweetShop {
    public static void main(String[] args){
        System.out.println("inside main");
        new Candy();
        System.out.println("after creating Candy");

        try{
            Class.forName("classload.Gum");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }

        System.out.println("after Class.forName(\"Gum\")");

        new Cookie();
        System.out.println("after creating Cookie");
    }
}
