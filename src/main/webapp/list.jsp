<%@ page import="com.admin.bean.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.bean.indexUser" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/29
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<html lang="zh-CN">
<%
    HttpSession session1 =request.getSession();
    List<Flight> flightList= (List<Flight>) session1.getAttribute("flights");

    indexUser user= (indexUser) session1.getAttribute("user");
    String username=null;
    String url=null;
    if (user ==null){
        username="请登录";
        url="login.jsp?urls=/list.jsp";
    }
    else {
        username=user.getUsername();
        url="default/userInformation.jsp";
    }
%>
<head>
    <meta charset="utf-8">
    <title>民航订票</title>
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/corptravel.css" rel="stylesheet">
    <link href="/css/enterprise.css" rel="stylesheet">
    <link href="/css/iconfont.css" rel="stylesheet">
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
                    <%--<a href="user/login.html" class="dropdown-toggle"> 请登录</a>--%>
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
                                out.println("<li><a href='"+url+"'>登录</a></li>");
                            else {
                                out.println("<li><a href='" +url+ "'>进入主页</a></li>");
                                out.println("<li><a href='indexLogoutServlet'>退出登录</a></li>");
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
            <a class="" href="index.jsp"><img src="images/logo1.png" width="210" height="70" alt="系统LOGO"
                                                 class="pull-left mar-right-30" style="margin-left: -15px" /></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="list.jsp"><i class="icon iconfont icon-nav-block font24">&#xe620;</i>
                        在线预订</a>
                </li>
                <li>
                    <a href="default/indexOrderSearchServlet"><i class="icon iconfont icon-nav-block font24">&#xe61c;</i>
                        订单管理</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- header end -->
<!-- 搜索 -->
<div class="index-wall white " style=" ">
    <div class="container" style=" position:relative;height: 50px;line-height: 50px;">
        <form class="form-inline" id="serachForm" action="indexServlet" method="post">
            <div class="form-group mar-left-10">
                <label for="">出发城市</label>
                <input type="text" name="flightStart" class="form-control" style="width: 130px;" value=""
                       placeholder="上海" />
            </div>
            <div class="form-group mar-left-10">
                <label for="">到达城市</label> <input type="text" name="flightEnd" class="form-control"
                                                  style="width: 130px;" id="" value="" placeholder="北京">
            </div>
            <div class="form-group mar-left-10">
                <label for="">出发日期</label> <input type="text" class="form-control " style="width: 150px;"
                                                  id="startTime" name="flightStartTime" value="" placeholder="输入出发日期">
            </div>
            <div class="form-group mar-left-10">
                <label for="">返回日期</label> <input type="text" class="form-control " id="endTime"
                                                  style="width: 150px;" name="flightEndTime" value="" placeholder="输入到达日期">
            </div>
            <button class="btn btn-warning mar-left-10" type="submit" style="width: 95px;">搜索</button>
        </form>
    </div>
</div>
<!-- 搜索结束 -->


<!-- 列表开始 -->
<div class="container mar-bottom-30 ">
    <div class="hangbanlist">

        <c:forEach var="s" items="<%=flightList%>">
            <div>
                <!-- 表头 -->
                <ul class="list-inline bor-bottom-solid-1  ">
                    <li class="w-percentage-25"><strong style="font-size: 18px;">航班号</strong>${s.flightNumber}</li>
                    <li class="text-right w80"> <strong class="time ">${s.flightStartTime}</strong></li>
                    <li class=""> —— </li>
                    <li class="w80"> <strong class="time ">${s.flightEndTime}</strong></li>
                    <li class="w100 text-right">${s.flightStartAir}</li>
                    <li class=""> —— </li>
                    <li class=" w100"> ${s.flightEndAir}</li>

                </ul>
                <!-- 表头结束 -->
                <!-- 表BODY -->
                <div class="collapse " id="collapseExample2" style=" display:block;">
                    <div class="hangbanlist-body " style=" background-color:#FEFCFC;">
                        <ul class="list-inline">
                            <li class="w-percentage-20"><strong class="blue-0093dd">头等舱</strong></li>
                            <li class="w-percentage-25">座位数：${s.flightHighNumber}</li>
                            <li class="w-percentage-25">票面价：<span class="rmb">￥${s.flightHighPrice}</span></li>
                            <li class="w-percentage-20 ">优惠价：<strong class="rmb orange-f60 font16">￥${s.flightHighPrice * 0.95}</strong> <span
                                    class="gray font12">95折</span></li>
                            <li class="pull-right "><button type="button" class="btn btn-danger btn-sm"
                                                            onClick="window.location.href ='default/indexOrder.jsp?orderName=${s.flightStart}-${s.flightEnd}&flightNumber=${s.flightNumber}&cang=3&number=${s.flightHighNumber}&piao=${s.flightHighPrice}&you=${s.flightHighPrice*0.95}';">订票</button></li>
                        </ul>
                        <ul class="list-inline">
                            <li class="w-percentage-20"><strong class="blue-0093dd">商务舱</strong></li>
                            <li class="w-percentage-25">座位数：${s.flightMidNumber}</li>
                            <li class="w-percentage-25">票面价：<span class="rmb">￥${s.flightMidPrice}</span></li>
                            <li class="w-percentage-20 ">优惠价：<strong class="rmb orange-f60 font16">￥${s.flightMidPrice *0.85}</strong> <span
                                    class="gray font12">85折</span></li>
                            <li class="pull-right "><button type="button" class="btn btn-danger btn-sm"
                                                            onClick="window.location.href ='default/indexOrder.jsp?orderName=${s.flightStart}-${s.flightEnd}&flightNumber=${s.flightNumber}&cang=2&number=${s.flightMidNumber}&piao=${s.flightMidPrice}&you=${s.flightMidPrice*0.85}';">订票</button></li>
                        </ul>
                        <ul class="list-inline">
                            <li class="w-percentage-20"><strong class="blue-0093dd">经济舱</strong></li>
                            <li class="w-percentage-25">座位数：${s.flightLowNumber}</li>
                            <li class="w-percentage-25">票面价：<span class="rmb">￥${s.flightLowPrice}</span></li>
                            <li class="w-percentage-20 ">优惠价：<strong class="rmb orange-f60 font16">￥${s.flightLowPrice*0.75}</strong> <span
                                    class="gray font12">75折</span></li>
                            <li class="pull-right "><button type="button" class="btn btn-danger btn-sm"
                                                            onClick="window.location.href ='default/indexOrder.jsp?orderName=${s.flightStart}-${s.flightEnd}&flightNumber=${s.flightNumber}&cang=1&number=${s.flightLowNumber}&piao=${s.flightLowPrice}&you=${s.flightLowPrice*0.75}';">订票</button></li>
                        </ul>
                    </div>
                </div>
                <!-- 表BODY 结束 -->
            </div>
        </c:forEach>

    </div>

    <!-- 分页结束 -->
    <div class="clearfix"></div>




</div>
<!-- 列表结束 -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


</body>

</html>