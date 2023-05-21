package com.admin.servlet;

import com.admin.bean.Flight;
import com.admin.bean.Order;
import com.admin.dao.orderDao;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

public class orderSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
        String orderDate=request.getParameter("orderDate");
        if (orderDate==null){
            orderDate ="%";
        }
        List<Order> orders=new  orderDao().selectOrder(orderDate);
        session.setAttribute("orders",orders);
        response.sendRedirect(request.getContextPath()+"/admin/list_Order.jsp");
    }
}
