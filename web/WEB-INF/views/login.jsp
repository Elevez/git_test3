<%--
  Created by IntelliJ IDEA.
  User: ZJ
  Date: 2021/7/6
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    pageContext.setAttribute("App_Path",request.getContextPath());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/sticky-footer-navbar/">

    <title>login</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>管理员登录界面</h1>
    </div>
    <form class="form-horizontal">

        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputName" name="adName" placeholder="Email">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPwd" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPwd" name="adPassword" placeholder="password">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <button type="button" id="ad-submit-btn" class="btn btn-primary btn-lg btn-block">提交</button>
        </div>
    </form>

</div> <!-- /container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/js/ie10-viewport-bug-workaround.js"></script>

<script type="text/javascript">

    $("#ad-submit-btn").click(function () {
        //异步请求，保存员工信息
        $.ajax({
            url:"${App_Path}/login",
            data:$("form").serialize(),
            type:"post",
            dataType:"json",
            success:function (result) {
                if (result.code == 100){
                    alert(result.msg);
                    //跳转到员工信息列表页面
                    window.location.href="${App_Path}/home";
                }else {
                        show_validation_msg("#inputName","error","用户名或密码错误！");
                        show_validation_msg("#inputPwd","error","用户名或密码错误！");
                }
            }
        });
    });

    function show_validation_msg(element,status,msg){
        var ctrl = $(element).parents("div.form-group");
        ctrl.removeClass("has-success has-error");
        if ("success" == status){
            ctrl.addClass("has-success");
        }else {
            ctrl.addClass("has-error");
        }
        ctrl.find("span.help-block").text(msg);
    }

    $("#inputPwd").blur(function () {
        var $regEmail = /^[a-zA-Z0-9]{3,16}$/;
        var ctrl = $("#inputPwd").parents("div.form-group");
        ctrl.removeClass("has-success has-error");
        if($("#inputPwd").val() == "") {
            ctrl.addClass("has-error");
            ctrl.find("span.help-block").text("密码不可为空！");
        }else if($regEmail.test($("#inputPwd").val()) == false) {
            ctrl.addClass("has-error");
            ctrl.find("span.help-block").text("密码需为6-16位字母或数字！");
        }else {
                ctrl.addClass("has-success");
                ctrl.find("span.help-block").text("密码格式正确！");
        }
    });

    $("#inputName").blur(function () {
        var $regEmail = /^\w+@\w+\.[a-zA-Z]{2,3}(\.[a-zA-Z]{2,3})?$/;
        var ctrl = $("#inputName").parents("div.form-group");
        ctrl.removeClass("has-success has-error");
        if($("#inputName").val() == "") {
            ctrl.addClass("has-error");
            ctrl.find("span.help-block").text("用户名不可为空！");
        }else if($regEmail.test($("#inputName").val()) == false) {
            ctrl.addClass("has-error");
            ctrl.find("span.help-block").text("用户名需满足邮箱格式：xxx@xxx.xxx!");
        }else {
            ctrl.addClass("has-success");
            ctrl.find("span.help-block").text("用户名符合要求！");
        }
    });
</script>
</body>
</html>
