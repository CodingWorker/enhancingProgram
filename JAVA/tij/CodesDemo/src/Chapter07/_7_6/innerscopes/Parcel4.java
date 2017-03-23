package Chapter07._7_6.innerscopes;

/**
 * Created by DaiYan on 2017/3/20.
 */
interface Inner{

}

public class Parcel4 {
    public Inner test(){
        class InnerA implements Inner{//这样外部类就可以接受此对象了

        }

        return new InnerA();
    }
}
