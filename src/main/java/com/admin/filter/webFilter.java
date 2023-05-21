package com.admin.filter;

import com.admin.bean.Admin;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class webFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        chain.doFilter(request, response);
        response.setContentType("text/html;charset=utf-8");
        HttpServletRequest request1=(HttpServletRequest) request;
        String servletPath =request1.getServletPath();
        PrintWriter out=response.getWriter();
        if (!servletPath.equals("/admin/login.jsp")&&!servletPath.equals("/admin/loginServlet")){
            boolean verifyRes=false;
            HttpSession session =request1.getSession();
            Object loginObj=session.getAttribute("admin");
            if (loginObj instanceof Admin) {
                Admin admin =(Admin) loginObj;
                if (admin.getAdminID()>0) {
                    verifyRes=true;
                }
            }
            if (!verifyRes){
                HttpServletResponse response1 =(HttpServletResponse) response;
                response1.sendRedirect(request1.getContextPath()+"/admin/login.jsp");
            }
            else {
                chain.doFilter(request,response);
            }
        }
        else {
            chain.doFilter(request,response);
        }
    }
}
