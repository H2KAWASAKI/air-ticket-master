package com.user.servlet;

import com.admin.bean.Person;
import com.user.bean.indexUser;
import com.user.dao.indexDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


public class indexUpdatePersonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
        indexUser user= (indexUser) session.getAttribute("user");
        String orderUser=user.getUsername();
        String personName=request.getParameter("personName");
        String personId=request.getParameter("personId");
        String score=request.getParameter("score");
        Person person=new Person();
        person.setUserName(orderUser);
        person.setPersonName(personName);
        person.setPersonId(personId);
        person.setScore(Integer.parseInt(score));
        new indexDao().updatePerson(person);
        PrintWriter out=response.getWriter();
        String url=request.getContextPath()+"/default/userInformation.jsp";
        out.println("<script language='javascript'>alert('更新信息成功!')</script>");
        out.println("<script language='javascript'>window.location.href='"+url+"'</script>");
    }
}
