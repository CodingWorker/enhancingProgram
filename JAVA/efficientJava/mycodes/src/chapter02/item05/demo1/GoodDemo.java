package chapter02.item05.demo1;

import javafx.beans.binding.BooleanExpression;
import org.omg.CORBA.PRIVATE_MEMBER;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by DaiYan on 2017/4/19.
 */
class Person{
    private final Date birthDate= Calendar.getInstance().getTime();

    private static final Date BOOM_START;
    private static final Date BOOM_END;

    //使用静态初始化器初始化静态变量
    static{
        Calendar gmt=Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        gmt.set(1946,Calendar.JANUARY,1,0,0,0);
        BOOM_START=gmt.getTime();

        gmt.set(1965,Calendar.JANUARY,1,0,0,0);
        BOOM_END= gmt.getTime();
    }

    public boolean isBabyBoom(){
        return birthDate.compareTo(BOOM_START)>=0 && birthDate.compareTo(BOOM_END)<0;
    }

}

public class GoodDemo {
}
