import java.util.ArrayList;
import java.util.List;

/**
 * Created by DaiYan on 2017/4/6.
 */
public class ThrowableDemo {
    public static void main(String[] args){
        try{
            throw new Throwable();
        }catch(Exception e){    //throwable是Exception的基本类型，不能被Throwable捕获

        }catch(Throwable e){

        }

        ArrayList<String> strArr=null;
        test(strArr);
    }

    public static void test(ArrayList<String> strArr){
        if(strArr.equals(null)){

        }else{

        }
    }
}
