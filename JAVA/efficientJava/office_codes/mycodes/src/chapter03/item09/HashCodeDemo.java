package chapter03.item09;

import com.sun.prism.paint.Color;

/**
 * Created by DaiYan on 2017/4/20.
 */
class Test{
    private int x;
    private boolean y;
    private byte a;
    private short b;
    private char c;
    private long d;
    private double e;
    private java.awt.Color color;

    @Override
    public boolean equals(Object o){
        return false;
    }

    @Override
    public int hashCode(){   //good hashCode
        int result=17;
        result=result*31+this.x;
        result=result*31+(this.y?1:0);
        result=result*31+(int)this.a;
        result=result*31+(int)this.b;
        result=result*31+(int)this.c;
        result=result*31+Float.floatToIntBits(this.d);
        result=result*31+Float.floatToIntBits(Double.doubleToLongBits(this.e));
        result=result*31+this.color.hashCode();

        return result;
    }
}

public class HashCodeDemo {

}
