package com.test.study.velocity;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA
 * User:    DaiYan
 * Date:    2017/11/28
 * Project: some-stuff-study
 */
public class HelloVelocity {
    public static void main(String[] args) throws IOException{
        //初始化模板引擎
//        VelocityEngine ve=new VelocityEngine();
//        ve.setProperty(RuntimeConstants.RESOURCE_LOADER,"classpath");
//        ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
//        ve.init();
        Velocity.init();

        //获取模板文件
        Template template=Velocity.getTemplate("src/main/resources/velocity/hellovelocity.vm");

        //设置变量
        VelocityContext vtx=new VelocityContext();
        vtx.put("name", "velocity");
        List<Integer> numbers=new ArrayList<>();
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);

        vtx.put("numbers",numbers);

        //输出
        StringWriter sw=new StringWriter();
        template.merge(vtx,sw);

        System.out.println(sw.toString());
    }
}
