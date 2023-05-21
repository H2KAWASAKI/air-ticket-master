package com.user.servlet;

import com.admin.bean.Order;
import com.admin.bean.Person;
import com.user.dao.indexDao;
import com.user.dao.indexOrderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class indexOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        Order order=new Order();
        order.setOrderId(request.getParameter("orderId"));
        order.setOrderName(request.getParameter("orderName"));
        order.setOrderUser(request.getParameter("orderUser"));
        order.setFlightNumber(request.getParameter("flightNumber"));
        order.setPersonName(request.getParameter("personName"));
        order.setOrderDate(formatter.format(date));
        order.setGrade(request.getParameter("grade"));
        order.setPersonId(request.getParameter("personId"));
        order.setOrderMoney1(Double.valueOf(request.getParameter("orderMoney1")));
        order.setOederMoney2(Double.valueOf(request.getParameter("orderMoney2")));
        order.setContcatName(request.getParameter("contactName"));
        order.setContactPhone(request.getParameter("contactPhone"));

        String username=request.getParameter("orderUser");
        Person person= new indexDao().searchPerson(username);
        System.out.println(person);
        if (person==null||person.equals(null)||person.equals("null")) {
            System.out.println("未注册用户");
        }
        else {
            if (person.getScore() < 4)
            {
                List<Order> orders=new indexOrderDao().selectOrder(username,"","","","");
                person.setScore(10 *orders.size());
            }
            person.setScore(person.getScore()-4);
            new indexDao().updatePerson(person);
        }

        new indexDao().addOrder(order);
        new indexDao().updateFlightNumber(request.getParameter("grade"),
                request.getParameter("flightNumber"), Integer.parseInt(request.getParameter("number")));

        String re=request.getContextPath()+"/default/paySucess.jsp";
        PrintWriter out=response.getWriter();
        out.println("<script language='javascript'>alert('购买成功!')</script>");
        out.println("<script language='javascript'>window.location.href='"+re+"'</script>");

    }
}
