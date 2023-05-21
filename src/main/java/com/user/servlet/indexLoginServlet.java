package com.user.servlet;

import com.admin.bean.User;
import com.user.bean.indexUser;
import com.user.dao.indexUserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


public class indexLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String url = request.getParameter("urls");
        System.out.println(url);
        if (url==null || url.isEmpty()||url.equals("null"))
        {
            url = "/index.jsp";
        }
        System.out.println(url);
        indexUser user=new indexUserDao().checkUserByName(username);
        if(user!=null&&username.equals(user.getUsername())&&password.equals(user.getPassword()))
        {
            HttpSession session=request.getSession();
            session.setAttribute("user",user);
            response.sendRedirect(request.getContextPath()+url);
        }
        else {
            PrintWriter out = response.getWriter();
            out.println("<script language='javascript'>alert('用户名或密码错误，请重新输入！')</script>");
            out.println("<script language='javascript'>window.location.href='login.jsp'</script>");

        }

    }
}
