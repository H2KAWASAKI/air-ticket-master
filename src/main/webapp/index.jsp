

<%@ page import="java.util.List" %>

<%@ page import="com.user.dao.indexDao" %>
<%@ page import="com.user.bean.indexUser" %>
<%@ page import="java.io.PrintWriter" %><%--
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
    String username=null;
    String url=null;
    if (user ==null){
        username="请登录";
        url="login.jsp?urls=/index.jsp";
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
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/common.css" rel="stylesheet" />
    <link href="/css/enterprise.css" rel="stylesheet" />
    <link href="/css/iconfont.css" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style>
        #wrapper1{
            width: 1300px;
            overflow: hidden;
            margin: 50px auto;
            /* border: 1px solid #000; */
            display: flex;
        }
         .inner1{
            display: flex;
             margin-bottom:0px
        }
        .inner1>li{
            width:  680px;
            list-style: none;
            /*height: 50px;*/
            text-align: center;
            line-height: 20px;
            font-size: 12px;
        }
    </style>
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
            <a class="" href=""><img src="images/logo1.png" width="210" height="70" alt="系统LOGO"
                                                 class="pull-left mar-right-30" style="margin-left: -15px" /></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li >
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



<div class="content">
    <!--轮播图片 start-->
    <div class="flight-slider flight-banner">
        <div id="slidershow" class="slider-load carousel slide" data-ride="carousel" data-interval=4000 data-pause="hover"
             data-wrap="true" style=" width: 100%;height: 490px; margin-left:auto; margin-right:auto;">

            <ol class="carousel-indicators">
                <li class="active" data-target="#slidershow" data-slide-to="0"></li>
                <li data-target="#slidershow" data-slide-to="1"></li>
                <%--<li data-target="#slidershow" data-slide-to="2"></li>--%>
                <%--<li data-target="#slidershow" data-slide-to="3"></li>
                <li data-target="#slidershow" data-slide-to="4"></li>--%>
            </ol>
            <!--设置轮播的图片-->
            <div class="carousel-inner">
                <div class="item active">
                    <a href="##"><img src="https://www.gxairlines.com/stdair/airline/gx/images/01-1/banner/banner1.jpg"
                                      alt="cat1" style="height: 490px;"></a>
                </div>
                <div class="item">
                    <a href="##"><img src="https://www.gxairlines.com/stdair/airline/gx/images/01-1/banner/banner4.jpg"
                                      alt="cat2" style="height: 490px;"></a>
                </div>

            </div>
            <a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>
    <!-- 轮播图片 end -->
    <div class="flight-quick-search">
        <div class="rows" style="text-align: center">
            <form class="flight-form flight-search-form" action="indexServlet" method="post">
                <div class="flight-index-search flight-clear">
                    <!--标签-->
                    <div>
                        预订行程
                    </div>
                    <!--查询航班快速入口-->
                    <div class="flight-search-box" id="searchFlightBox">
                        <!--出发到达城市-->
                        <div class="flight-city-change" style="position: relative">
                            <!--出发城市-->
                            <div class="flight-form-item">
                                <div class="flight-input-inline">
                                    <label class="flight-form-label">出发城市：</label>
                                    <input type="text" class="flight-input p-city" name="flightStart"/>
                                </div>
                            </div>
                            <!--到达城市-->
                            <div class="flight-form-item">
                                <div class="flight-input-inline">
                                    <label class="flight-form-label">到达城市：</label>
                                    <input type="text" class="flight-input "  name="flightEnd"/>
                                </div>
                            </div>
                        </div>
                        <!--出发时间-->
                        <div class="flight-form-item">
                            <div class="flight-input-inline">
                                <label class="flight-form-label">出发日期：</label>
                                <input type="text" class="flight-input f-date o-date"  name="flightStartTime"/>

                            </div>
                        </div>
                        <!--到达时间-->
                        <div class="flight-form-item">
                            <div class="flight-input-inline disabled-date">
                                <label class="flight-form-label">返回日期：</label>
                                <input type="text" class="flight-input f-date o-date" name="flightEndTime" />

                            </div>
                        </div>

                        <!--搜索按钮-->
                        <div class="flight-form-item">
                            <div class="flight-search-submit flight-right">
                               <button type="submit" class="flight-btn">查询</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var content = document.getElementById("content1");
    var fakeContent = document.getElementById("fakeContent1");
    var wrapper = document.getElementById("wrapper1");

    function roll(t) {
        fakeContent.innerHTML = content.innerHTML;
        // 开始无滚动时设为0
        wrapper.scrollTop = 0;
        // 设置定时器，参数t用在这为间隔时间（单位毫秒），参数t越小，滚动速度越快
        var timer = setInterval(rollStart, t);

        // 鼠标移入div时暂停滚动
        wrapper.onmouseover = function() {
            clearInterval(timer);
            timer = null
        };

        // 鼠标移出div后继续滚动
        wrapper.onmouseout = function() {
            timer = setInterval(rollStart, t);
        }
    }
    // 开始滚动函数
    function rollStart() {
        // 正常滚动不断给scrollTop的值+1,当滚动高度大于列表内容高度时恢复为0
        if (wrapper.scrollLeft >= content.scrollWidth) {
            wrapper.scrollLeft = 0;
        } else {
            wrapper.scrollLeft++;
        }
    }

    window.onload = roll(50);
</script>

</body>

</html>