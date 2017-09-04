package com.test.jmx;

/**
 * Created by DaiYan on 2017/9/3.
 */
public interface MessageMXBean {
    //结束程序。
    void stop();
    //查看程序是否暂停。
    boolean isPaused();
    //暂停程序或者继续程序。
    void pause(boolean pause);
    Message getMessage();
    //修改message
    void changeMessage(Message m);
}
