
<%@ page import="com.user.bean.indexUser" %>
<%@ page import="static java.lang.Integer.parseInt" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.user.dao.indexDao" %>
<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/29
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    HttpSession session1=request.getSession();
    indexUser user= (indexUser) session1.getAttribute("user");
    String  username=user.getUsername();
    String url="userInformation.jsp";
    String number=request.getParameter("number");
    if (Integer.parseInt(number)==0)
    {
        out.println("<script language='javascript'>alert('余票不足，请重选')</script>");
        out.println("<script language='javascript'>window.location.href='/airTicket_war/login.jsp'</script>");
    }
    String orderName=request.getParameter("orderName");
    String flightNumber=request.getParameter("flightNumber");
    String piao=request.getParameter("piao");//票面价
    String you=request.getParameter("you");//优惠价
    if(new indexDao().searchPerson(username)==null||new indexDao().searchPerson(username).getScore()<4)
    {
        you=piao;
    }
    String grade=request.getParameter("cang");//仓位
    String cang=null;
    if (grade.equals("1"))
        cang="经济舱";
    else  if (grade.equals("2"))
        cang="商务舱";
    else
        cang="头等舱";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <title>民航订票</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/common.css" rel="stylesheet" />
    <link href="/css/enterprise.css" rel="stylesheet" />
    <link href="/css/iconfont.css" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

</head>

<body class="bg-body">
<!-- header -->
<nav class="navbar navbar-default navbar-fixed-top bg-white">
    <!-- 小导航 -->
    <nav class="navbar navbar-default" style="
          min-height: 30px;
          line-height: 30px;
          margin-bottom: 0px;
          border-radius: 0;
        ">
        <div class="container font12">
            <ul class="nav navbar-nav nav-top-small userinfo" style="margin-left: -15px">
                <li class="dropdown">
                    <%--                    <a href="<%=url%>" class="dropdown-toggle"><%=username%></a>--%>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right nav-top-small">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        <%=username%> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            if (username.equals("请登录"))
                                out.println("<li><a href='"+url+"' class='dropdown-toggle'>登录</a></li>");
                            else {
                                out.println("<li><a href='" +url+ "'>进入主页</a></li>");
                                out.println("<li><a href='/airticket_war//indexLogoutServlet'>退出登录</a></li>");
                            }
                        %>

                    </ul>
                </li>
            </ul>

        </div>
    </nav>
    <!-- 小导航结束 -->

    <div class="container">
        <div class="navbar-header">
            <a class="" href="/airticket_war/index.jsp"><img src="/images/logo1.png" width="210" height="70" alt="系统LOGO"
                                              class="pull-left mar-right-30" style="margin-left: -15px" /></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href=""><i class="icon iconfont icon-nav-block font24">&#xe620;</i>
                        在线预订</a>
                </li>
                <li>
                    <a href="indexOrderSearchServlet"><i class="icon iconfont icon-nav-block font24">&#xe61c;</i>
                        订单管理</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- header end -->

<div>
    <form id="orderForm" action="indexOrderServlet" method="post">
        <!-- 管理模板 -->
        <div class="container bg-gray-eee box-shadow mar-bottom-30 xx1"
             style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
            <div class="col-sm-7 container bg-white  pad-bottom-20">
                <!-- 航班信息 -->
                <div style="overflow: hidden;">
                    <h3 class="mar-bottom-20" style="display: block; float: left;">乘机人</h3>
                    <!-- <a href="" style="display: block; float: left; margin-left: 310px; line-height: 70px;">历史乘机人</a> -->
                </div>
                <div class="order">
                    <div class="orderbody">
                        <input name="personName" type="text" class="form-control input-sm w300"
                               style="display: inline-block; width:460px;" placeholder="姓名，与登机所持证件中的姓名一致">

                        </select>
                    </div>
                    <div class="mar-top-10">
                        <select name="" class="form-control input-sm w150" style="display: inline-block;">
                            <option value="身份证" selected="selected">身份证</option>
                        </select> <input name="personId" type="text" class="form-control input-sm w300"
                                         style="display: inline-block;" placeholder="证件号码">
                    </div>
                </div>
                <!-- 航班信息 结束 -->
                <!-- 联系人 -->
                <h3 class="mar-bottom-20">联系人</h3>
                <input name="contactName" type="text" class="form-control input-sm"
                       style="display: inline-block; width: 460px;" placeholder="姓名">
                <div class="mar-top-10">
                    <select name="select" class="form-control input-sm w110 mar-right-10"
                            style="display: inline-block;">
                        <option value="国家" selected="selected">中国&nbsp;&nbsp;+86</option>
                    </select> <input name="contactPhone" type="text" class="form-control input-sm"
                                     style="display: inline-block; width: 337px;" placeholder="手机号码，接收航班信息">
                </div>
            </div>

            <!-- 航班信息 -->
            <div class="col-sm-5 bg-gray-eee flightinfo xx2" style="line-height:43px;">
                <div><h3 style="display: inline-block;">航班编号为:</h3><span style="    margin-top: 23px;
					margin-left: 26px;
					display: inline-block;
					font-size: 19px;
					color: #777;"><%=flightNumber%></span></div>
                <div><h3 style="display: inline-block; ">仓别:</h3><span style="    margin-top: 23px;
					margin-left: 26px;
					display: inline-block;
					font-size: 19px;
					color: #777;"><%=cang%></span></div>
                <div><h3 style="display: inline-block;">总金额为:</h3><span style="    margin-top: 23px;
					margin-left: 26px;
					display: inline-block;
					font-size: 19px;
					color: #777;">￥<%=piao%></span></div>
                <div><h3 style="display: inline-block;">应付金额为:</h3><span style="    margin-top: 23px;
					margin-left: 26px;
					display: inline-block;
					font-size: 23px;
					color: rgba(240, 6, 6, 0.775);">￥<%=you%></span></div>
            </div>

        </div>
        <div style="display: none">
            <input name="orderId" value="<%= "O"+System.currentTimeMillis()%>">
            <input name="orderName" value="<%=flightNumber+orderName+"航班"%>">
            <input name="orderUser" value="<%=username%>">
            <input name="flightNumber" value="<%=flightNumber%>">
            <%--personname--%>
            <input name="orderDate" value="">
            <input name="grade" value="<%=grade%>">
            <%--personID--%>
            <input name="orderMoney1" value="<%=piao%>">
            <input name="orderMoney2" value="<%=you%>">
            <%--contactName--%>
            <%--contactPhone--%>
            <input name="number" value="<%=number%>">
        </div>

        <div class="text-center mar-top-10">
            <input type="checkbox" name="choice">&nbsp;我已阅读并接受免责条款、费用扣除、退保等在内的重要事项，其中包括
            <a href="">《网络电子客票协议》</a> <a href="">《航意险说明》</a> <a href="">《延误险说明》</a>
            <a href="">《保险经纪委托协议》</a><br />
            <button  class="btn btn-danger mar-top-20" type="submit" >提交订单</button>
        </div>
    </form>
</div>
<!-- 留言板结束 -->
</body>
</html>