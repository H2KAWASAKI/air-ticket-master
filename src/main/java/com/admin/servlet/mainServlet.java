package com.admin.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.admin.dao.adminIndexDao;
import com.admin.bean.temp;


public class mainServlet extends HttpServlet {
            @Override
            protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                doPost(request,response);
            }

            @Override
            protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                request.setCharacterEncoding("utf-8");
                response.setContentType("text/html;charset=utf-8");
                adminIndexDao adminIndexDao=new adminIndexDao();
                int all_order = 0,all_user = 0,all_person = 0,all_flight = 0, new_order = 0;
                Map<String, Integer> map=null;
                try {
                    all_order=adminIndexDao.allOrder();
                    all_user=adminIndexDao.allUser();
                    all_person=adminIndexDao.allPerson();
                    all_flight=adminIndexDao.allFlight();
                    new_order=adminIndexDao.newOrder();
                    System.out.println(9);
                    map=adminIndexDao.orderDiff();
                    System.out.println(10);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                HttpSession session=request.getSession();
        temp tmp=new temp(all_order,all_user,all_person, all_flight);

        session.setAttribute("temp",tmp);
        response.sendRedirect(request.getContextPath()+"/admin/add_Flight.jsp");

    }
}
