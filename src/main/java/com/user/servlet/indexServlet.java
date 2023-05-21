package com.user.servlet;

import com.admin.bean.Flight;
import com.user.dao.indexDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class indexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter=response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String start=request.getParameter("flightStart");
        String end=request.getParameter("flightEnd");
        String startTime=request.getParameter("flightStartTime");
        String endTime=request.getParameter("flightEndTime");
        HttpSession session=request.getSession();

        List<Flight> flights=new indexDao().selectFlight(start,end,startTime,endTime);

        session.setAttribute("flights",flights);
        response.sendRedirect(request.getContextPath()+"/list.jsp");
    }
}
