package com.test;

import com.sun.org.apache.bcel.internal.generic.IUSHR;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * Created by daiya on 2017/8/31.
 */
@WebServlet
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StaticTest staticTest=new StaticTest();
        String valStr=req.getParameter("val");
        if(valStr==null){
            valStr="no-value";
        }
        staticTest.push(valStr);

        StringBuilder sb=new StringBuilder("{\"data\":[");
        List list=StaticTest.getList();
        Iterator<String> iterator=list.iterator();
        if(iterator.hasNext()) sb.append("\""+iterator.next()+"\"");
        while(iterator.hasNext()){
            sb.append(",\""+iterator.next()+"\"");
        }
        sb.append("]}");

        PrintWriter writer=resp.getWriter();
        writer.write(sb.toString());
    }
}
