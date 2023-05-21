package com.admin.servlet;

import com.admin.bean.Flight;
import com.admin.dao.flightDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class flightSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
        String flightnumber=request.getParameter("flightNumber");
        if (flightnumber==null){
            flightnumber ="%";
        }
        List<Flight> flights= new flightDao().selectFlight(flightnumber);
//        System.out.println(flights.size());
        session.setAttribute("flights",flights);
        response.sendRedirect(request.getContextPath()+"/admin/list_Flight.jsp");
    }
}
