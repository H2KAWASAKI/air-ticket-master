<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/29
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="/css/css.css" rel="stylesheet" type="text/css">
    <title>民航订票</title>
</head>
<body class="logobg_style">
<div id="large-header" class="large-header login-page">
    <canvas id="demo-canvas" width="1590" height="711"></canvas>
    <div class="login-form">
        <div class="login-content">
            <h1 class="title_name">账户登录</h1>
            <form method="post" role="form" id="form_login" class="login_padding" action="indexLoginServlet">
                <input type="text" value="<%=request.getParameter("urls")%>" name="urls" style="display: none">
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_user"></i>
                        </div>
                        <input type="text" class="form-control" name="username" id="username" placeholder="用户名"
                               autocomplete="off">
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_password"></i>
                        </div>
                        <input type="password" class="form-control" name="password" id="password" placeholder="密码"
                               autocomplete="off">
                    </div>
                </div>
                <div class="tishi"></div>
                <div class="form-group">
                    <button type="submit" class="btn btn-danger btn-block btn-login"><i class="fa fa-sign-in"></i> 登录</button>
                </div>
                <div class="textright">
                    <a href="register.jsp" class="forget">立即注册</a>
                </div>

                <div class="form-group"></div>
            </form>
        </div>

    </div>
</div>

</body>

</html>