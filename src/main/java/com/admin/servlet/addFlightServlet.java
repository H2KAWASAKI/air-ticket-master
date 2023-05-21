package com.admin.servlet;

import com.admin.bean.Flight;
import com.admin.dao.flightDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class addFlightServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Flight flight=new Flight();
        boolean flag=true;
        try {
            flight.setFlightId(request.getParameter("flightId"));
            flight.setFlightNumber(request.getParameter("flightNumber"));
            flight.setFlightStart(request.getParameter("flightStart"));
            flight.setFlightEnd(request.getParameter("flightEnd"));
            flight.setFlightStartAir(request.getParameter("flightStartAir"));
            flight.setFlightEndAir(request.getParameter("flightEndAir"));
            flight.setFlightStartTime(request.getParameter("flightStartTime"));
            flight.setFlightEndTime(request.getParameter("flightEndTime"));

            flight.setFlightHighNumber(Integer.parseInt(request.getParameter("flightHighNumber")));
            flight.setFlightMidNumber(Integer.parseInt(request.getParameter("flightMidNumber")));
            flight.setFlightLowNumber(Integer.parseInt(request.getParameter("flightLowNumber")));
            flight.setFlightHighPrice(Double.parseDouble(request.getParameter("flightHighPrice")));
            flight.setFlightMidPrice(Double.parseDouble(request.getParameter("flightMidPrice")));
            flight.setFlightLowPrice(Double.parseDouble(request.getParameter("flightLowPrice")));
            flight.setDelay(0);
            flag = new flightDao().addFilght(flight);
        }
        catch (Exception e){
            flag=false;
        }
//        System.out.println(flag);
        PrintWriter out = response.getWriter();
        if (flag==false)
        {
            out.println("<script language='javascript'>alert('添加失败，请确认数据重新添加')</script>");
        }
        else {
            out.println("<script language='javascript'>alert('添加成功')</script>");
        }
        out.println("<script language='javascript'>window.location.href='add_Flight.jsp'</script>");
//        response.sendRedirect(request.getContextPath() + "/admin/add_Flight.jsp");
    }
}
