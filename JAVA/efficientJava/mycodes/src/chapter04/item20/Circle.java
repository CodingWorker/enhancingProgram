package chapter04.item20;

import java.util.zip.CRC32;

/**
 * Created by DaiYan on 2017/4/26.
 */
public class Circle extends AbstractFigure {
    private int radis;
    public Circle(int radis){
        this.radis=radis;
    }

    public double area(){
        return 3.1415*radis*radis;
    }
}
