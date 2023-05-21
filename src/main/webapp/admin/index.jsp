<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page import="com.admin.bean.Admin"%>
<%
    HttpSession session1 =request.getSession();
    Admin admin =(Admin)(session1.getAttribute("admin"));
    String username=admin.getUsername();
%>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>民航订票管理后台</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/js/bootstrap-multitabs/multitabs.min.css">
    <link href="/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="index.jsp"><img src="/images/logo-sidebar.png" title="LightYear" alt="LightYear" /></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active">
                            <a class="multitabs" href="mainServlet"><i class="mdi mdi-home"></i>添加航班</a>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-airplane-takeoff"></i> 航班信息管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a class="multitabs" href="add_Flight.jsp">航班信息添加</a> </li>
                                <li> <a class="multitabs" href="flightSearchServlet">航班信息查看</a> </li>
                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-arrow-down-bold"></i> 订单信息管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a class="multitabs" href="orderSearchServlet">订单信息查看</a> </li>

                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-account"></i> 用户信息管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a class="multitabs" href="userSearchServlet">用户信息查看</a> </li>
                            </ul>
                        </li>

                    </ul>
                </nav>

                <div class="sidebar-footer">

                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
<%--                                <a href="/airticket_war/index.jsp">--%>
<%--                                    <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="后台管理模板" />--%>
<%--                            </a>--%>
                                <span><%=username %><span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li ><a target="blank" href="update_Admin.jsp?username=<%=username %>"><i class="mdi mdi-delete"></i> 修改密码</a></li>
                                <li> <a target="blank" href="/index.jsp"><i class="mdi mdi-delete"></i> 进入前台</a></li>
                                <li> <a href="logoutServlet"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                            </ul>
                        </li>

                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">
            <div id="iframe-content"></div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="/js/index.min.js"></script>
</body>

</html>