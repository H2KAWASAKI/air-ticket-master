package com.admin.servlet;

import com.admin.dao.flightDao;
import com.admin.dao.orderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


public class orderRemoveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String orderId=request.getParameter("orderId");
//        System.out.println(OrderId);
        boolean orders= new orderDao().deleteOrder(orderId);
        response.sendRedirect(request.getContextPath()+"/admin/orderSearchServlet");

    }
}
