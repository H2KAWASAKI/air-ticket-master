package com.admin.servlet;

import com.admin.bean.Admin;
import com.admin.dao.adminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class adminSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
        List<Admin> admins= new adminDao().selectAdmin("%");
        System.out.println(admins.size());
        session.setAttribute("admins",admins);
        response.sendRedirect(request.getContextPath()+"/admin/list_Admin.jsp");
    }
}
