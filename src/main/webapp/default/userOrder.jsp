
<%@ page import="com.user.bean.indexUser" %>
<%@ page import="com.admin.bean.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.bean.Flight" %>
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
    List<Order> indexOrders= (List<Order>) session1.getAttribute("indexOrders");
    String  username=user.getUsername();
    List<Flight> flightList= (List<Flight>) session1.getAttribute("flights");

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
                                out.println("<li><a href='/indexLogoutServlet'>退出登录</a></li>");
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
            <a class="" href="/index.jsp"><img src="/images/logo1.png" width="210" height="70" alt="系统LOGO"
                                              class="pull-left mar-right-30" style="margin-left: -15px" /></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li >
                    <a href="/list.jsp"><i class="icon iconfont icon-nav-block font24">&#xe620;</i>
                        在线预订</a>
                </li>
                <li class="active">
                    <a href=""><i class="icon iconfont icon-nav-block font24">&#xe61c;</i>
                        订单管理</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- header end -->

<div class="container bg-gray-eee box-shadow mar-bottom-30"
     style="padding-right:0px; padding-left:0px; position:relative; margin-top:120px;">

    <!-- main -->
    <div class="rightCon" style="">
        <!-- 引导 -->
        <ol class="breadcrumb">
            <li>首页</li>
            <li>订单管理</li>
            <li class="active">订单列表</li>
        </ol>
        <!-- 引导结束 -->
        <form action="indexOrderSearchServlet" method="post">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label  class="w90 text-right">航班号</label>
                        <input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;"
                               id="" placeholder="number" name="flightNumber">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label  class="w90 text-right">起飞日期</label>
                        <input type="text" class="form-control input-sm" style=" width:90px; display:inline-block;"
                               placeholder="日期" name="startTime">
                        &nbsp;至&nbsp;
                        <input type="text" class="form-control input-sm" style=" width:90px; display:inline-block;"
                               placeholder="日期" name="endTime">
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="w90 text-right">乘机人</label>
                        <input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;"
                                placeholder="姓名" name="personName">
                    </div>
                </div>

            </div>
            <div class="text-center mar-top-10 bor-top-solid-1 pad-top-10 mar-bottom-10">
                <button type="submit" class="btn btn-danger btn-sm mar-right-20">查询</button>
                <button type="submit" class="btn btn-default btn-sm mar-right-20 ydr">清空条件</button>
            </div>
        </form>
        <table id="ticketinfo" border="0" cellspacing="0" cellpadding="0"
               class="table table-hover table-striped font12 table-bordered v-align-top">
            <tr>
                <th>订单号</th>
                <th>订单名称</th>
                <th>乘机人</th>
                <th>航班号</th>
                <th>舱位</th>
                <th>结算总价</th>
                <th>操作</th>
            </tr>

            <c:forEach var="s" items="<%=indexOrders%>">
                <tr>
                    <td>${s.orderId}</td>
                    <td>${s.orderName}</td>
                    <td>${s.personName}</td>
                    <td>${s.flightNumber}</td>
                    <td>${s.grade}</td>
                    <td>${s.oederMoney2}</td>
                    <td style="width: 101px;">
                        <a class="btn-danger" style="display: block;text-align: center;" href="indexOrderDeleteServlet?orderId=${s.orderId}&orderDate=${s.orderDate}&flightNumber=${s.flightNumber}&grade=${s.grade}">取消订单</a>
                    </td>
                </tr>
            </c:forEach>

            <!-- 订单信息 -->
        </table>
        <div class="clearfix"></div>
    </div>
</div>
<!-- 留言板结束 -->
<script>
    $(function(){
        //清空form表单下的输入框
        $('.ydr').on('click', function () {
            $(':input','form')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
        });
    })
</script>
</body>
</html>