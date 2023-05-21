<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/26
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    String flightId=request.getParameter("flightId");
    String flightNumber=request.getParameter("flightNumber");
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
                <%--                <div class="card-toolbar clearfix">--%>
                <%--                    <div class="card-header">--%>
                <%--                         添加航班--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <div class="card-body">
                    <form action="updateFlightServlet"  method="post">
                        <div class="content-inner">
                            <div class="card-header bg-primary">
                                航班修改
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <tr >
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                航班ID</label>
                                            <div class="col-md-7">
                                                <input name="flightId" class="form-control" readonly="readonly" value="<%=flightId%>">
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                航班号</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" readonly="readonly" name="flightNumber" value="<%=flightNumber%>">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="line">
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                起点</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：北京" name="flightStart" >
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                终点</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：上海" name="flightEnd">
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                始发机场</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：北京机场" name="flightStartAir">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                到达机场</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：成都机场"name="flightEndAir" >
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                起飞时间</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：2020-04-01 19:00:00" name="flightStartTime" >
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                到达时间</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：2020-04-01 19:00:00" name="flightEndTime">
                                            </div>
                                        </td>

                                    </tr>
                                    <tr >
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                头等舱价格</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="2100" name="flightHighPrice" >
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                头等舱座位数</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：200" name="flightHighNumber">
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                商务舱价格</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：1500" name="flightMidPrice" >
                                            </div>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                头等舱座位数</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：200" name="flightMidNumber" >
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                经济舱价格</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：800" name="flightLowPrice" >
                                            </div>
                                        </td>
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                经济舱座位数</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：200" name="flightLowNumber">
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
                        <button class="btn btn-primary" type="submit" >保存</button>
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
    $(function(){
        $('.search-bar .dropdown-menu a').click(function() {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
    });
</script>

</body>
</html>