package Chapter07._7_6;

/**
 * Created by DaiYan on 2017/3/20.
 */
abstract class Contents {
    abstract public int value();
}
interface Destination {
    String readLabel();
}

public class Parcel3 {
    private class PContents extends Contents {
        private int i = 11;
        public int value() { return i; }
    }
    protected class PDestination
            implements Destination {
        private String label;
        private PDestination(String whereTo) {//这个私有构造器外部类可以访问
            System.out.println(whereTo);
            label = whereTo;
        }

        private void canAccess(){//内部类的私有方法外部类可以访问；
            //内部类属于外部类的一部分，按理外部类方法可以访问内部类的一切
            System.out.println("can Access");
        }

        public String readLabel() { return label; }
    }
    public Destination dest(String s) {
        new PDestination(s).canAccess();
        return new PDestination(s);
    }

    public Contents cont() {
        return new PContents();
    }
}
class Test {
    public static void main(String[] args) {
        Parcel3 p = new Parcel3();
        Contents c = p.cont();
        Destination d = p.dest("Tanzania");
        Contents cc=new Parcel3().cont();   //这里因为内部类为private，
        // 所以访问不到内部类
// Illegal -- can't access private class:
//! Parcel3.PContents c = p.new PContents();
    }
}
