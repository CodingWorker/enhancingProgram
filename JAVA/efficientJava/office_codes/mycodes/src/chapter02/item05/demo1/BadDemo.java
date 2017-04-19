package chapter02.item05.demo1;

import javax.swing.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by DaiYan on 2017/4/19.
 */
class Person2{
    private final Date birthDate= Calendar.getInstance().getTime();
    public boolean isBabyBoomer(){
        Calendar gmtCal=Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        gmtCal.set(1946,Calendar.JANUARY,1,0,0,0);
        Date boomStart=gmtCal.getTime();
        gmtCal.set(1965,Calendar.JANUARY,1,0,0,0);
        Date boomEnd=gmtCal.getTime();

        return birthDate.compareTo(boomStart)>=0 && birthDate.compareTo(boomEnd)<0;
    }
}

public class BadDemo {
}
