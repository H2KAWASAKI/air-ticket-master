package com.admin.servlet;

import com.admin.bean.User;
import com.admin.dao.userDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class userSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
        List<User> users= new userDao().selectUser();
        System.out.println(users.size());
        session.setAttribute("users",users);
        response.sendRedirect(request.getContextPath()+"/admin/list_User.jsp");
    }
}
