package com.example;

import javax.annotation.Resource;
import javax.jms.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Hashtable;

/**
 * Created by daiya on 2017/7/10.
 */
public class HelloPublisher {

    //connection create->session create->producer,consumer,message

    @Resource(lookup = "jms/ConnectionFactory")
    public TopicConnection topicConnection;//jms 连接

    public TopicSession topicSession;//jms回话

    public TopicPublisher topicPublisher;//消息发布者

    public TopicSubscriber topicSubscriber;//消息订阅者

    @Resource(lookup = "jms/Topic")
    public Topic topic;//主题

    public HelloPublisher(String factoryJNDI, String topicJNDI)throws JMSException,NamingException{
        Hashtable<String,String> env=new Hashtable<>();

        //设置连接jms容器的属性
        env.put(Context.INITIAL_CONTEXT_FACTORY,
                "org.jnp.interfaces.NamingContextFactory");
        env.put(Context.PROVIDER_URL, "localhost:1099");
        env.put("java.naming.rmi.security.manager", "yes");
        env.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");

        //创建jms容器的上下文
        Context context=new InitialContext(env);

        //通过连接工厂的JNDI名查找
        TopicConnectionFactory topicFactory=(TopicConnectionFactory)context.list(factoryJNDI);

        //使用连接工厂创建一个jms连接
        topicConnection=topicFactory.createTopicConnection();

        //通过jms连接创建一个jms连接(false指明该session为非事务性）。第二个参数表示接受消息后会自动回复
        topicSession=topicConnection.createTopicSession(false,Session.AUTO_ACKNOWLEDGE);

        //通过上下文查找到一个主题
        topic=(Topic) context.lookup(topicJNDI);

        //使用session来创建一个特定主题的消息发送者
        topicPublisher=topicSession.createPublisher(topic);
    }

    /**
     * 发布文本消息
     * @param msg
     * @throws JMSException
     */
    public void publish(String msg)throws JMSException{
        //使用session来创建一个文本消息,session用来创建一个消息的生产者
        //消息的消费者也是由session来创建的
        TextMessage message=topicSession.createTextMessage(msg);

        //消息发送。发布到特定主题
        topicPublisher.publish(topic,message);
    }

    public void receive()throws JMSException{
        if(this.topicSubscriber==null){
            this.topicSubscriber=topicSession.createSubscriber(topic);
        }

        Message msg= this.topicSubscriber.receive();

    }

    /**
     * 关闭jms session和连接
     * @throws JMSException
     */
    public void close()throws JMSException{
        topicSession.close();
        topicConnection.close();
    }
}
