package com.admin.servlet;

import com.admin.bean.Admin;
import com.admin.bean.Flight;
import com.admin.dao.adminDao;
import com.admin.dao.flightDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


public class updateAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Admin admin=new Admin();
        boolean flag=true;
        try {
            admin.setUsername(request.getParameter("username"));
            admin.setPassword(request.getParameter("password"));

            new adminDao().updateAdmin(admin);
        }
        catch (Exception e){
            flag=false;
        }
        PrintWriter out = response.getWriter();
        if (flag==false)
        {
            out.println("<script language='javascript'>alert('修改失败，请确认数据重新添加')</script>");
        }
        else {
            out.println("<script language='javascript'>alert('修改成功')</script>");
        }
        out.println("<script language='javascript'>window.location.href='index.jsp'</script>");
    }
}
