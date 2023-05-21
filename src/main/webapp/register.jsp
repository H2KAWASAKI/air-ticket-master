<%--
  Created by IntelliJ IDEA.
  User: 高晓如
  Date: 2021/12/29
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="/css/css.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <title>民航订票</title>
</head>

<body class="logobg_style">
<div id="large-header" class="large-header login-page">
    <canvas id="demo-canvas" width="1590" height="711"></canvas>
    <div class="Retrieve_style">
        <div class="Retrieve-content step-body" id="myStep">
            <h1 class="title_name">用户注册</h1>
            <div class="step-header">
                <ul>
                    <li>
                        <p>输入账号密码</p>
                    </li>
                    <li>
                        <p>确认密码</p>
                    </li>
                    <li>
                        <p>成功</p>
                    </li>
                </ul>
            </div>
            <div class="step-content">
                <div class="step-list login_padding">
                    <form role="form" id="form_login" class="">
                        <div class="form-group clearfix">
                            <div class="input-group ">
                                <div class="input-group-addon">
                                    <i class="icon_user"></i>
                                </div>
                                <input type="text" class="form-control" name="userName" id="username"
                                       placeholder="你的账号" autocomplete="off">
                            </div>
                        </div>
                        <div class="form-group clearfix">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="icon_password"></i>
                                </div>
                                <input type="password" class="form-control" name="Verification" id="Verification"
                                       placeholder="你的密码" autocomplete="off">
                            </div>
                        </div>
                        <div class="tishi"></div>
                    </form>
                    <div class="form-group">
                        <button class="btn btn-danger btn-block btn-login" id="applyBtn">下一步</button>
                    </div>

                </div>
                <div class="step-list">
                    <form method="post" role="form" id="" class="login_padding">
                        <div class="form-group clearfix">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="icon_password"></i>
                                </div>
                                <input type="password" class="form-control" name="confirmpwd" id="confirmpwd"
                                       placeholder="再次密码" autocomplete="off">
                            </div>
                        </div>
                        <div class="tishis"></div>

                        <div class="form-group">
                            <a href="javascript:void(0);" type="submit" class="btn btn-danger btn-block btn-login"
                               id="submitBtn">下一步</a>
                        </div>
                    </form>

                </div>
                <div class="step-list">
                    <div class="ok_style center">
                        <h2>
                            <img src="images/ok.png">
                        </h2>
                        <h5 class="color2 mtb20">
                            你已成功注册账号<b id="sec">5</b>秒后跳转到登录
                        </h5>
                        <a href="index.jsp" class="btn btn-danger">首页</a> <a href="register.jsp"
                                                                          class="btn btn-primary">重新注册</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var password = "";
        var username = "";
        var step = $("#myStep").step({
            animate: true,
            initStep: 1,
            speed: 1000
        });
        console.log(username);
        console.log(password);
        $("#preBtn").click(function (event) {
            var yes = step.preStep();
            console.log(username);
            console.log(password);
        });
        $("#applyBtn").click(function (event) {

            password = $.trim($("#Verification").val());
            username = $.trim($("#username").val());
            if ($.trim(username) == "") {
                Tip('请填写账号！');
                $("#username").focus();
                return;
            }
            if ($.trim(password) == "") {
                Tip('密码未填写！');
                $("#Verification").focus();
                return;
            }
            var yes = step.nextStep();
            return;
        });
        $("#submitBtn").click(function (event) {
            console.log(username);
            console.log(password);
            var txtconfirm = $.trim($("#confirmpwd").val());
            console.log("t" + txtconfirm)
            if ($.trim(txtconfirm) != $.trim(password)) {

                Tips('你输入的密码不匹配，请从新输入！');
                $("#txtconfirm").focus();
                return;
            }
            console.log(username);
            console.log(password);
            var yes = step.nextStep();
            $.ajax({
            	url: "indexRegisterServlet",
            	type: "post",
            	data: {
            		"username": username,
            		"password": password,
            	},
            	success: function () {
                    // alert("成功")
            	}
            });
            setInterval(function () {
                var sec = $("#sec").text();
                $("#sec").text(--sec);
                if (sec == 0)
                    window.location.href = "login.jsp";
            }, 1000);

        });
        $("#goBtn").click(function (event) {
            var yes = step.goStep(3);
        });
    });

    (function (factory) {
            "use strict";
            if (typeof define === 'function') {
                // using CMD; register as anon module
                define.cmd && define('jquery-step', ['jquery'], function (require, exports, moudles) {
                    var $ = require("jquery");
                    factory($);
                    return $;
                });
                define.amd && define(['jquery'], factory);
            } else {
                // no CMD; invoke directly
                factory((typeof (jQuery) != 'undefined') ? jQuery : window.Zepto);
            }
        }
        (function ($) {
            $.fn.step = function (options) {
                var opts = $.extend({}, $.fn.step.defaults, options);
                var size = this.find(".step-header li").length;
                var barWidth = opts.initStep < size ? 100 / (2 * size) + 100 * (opts.initStep - 1) / size : 100;
                var curPage = opts.initStep;

                this.find(".step-header").prepend("<div class=\"step-bar\"><div class=\"step-bar-active\"></div></div>");
                this.find(".step-list").eq(opts.initStep - 1).show();
                if (size < opts.initStep) {
                    opts.initStep = size;
                }
                if (opts.animate == false) {
                    opts.speed = 0;
                }
                this.find(".step-header li").each(function (i, li) {
                    if (i < opts.initStep) {
                        $(li).addClass("step-active");
                    }
                    //$(li).prepend("<span>"+(i+1)+"</span>");
                    $(li).append("<span>" + (i + 1) + "</span>");
                });
                this.find(".step-header li").css({
                    "width": 100 / size + "%"
                });
                this.find(".step-header").show();
                this.find(".step-bar-active").animate({
                        "width": barWidth + "%"
                    },
                    opts.speed, function () {

                    });

                this.nextStep = function () {
                    if (curPage >= size) {
                        return false;
                    }
                    return this.goStep(curPage + 1);
                }

                this.preStep = function () {
                    if (curPage <= 1) {
                        return false;
                    }
                    return this.goStep(curPage - 1);
                }

                this.goStep = function (page) {
                    if (page == undefined || isNaN(page) || page < 0) {
                        if (window.console && window.console.error) {
                            console.error('the method goStep has a error,page:' + page);
                        }
                        return false;
                    }
                    curPage = page;
                    this.find(".step-list").hide();
                    this.find(".step-list").eq(curPage - 1).show();
                    this.find(".step-header li").each(function (i, li) {
                        $li = $(li);
                        $li.removeClass('step-active');
                        if (i < page) {
                            $li.addClass('step-active');
                            if (opts.scrollTop) {
                                $('html,body').animate({ scrollTop: 0 }, 'slow');
                            }
                        }
                    });
                    barWidth = page < size ? 100 / (2 * size) + 100 * (page - 1) / size : 100;
                    this.find(".step-bar-active").animate({
                            "width": barWidth + "%"
                        },
                        opts.speed, function () {

                        });
                    return true;
                }
                return this;
            };

            $.fn.step.defaults = {
                animate: true,
                speed: 500,
                initStep: 1,
                scrollTop: true
            };
        })
    );
</script>
</body>

</html>