<%@ page import="com.user.bean.indexUser" %><%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/30
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    HttpSession session1=request.getSession();
    indexUser user= (indexUser) session1.getAttribute("user");

    String  username=user.getUsername();

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
                        <li><a href='/airticket_war/indexLogoutServlet'>退出登录</a></li>
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
                <li >
                    <a href="searchList.html"><i class="icon iconfont icon-nav-block font24">&#xe620;</i>
                        在线预订</a>
                </li>
                <li >
                    <a href="order/orderList.html"><i class="icon iconfont icon-nav-block font24">&#xe61c;</i>
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
            <li>请先注册成为会员</li>

        </ol>
        <!-- 引导结束 -->
        <form action="indexAddPersonServlet" method="post">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label  class="w90 text-right">姓名</label>
                        <input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;"
                               id="" placeholder="张三" name="personName">
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label  class="w90 text-right">身份证号</label>
                        <input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;"
                               placeholder="1234567890" name="personId">
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="w90 text-right">积分</label>
                        <input type="text" class="form-control input-sm" style=" width:200px; display:inline-block;"
                               placeholder="积分" name="score" value="100"  readonly="readonly">
                    </div>
                </div>

            </div>
            <div class="text-center mar-top-10 bor-top-solid-1 pad-top-10 mar-bottom-10">
                <button type="submit" class="btn btn-danger btn-sm mar-right-20">提交</button>

            </div>
        </form>

        <div class="clearfix"></div>
    </div>
</div>
<!-- 留言板结束 -->
</body>
</html>