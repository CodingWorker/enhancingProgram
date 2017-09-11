package com.test.timertask;

import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by DaiYan on 2017/9/12.
 */
class TimerTaskTest extends TimerTask{
    @Override
    public void run() {
        System.out.println("hello");
    }
}

public class Main {
    public static void main(String[] args){
        TimerTask timerTask=new TimerTaskTest();
        Timer timer=new Timer();
        timer.schedule(timerTask,3000,1000);
    }
}
