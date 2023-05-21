package com.admin.servlet;

import com.admin.dao.adminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;


public class adminRemoveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username=request.getParameter("userName");
        new adminDao().deleteAdmin(username);
        response.sendRedirect(request.getContextPath()+"/admin/adminSearchServlet");
    }
}
