<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/26
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Long startTs = System.currentTimeMillis();
    String radioId="R"+startTs;
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
                    <form action="radioAddServlet"  method="post">
                        <div class="content-inner">
                            <div class="card-header bg-primary">
                                基本信息
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <tr >
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                    广播ID
                                                </label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="<%=radioId%>" value="<%=radioId%>" readonly="readonly" name="radioId">
                                            </div>
                                        </td>
                                        <td colspan="2" >
                                            <label class="col-md-3 control-label" style="width: 12.3%; font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                广播内容</label>
                                            <div class="col-md-7" style="width: 79.3%;">
                                                <input  class="form-control" placeholder="例：" name="radioDescribe" >
                                            </div>
                                        </td>

                                    </tr>

                                    <tr >
                                        <td >
                                            <label class="col-md-3 control-label" style="font-size: 14px;line-height: 38px;margin-bottom: -5px;">
                                                航班号</label>
                                            <div class="col-md-7">
                                                <input  class="form-control" placeholder="例：C919"  name="flightNumber">
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