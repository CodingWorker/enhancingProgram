package com.example;

import javax.jms.JMSException;
import javax.naming.NamingException;

/**
 * Created by daiya on 2017/7/10.
 */
public class Main {
    public static void main(String[] args) throws JMSException, NamingException {
        HelloPublisher helloPublisher = new HelloPublisher("ConnectionFactory", "topic/topicTest");

        try {
            for (int i = 1; i < 11; i++) {
                String msg = "Hello World no. " + i;
                System.out.println("Publishing message: " + msg);
                helloPublisher.publish(msg);
            }

            helloPublisher.receive();

            helloPublisher.close();//session和connection用完之后一定记得关闭
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (null != helloPublisher) {
                try {
                    helloPublisher.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
