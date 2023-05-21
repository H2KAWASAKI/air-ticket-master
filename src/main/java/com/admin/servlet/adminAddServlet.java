package com.admin.servlet;

import com.admin.bean.Admin;
import com.admin.dao.adminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


public class adminAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Admin admin =new Admin();
        boolean flag=true;
        try{
            admin.setUsername(request.getParameter("username"));
            admin.setPassword(request.getParameter("password"));
            new adminDao().addAdmin(admin);
        }catch (Exception e) {
            flag=false;
        }
        PrintWriter out = response.getWriter();
        if (flag==false)
        {
            out.println("<script language='javascript'>alert('添加失败，请确认数据重新添加')</script>");
        }
        else {
            out.println("<script language='javascript'>alert('添加成功')</script>");
        }
        out.println("<script language='javascript'>window.location.href='add_Admin.jsp'</script>");
    }
}
