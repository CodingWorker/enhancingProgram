import com.shiyanlou.test.test.Human;
import com.shiyanlou.test.test.HumanFactory;

/**
 * Created by Administrator on 2017/2/5.
 */
public class TestFactory {
    public static void main(String[] args){
        Human h= HumanFactory.createHuman("");

        Human man=HumanFactory.createHuman("man");
        man.eat();
    }

}
