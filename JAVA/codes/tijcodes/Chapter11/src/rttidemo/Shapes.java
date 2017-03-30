package rttidemo;

import rttidemo.Triangle;

import java.util.Vector;

/**
 * Created by DaiYan on 2017/3/30.
 */
public class Shapes {
    public static void main(String[] args){
        Vector v=new Vector();
        v.add(new Circle());
        v.add(new Square());
        v.add(new Triangle());

        for(int i=0;i<v.size();i++){
            ((Shape)v.get(i)).draw();
        }
    }
}
