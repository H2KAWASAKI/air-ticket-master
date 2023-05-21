package com.user.filter;

import com.admin.bean.Admin;
import com.user.bean.indexUser;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "indexFilter")
public class indexFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        HttpServletRequest request1=(HttpServletRequest) request;
        String servletPath =request1.getServletPath();
        PrintWriter out=response.getWriter();

        boolean verifyRes=false;
        HttpSession session =request1.getSession();
        Object loginObj=session.getAttribute("user");
        if (loginObj instanceof indexUser) {
            indexUser user =(indexUser) loginObj;
            if (user.getUserID()>0)
            {
                verifyRes=true;
            }
        }
        if (!verifyRes){
            HttpServletResponse response1 =(HttpServletResponse) response;
            response1.sendRedirect(request1.getContextPath()+"/login.jsp");
        }
        else {
            chain.doFilter(request,response);
        }

    }
}
