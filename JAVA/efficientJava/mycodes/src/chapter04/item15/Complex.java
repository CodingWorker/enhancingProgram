package chapter04.item15;

/**
 * Created by DaiYan on 2017/4/23.
 */
public class Complex {
    private final double re;
    private final double im;
    //私有化构造方法以防止被子类化
    private Complex(double re,double im){
        this.re=re;
        this.im=im;
    }

    //提供公有的静态工厂
    public static Complex valueof(double re,double im){
        return new Complex(re,im);
    }

}
