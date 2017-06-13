package Chapter07;

/**
 * Created by DaiYan on 2017/3/20.
 */
public class Parcel1 {
    public void ship(String dest){
        Contents c=new Contents();
        Destination d=new Destination(dest);
    }

    public static void main(String[] args){
        Parcel1 p=new Parcel1();
        p.ship("Tanzaniz");
    }

    class Contents{
        private int i=11;
        public int value(){
            return i;
        }
    }

    class Destination{
        private String label;
        Destination(String whereTo){
            label=whereTo;
        }

        String readLabel(){
            return label;
        }
    }
}
