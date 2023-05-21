package com.user.servlet;

import com.user.bean.indexUser;
import com.user.dao.indexUserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


public class indexRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        indexUser user=new indexUser();
        user.setUsername(username);
        user.setPassword(password);
        new indexUserDao().addUser(user);
        response.sendRedirect(request.getContextPath()+"/register.jsp");
    }
}
