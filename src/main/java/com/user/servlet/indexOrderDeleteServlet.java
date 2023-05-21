package com.user.servlet;

import com.user.dao.indexDao;
import com.user.dao.indexOrderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class indexOrderDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        PrintWriter out=response.getWriter();
        String orderId=request.getParameter("orderId");

        String flightNumber=request.getParameter("flightNumber");
        String orderDate=new indexDao().selectFlightTime(flightNumber);
        int grade = Integer.parseInt(request.getParameter("grade"));
        Date orderTime=null;
//        System.out.println(orderDate);
        try {
            orderTime = formatter.parse(orderDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date date = new Date(System.currentTimeMillis());//当前时间
        long result = orderTime.getTime()-date.getTime();
        System.out.println(result);
        if (result>0){
            new indexOrderDao().delettOrder(orderId,flightNumber,grade);
            out.println("<script language='javascript'>alert('取消成功')</script>");
        }else {
            out.println("<script language='javascript'>alert('已出行，无法取消！')</script>");
        }
        String url=request.getContextPath()+"/default/indexOrderSearchServlet";
        out.println("<script language='javascript'>window.location.href='"+url+"'</script>");
    }
}
