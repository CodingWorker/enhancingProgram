package main.java.com.example;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Particle;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.SimpleDerivation;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;
import java.util.Properties;

/**
 * Created by DaiYan on 2017/7/10.
 */
public class DateDemo {
    public static final String PATTERN_TIME="yyy-MM-dd";
    public static void main(String[] args)throws Exception{
        System.out.println(Calendar.YEAR);
        String timeStr="2010-01-01 12:00:00";
        SimpleDateFormat sdf=new SimpleDateFormat(PATTERN_TIME);
        System.out.println(sdf.parse(timeStr));
        Properties properties=new Properties();
        properties.load(new FileInputStream("./day21/db.properties"));
        System.out.println(properties.get("username"));
    }
}
