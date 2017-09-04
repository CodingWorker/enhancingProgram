package com.test.jmx;

import javax.management.AttributeChangeNotification;
import javax.management.Notification;
import javax.management.NotificationBroadcasterSupport;
import javax.management.NotificationListener;

/**
 * Created by DaiYan on 2017/9/3.
 */
public class MessageMXBeanImpl extends NotificationBroadcasterSupport implements MessageMXBean {
    private long sequenceNumber=1;
    public MessageMXBeanImpl(){
        addNotificationListener(new NotificationListener() {
            public void handleNotification(Notification notification, Object handback) {
                System.out.println("*** Handling new notification ***");
                System.out.println("Message: " + notification.getMessage());
                System.out.println("Seq: " + notification.getSequenceNumber());
                System.out.println("*********************************");
            }
        },null,null);
    }

    public void stop() {
        Echo.setIsRunning(false);
    }

    public boolean isPaused() {
        return Echo.isPause();
    }

    public void pause(boolean pause) {
        Notification n = new AttributeChangeNotification(this,
                sequenceNumber++, System.currentTimeMillis(),
                "Pause changed", "Paused", "boolean",
                Echo.isPause(), pause);
        Echo.setPause(pause);
        this.sendNotification(n);
    }

    public Message getMessage() {
        return Echo.getMsg();
    }

    public void changeMessage(Message m) {
        Echo.getMsg().setTitle(m.getTitle());
        Echo.getMsg().setBody(m.getBody());
        Echo.getMsg().setBy(m.getBy());
    }
}
