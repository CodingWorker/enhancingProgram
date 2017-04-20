package chapter03.item08.pointdemo;

import java.awt.*;

/**
 * Created by DaiYan on 2017/4/20.
 */
public class ColorPoint extends Point {
    private final Color color;
    public ColorPoint(int x,int y,Color color){
        super(x,y);
        this.color=color;
    }

    @Override
    public boolean equals(Object o){
        if(!(o instanceof ColorPoint)){
            return false;
        }

        ColorPoint cp=(ColorPoint)o;
        return super.equals(o) && this.color.equals(cp.color);
    }
}
