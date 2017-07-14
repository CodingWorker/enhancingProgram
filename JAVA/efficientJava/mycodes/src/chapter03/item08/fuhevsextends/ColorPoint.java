package chapter03.item08.fuhevsextends;

import java.awt.*;

/**
 * Created by DaiYan on 2017/4/20.
 */
public class ColorPoint {
    private final Point point;
    private final Color color;
    public ColorPoint(int x,int y,Color color){
        point=new Point(x,y);
        this.color=color;
    }

    public Point asPoint(){
        return this.point;
    }

    @Override
    public boolean equals(Object o){
        if(o instanceof Point)   //混合比较
            return this.point.equals((Point)o);

        if(!(o instanceof ColorPoint))
            return false;

        ColorPoint cp=(ColorPoint)o;
        return this.point.equals(cp.point) && this.color.equals(cp.color);
    }
}
