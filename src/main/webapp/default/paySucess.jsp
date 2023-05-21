<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/30
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">

    <title>民航订票</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/corptravel.css" rel="stylesheet">



</head>

<body>
<!-- header -->
<div class="container mar-top-10 mar-bottom-10">
    <div class="row ">
        <div class="col-md-5"> <img src="/images/logo1.png" width="210" height="70" alt="系统LOGO"
                                    class="pull-left mar-right-30">
            <h3 class="gray-666">民航订票</h3>
        </div>
    </div>
</div>
<!-- header end -->

<div class="container bg-white box-shadow pad-15 mar-bottom-30" style=" position:relative;">
    <!-- 支付提示 -->
    <div class="tishibox">
        <p class="title">支付已成功!</p>
        <p>您可以继续操作：<a href="userOrder.jsp">[查看我的订单]</a> <a href="/index.jsp">[返回首页]</a> </p>
        <div class="img_fudong"> <a href="#"><img src="/images/chenggong2.gif" width="50" height="50" border="0" /></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <!-- 支付提示 结束 -->

    <div class="clearfix"></div>
    <div class="text-center mar-bottom-10">
        <input type="button" value="返回" class="btn btn-default " onclick="javascript: history.go(-1);">
    </div>

</div>


</body>

</html>