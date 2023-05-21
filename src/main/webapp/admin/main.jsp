<%@ page import="java.util.Map" %>
<%@ page import="com.admin.bean.temp" %><%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/23
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    HttpSession session1 =request.getSession();
    temp tmp= (temp) session1.getAttribute("temp");
    int all_order= tmp.all_order;
    int all_user= tmp.all_user;
    int all_person= tmp.all_person;
    int all_flight= tmp.all_flight;
    int new_order= tmp.new_order;
    Map<String,Integer> map= tmp.map;
    System.out.println(map.keySet());
    System.out.println(map.values());

%>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>民航订票管理后台</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <style>
        #index-table th{line-height: 2.5}
        #index-table td{line-height: 2.5}
        .js-chartjs-lines{height: 315px !important;}
    </style>
</head>

<body>
<div class="container-fluid p-t-15">
    <div class="row">
        <div class="col-sm-6 col-md-3">
            <div class="card bg-primary">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">订单总量</p>
                        <p class="h3 text-white m-b-0"><%=all_order%></p>
                    </div>
                    <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3">
            <div class="card bg-danger">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">用户总数</p>
                        <p class="h3 text-white m-b-0"><%=all_user%></p>
                    </div>
                    <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3">
            <div class="card bg-success">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">新增订单</p>
                        <p class="h3 text-white m-b-0"><%=new_order%></p>
                    </div>
                    <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-arrow-down-bold fa-1-5x"></i></span> </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3">
            <div class="card bg-purple">
                <div class="card-body clearfix">
                    <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-outline fa-1-5x"></i></span> </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>每周用户</h4>
                </div>
                <div class="card-body">
<%--                    <canvas class="js-chartjs-bars"></canvas>--%>
                    <table class="table table-hover " id="index-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>类别</th>
                                <th>总量</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">4</th>
                                <td>航班总量</td>
                                <td><%=all_flight%></td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>会员总量</td>
                                <td><%=all_person%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>不同日期订单量</h4>
                </div>
                <div class="card-body" style="height: 366px;">
                    <canvas class="js-chartjs-lines"></canvas>
                </div>
            </div>
        </div>

    </div>


</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>

<!--图表插件-->
<script type="text/javascript" src="/js/Chart.js"></script>
<script type="text/javascript">
    $(document).ready(function(e) {
        var $dashChartLinesCnt = jQuery( '.js-chartjs-lines' )[0].getContext( '2d' );

        new Chart($dashChartLinesCnt, {
            type: 'line',
            data:{
                labels:<%=map.keySet()%>,
                datasets: [
                    {
                        label: '各日期订单量',
                        data: <%=map.values()%>,
                        borderColor: '#358ed7',
                        backgroundColor: 'rgba(53, 142, 215, 0.175)',
                        borderWidth: 1,
                        fill: false,
                        // lineTension: 0.5
                    }
                ]
            },
            options:{
                    customXLabelRota: 90,//x轴的标注倾斜展示
                    customXLabelRotaMinNumber: 90,//x轴的标注倾斜展示
            }
        });
    });
</script>
</body>
</html>
