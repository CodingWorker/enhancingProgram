package chapter04.item20;

/**
 * Created by DaiYan on 2017/4/26.
 */
public class Rectangle extends AbstractFigure {
    private int width;
    private int length;
    public Rectangle(int width,int length){
        this.width=width;
        this.length=length;
    }

    public double area(){
        return this.width*this.length;
    }
}
