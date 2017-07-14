package chapter03.item08.pointdemo;

import java.io.ObjectInput;

/**
 * Created by DaiYan on 2017/4/20.
 */
public class Point {
    private final int x;
    private final int y;
    public Point(int x,int y){
        this.x=x;
        this.y=y;
    }

    @Override
    public boolean equals(Object o){
        if(!(o instanceof Point))
            return false;

        return this.x==((Point)o).x && this.y==((Point) o).y;
    }
}
