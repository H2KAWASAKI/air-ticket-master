<%@ page import="com.admin.bean.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/23
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%--<jsp:forward page="/admin/flightSearchServlet"></jsp:forward>--%>
<%
    HttpSession session1 =request.getSession();
    List<Order> orders =(List<Order>) (session1.getAttribute("orders"));
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
                <div class="card-toolbar clearfix">
                    <form class="pull-right search-bar" method="get" action="orderSearchServlet" role="form">
                        <div class="input-group" style="width: 235px;">
                            <%--                            <div class="input-group-btn">--%>
                            <%--                                <input type="text" name="search_field" id="search-field" value="title">--%>
                            <%--                                <button class="btn btn-default btn-w-md" id="search-btn" type="button" style="width: 76px;">查询</button>--%>
                            <%--                            </div>--%>
                            <input type="text" class="form-control" value="" name="orderDate" placeholder="请输入查询日期" style="width: 140px;">
                            <button class="btn btn-default btn-w-md" id="search-btn" type="submit" style="width: 76px;">查询</button>
                        </div>
                    </form>
                    <div class="toolbar-btn-action">
                        <a class="btn btn-success m-r-5" href="orderSearchServlet"><i class="mdi mdi-check"></i> 刷新</a>
                        <a class="btn btn-danger" href="#!" onclick="delSumCustomer()"><i class="mdi mdi-window-close"></i> 删除</a>
                    </div>
                </div>
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-bordered" id="t_student">
                            <thead>
                            <tr>
                                <th>
                                    <label class="lyear-checkbox checkbox-primary">
                                        <input type="checkbox" id="check-all"><span></span>
                                    </label>
                                </th>
                                <th>订单id</th>
                                <th>订单名称</th>
                                <th>下单用户</th>
                                <th>订单日期</th>
                                <th>航班Id</th>
                                <th>乘客姓名</th>
                                <th>乘客身份证号</th>
                                <th>仓别</th>
                                <th>订单金额</th>
                                <th>实付金额</th>
                                <th>联系人</th>
                                <th>联系电话</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="s" items="<%=orders%>">
                                <tr>
                                    <td>
                                        <label class="lyear-checkbox checkbox-primary">
                                            <input type="checkbox" name="ids[]" value="${s.orderId}"><span></span>
                                        </label>
                                    </td>
                                    <td>${s.orderId}</td>
                                    <td>${s.orderName}</td>
                                    <td>${s.orderUser}</td>
                                    <td>${s.orderDate}</td>
                                    <td>${s.flightNumber}</td>
                                    <td>${s.personName}</td>
                                    <td>${s.personId}</td>
                                    <td>${s.grade}</td>
                                    <td>${s.orderMoney1}</td>
                                    <td>${s.oederMoney2}</td>
                                    <td>${s.contcatName}</td>
                                    <td>${s.contactPhone}</td>
                                    <td>
                                        <a class="btn btn-xs btn-default" href="orderRemoveServlet?orderId='${s.orderId}'" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <ul class="pager">
                        <li id="spanFirst"><span>首页</span></li>
                        <li id="spanPre"><span>上一页</span></li>
                        <li id="spanInput">
                            第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"
                                    style="height:20px; text-align: center;width:50px" />页
                        </li>
                        <li id="spanNext"><span>下一页</span></li>
                        <li id="spanLast"><span>尾页</span></li>

                    </ul>
                    <span style="display: none">
                        共有 <span id="spanTotalInfor"></span> 条记录
                        当前第<span id="spanPageNum"></span>页
                        共<span id="spanTotalPage"></span>页
                    </span>


                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script src="/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.search-bar .dropdown-menu a').click(function() {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
    });
</script>
<script>
    function delSumCustomer() {
        if (!confirm("确定要删除这些订单吗？")) {
            return;
        }
        var ck = document.getElementsByName("ids[]");
        var str = "";
        //拼接所有的客户id
        for (var i = 0; i < ck.length; i++) {
            if (ck[i].checked) {
                str += "'"+ck[i].value + "',";
            }
        }
        //去掉字符串末尾的‘&'
        str = str.substring(0, str.length - 1);
        console.log(str);
        location.href = "orderRemoveServlet?orderId="+str;
    }
</script>

<script type="text/javascript">
    var theTable =document.getElementById("t_student");
    var txtValue =document.getElementById("Text1").value;
    function changepage() {
        var txtValue2 = document.getElementById("Text1").value;
        if (txtValue != txtValue2) {
            if (txtValue2 > pageCount()) {
            }
            else if (txtValue2 <= 0) {
            }
            else if (txtValue2 == 1) {
                first();
            }
            else if (txtValue2 == pageCount()) {
                last();
            }
            else {
                hideTable();
                page = txtValue2;
                pageNum2.value = page;

                currentRow = pageSize * page;
                maxRow = currentRow - pageSize;
                if (currentRow > numberRowsInTable)
                    currentRow = numberRowsInTable;
                for (var i = maxRow; i < currentRow; i++) {
                    theTable.rows[i].style.display = '';
                }
                if (maxRow == 0) {
                    preText(); firstText();
                }
                showPage();
                nextLink();
                lastLink();
                preLink();
                firstLink();
            }
            txtValue = txtValue2;
        }
    }
</script>
<script type="text/javascript">
    //获取对应控件
    var totalPage = document.getElementById("spanTotalPage");//总页数
    var pageNum = document.getElementById("spanPageNum");//当前页
    var totalInfor = document.getElementById("spanTotalInfor");//记录总数
    var pageNum2 = document.getElementById("Text1");//当前页文本框

    var spanPre = document.getElementById("spanPre");//上一页
    var spanNext = document.getElementById("spanNext");//下一页
    var spanFirst = document.getElementById("spanFirst");//首页
    var spanLast = document.getElementById("spanLast");//尾页
    var pageSize = 8;//每页信息条数

    var numberRowsInTable = theTable.rows.length - 1;//表格最大行数

    var page = 1;

    //下一页
    function next() {
        if (pageCount() <= 1) {
        }
        else {
            hideTable();
            currentRow = pageSize * page + 1; //下一页的第一行
            maxRow = currentRow + pageSize;    //下一页的一行
            if (maxRow > numberRowsInTable) maxRow = numberRowsInTable + 1;//如果计算中下一页最后一行大于实际最后一行行号
            for (var i = currentRow; i < maxRow; i++) {
                theTable.rows[i].style.display = '';
            }
            page++;
            pageNum2.value = page;
            if (maxRow == numberRowsInTable) { //如果下一页的最后一行是表格的最后一行
                nextNoLink(); //下一页 和尾页 不点击
                lastNoLink();
            }
            showPage();//更新page显示
            if (page == pageCount()) {//如果当前页是尾页
                nextNoLink();
                lastNoLink();
            }

            preLink();
            firstLink();
        }
    }

    //上一页
    function pre() {
        if (pageCount() <= 1) {
        }
        else {
            hideTable();
            page--;
            pageNum2.value = page;
            currentRow = pageSize * page + 1;//下一页的第一行
            maxRow = currentRow - pageSize;//本页的第一行
            if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;//如果计算中本页的第一行小于实际首页的第一行行号，则更正
            for (var i = maxRow; i < currentRow; i++) {
                theTable.rows[i].style.display = '';
            }
            if (maxRow == 0) { preNoLink(); firstNoLink(); }
            showPage();//更新page显示
            if (page == 1) {
                firstNoLink();
                preNoLink();
            }
            nextLink();
            lastLink();
        }
    }
    //第一页
    function first() {

        if (pageCount() <= 1) {
        }
        else {
            hideTable();//隐藏所有行
            page = 1;
            pageNum2.value = page;
            for (var i = 1; i < pageSize + 1; i++) {//显示第一页的信息
                theTable.rows[i].style.display = '';
            }
            showPage();//设置当前页

            firstNoLink();
            preNoLink();
            nextLink();
            lastLink();
        }
    }
    //最后一页
    function last() {
        if (pageCount() <= 1) {
        }
        else {
            hideTable();//隐藏所有行
            page = pageCount();//将当前页设置为最大页数
            pageNum2.value = page;
            currentRow = pageSize * (page - 1) + 1;//获取最后一页的第一行行号
            for (var i = currentRow; i < numberRowsInTable + 1; i++) {//显示表格中最后一页信息
                theTable.rows[i].style.display = '';
            }

            showPage();
            lastNoLink();
            nextNoLink();
            preLink();
            firstLink();
        }
    }
    function hideTable() {//隐藏表格内容
        for (var i = 0; i < numberRowsInTable + 1; i++) {
            theTable.rows[i].style.display = 'none';
        }
        theTable.rows[0].style.display = '';//标题栏显示
    }
    function showPage() {//设置当前页数
        pageNum.innerHTML = page;
    }
    function inforCount() {//设置总记录数
        spanTotalInfor.innerHTML = numberRowsInTable;
    }
    //总共页数
    function pageCount() {
        var count = 0;
        if (numberRowsInTable % pageSize != 0) count = 1;
        return parseInt(numberRowsInTable / pageSize) + count;
    }
    //显示链接 link方法将相应的文字变成可点击翻页的  nolink方法将对应的文字变成不可点击的
    function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
    function preNoLink() { spanPre.innerHTML = "上一页"; }

    function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
    function nextNoLink() { spanNext.innerHTML = "下一页"; }

    function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>首页</a>"; }
    function firstNoLink() { spanFirst.innerHTML = "首页"; }

    function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>尾页</a>"; }
    function lastNoLink() { spanLast.innerHTML = "尾页"; }
    //初始化表格
    function hide() {
        for (var i = pageSize + 1; i < numberRowsInTable + 1; i++) {
            theTable.rows[i].style.display = 'none';
        }
        theTable.rows[0].style.display = '';

        inforCount();

        totalPage.innerHTML = pageCount();
        showPage();
        pageNum2.value = page;

        if (pageCount() > 1) {
            nextLink();
            lastLink();
        }

    }
    hide();
</script>

</body>
</html>