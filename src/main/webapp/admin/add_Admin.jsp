<%@ page import="com.admin.bean.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/28
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 =request.getSession();
    Admin admin =(Admin)(session1.getAttribute("admin"));
    if(!admin.getUsername().equals("admin"))
    {
        response.sendRedirect("errors.jsp");
    }
%>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>民航订票管理后台</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid p-t-15">

    <div class="row">
        <div class="col-lg-12">
            <div class="card">

                <div class="card-body">
                    <form action="adminAddServlet" method="post" >
                        <div class="content-inner">
                            <div class="card-header bg-primary">
                                管理员信息
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <tr>
                                        <td>
                                            <label class="col-md-3 control-label"
                                                   style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                    用户名</label>
                                            <div class="col-md-7">
                                                <input class="form-control" placeholder="例：admin" name="username">
                                            </div>
                                        </td>
                                        <td>
                                            <label class="col-md-3 control-label"
                                                   style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                密码</label>
                                            <div class="col-md-7">
                                                <input class="form-control" placeholder="例：123456" name="password">
                                            </div>
                                        </td>
                                    </tr>

                                    <!--用于填充-->
                                    <tr class="line line2">
                                        <td colspan="3"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!--保存按钮-->
                        <button class="btn btn-primary" type="submit">保存</button>
                    </form>
                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('.search-bar .dropdown-menu a').click(function () {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
    });
</script>