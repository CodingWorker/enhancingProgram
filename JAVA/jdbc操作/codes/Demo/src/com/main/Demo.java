package com.main;

import java.sql.*;

/**
 * Created by daiya on 2017/7/3.
 */
public class Demo {
    public static void main(String[] args){
        try{
            Class.forName("com.mysql.jdbc.Driver") ;
        }catch(ClassNotFoundException e){
            System.out.println("找不到驱动程序类 ，加载驱动失败！");
            e.printStackTrace() ;
        }

        //String url="jdbc:sqlserve://localhost:1433;databaseName=LiZanQi";
        String url="jdbc:mysql://db.inter.htiiot.com:3306/htiiot";
        String userName="root";
        String password="HTiiot@123";
        String tableName="user";

        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            conn= DriverManager.getConnection(url,userName,password);
            String sql="SELECT COUNT(?) FROM "+tableName+";";
            ps=conn.prepareStatement(sql);
            ps.setString(1,"id");

            rs=ps.executeQuery();
            while(rs.next()){
                System.out.println(rs.getInt(1));
            }

        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            if(null!=conn){
                try{
                    conn.close();
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }

            if(ps!=null){
                try{
                    ps.close();
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }

            if(rs!=null){
                try{
                    rs.close();
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }
        }

    }
}
