package com.test.jmx;

/**
 * Created by DaiYan on 2017/9/3.
 */
public class Echo {
    private static Message msg=new Message();
    private static boolean isRunning = true;
    private static boolean pause = false;

    public static void main(String[] args) {
        while (isRunning) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
                ex.printStackTrace();
            }
            if (!pause)
                msg.echo();
        }
    }

    public static Message getMsg() {
        return msg;
    }

    public static void setMsg(Message msg) {
        Echo.msg = msg;
    }

    public static boolean isRunning() {
        return isRunning;
    }

    public static void setIsRunning(boolean isRunning) {
        Echo.isRunning = isRunning;
    }

    public static boolean isPause() {
        return pause;
    }

    public static void setPause(boolean pause) {
        Echo.pause = pause;
    }
}
