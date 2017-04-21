package chapter03.item08.fuhevsextends;

import javafx.beans.binding.ObjectExpression;

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

        Point p=(Point)o;
        return this.x==p.x && this.y==p.y;
    }
}
