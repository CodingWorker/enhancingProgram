package Chapter07._7_6;

/**
 * Created by DaiYan on 2017/3/20.
 */
public class Parcel2 {
    public Destination to(String s){
        return new Destination(s);
    }

    public Contents cont(){
        return new Contents();
    }

    public static void main(String[] args){
        Parcel2 p=new Parcel2();
        p.ship("Tanzania");
        Parcel2 q=new Parcel2();

        Parcel2.Contents c=q.cont();   //这里外部类不是 必须的；
        // 但是当内部类外部访问的时候需要带上外部类
        Parcel2.Destination d=q.to("Tanzania");
    }

    public void ship(String dest){
        Contents c=new Contents();
        Destination d=new Destination(dest);
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
    }
}
