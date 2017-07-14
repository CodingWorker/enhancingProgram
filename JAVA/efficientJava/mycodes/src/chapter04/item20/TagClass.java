package chapter04.item20;

/**
 * Created by DaiYan on 2017/4/26.
 */
public class TagClass {
    //不要在当前类定义数据域的枚举等其他与本来无关的实现，将这些数据放在其他的类中
    AbstractFigure figure=new Circle(1);

    public double getArea(){
        return figure.area();
    }
}
