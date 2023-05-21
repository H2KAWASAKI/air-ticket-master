package com.user.servlet;

import com.admin.bean.Order;
import com.user.bean.indexUser;
import com.user.dao.indexOrderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class indexOrderSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
        indexUser user= (indexUser) session.getAttribute("user");
        String orderUser=user.getUsername();
        String flightNumber=request.getParameter("flightNumber");
        String personName=request.getParameter("personName");
        String startTime=request.getParameter("startTime");
        String endTime=request.getParameter("endTime");
        List<Order> orders=new indexOrderDao().selectOrder(orderUser,flightNumber,personName,startTime,endTime);
        session.setAttribute("indexOrders",orders);
        response.sendRedirect(request.getContextPath()+"/default/userOrder.jsp");
    }
}
