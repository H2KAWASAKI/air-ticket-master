package com.admin.servlet;

import com.admin.bean.Admin;
import com.admin.dao.adminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * servlet
 * 开发者不会去new MyFirstServlet
 */
public class loginServlet extends HttpServlet {
    // 覆盖doGet() / doPost() 方法

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 向浏览器输出内容
        // 设置编码
        response.setContentType("text/html;charset=utf-8");

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        Admin admin=new adminDao().checkAdminByName(username);
        if (admin!=null&&username.equals(admin.getUsername())&&password.equals(admin.getPassword())) {
            HttpSession session=request.getSession();
            session.setAttribute("admin",admin);
            response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
        }
        else {
            PrintWriter out = response.getWriter();
            out.println("<script language='javascript'>alert('用户名或密码错误，请重新输入！')</script>");
            out.println("<script language='javascript'>window.location.href='login.jsp'</script>");
//            response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

