<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/28
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>民航订票管理后台</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <style>
        body{
            background-color: #fff;
        }
        .error-page {
            height: 100%;
            /*position: fixed;*/
            width: 100%;
        }
        .error-body {
            padding-top: 5%;
        }
        .error-body h1 {
            font-size: 210px;
            font-weight: 700;
            text-shadow: 4px 4px 0 #f5f6fa, 6px 6px 0 #33cabb;
            line-height: 210px;
            color: #33cabb;
            text-align: center;
            margin: 0;
        }
        .error-body h4 {
            margin: 30px 0px;
            text-align: center;
        }
    </style>
</head>

<body>
<div class="container-fluid p-t-15">
    <section class="error-page">
        <div class="error-box">
            <div class="error-body text-center">
                <h1>404</h1>
                <h4>很抱歉，但是那个页面看起来已经不存在了，或者您没有权限访问!</h4>
                <a href="main.jsp" class="btn btn-primary ">返回首页</a>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript">;</script>
</body>
</html>