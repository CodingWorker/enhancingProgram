package com.test;

import com.sun.corba.se.impl.ior.WireObjectKeyTemplate;
import com.sun.deploy.util.StringUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by daiya on 2017/8/31.
 */
@WebServlet
public class Index extends HttpServlet {
    @Override
    public void  doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException{
        SingletonDemo singletonDemo=SingletonDemo.getInstance();

        PrintWriter writer = resp.getWriter();
        String incrStr=req.getParameter("incr");
        int incr=1;
        if(null!=incrStr){
            incr=Integer.parseInt(incrStr);
        }
        singletonDemo.incrCount(incr);
        int count=singletonDemo.getCount();
        writer.write(count+"");
    }

}
