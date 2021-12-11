<%--
  Created by IntelliJ IDEA.
  User: ZJ
  Date: 2021/7/2
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    pageContext.setAttribute("App_Path",request.getContextPath());
%>

<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/sticky-footer-navbar/">

    <title>input</title>

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

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${App_Path}/home">人力资源管理系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${App_Path}/home">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">员工管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${App_Path}/list">查看员工信息</a></li>
                        <li><a href="${App_Path}/input">新增员工信息</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <input class="btn btn6 btn-block text-right" onclick="history.go(-1)" value="返回列表" type="button">
        <h1>修改员工信息</h1>
    </div>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputName" disabled name="empName" placeholder="姓名">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail" name="empEmail" placeholder="Email">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <label class="radio-inline">
                    <input type="radio" name="empGender" id="inlineRadio1" value="1"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="empGender" id="inlineRadio2" value="0"> 女
                </label>
                <span id="gender"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputDept" class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <select id="inputDept" name="deptId" class="form-control">
                </select>
            </div>
            <span id="dept"></span>
        </div>
        <div class="form-group">
            <button type="button" id="emp-save-btn" pn="${pn}" edit-id="${id}" class="btn btn-primary btn-lg btn-block">修改</button>
        </div>
    </form>
</div>


<footer class="footer">
    <div class="container">
        <p class="text-muted">©2021 杭州职业技术学院 软件技术专业</p>
    </div>
</footer>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.10/assets/js/ie10-viewport-bug-workaround.js"></script>

<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"${App_Path}/depts",
            type:"get",
            dataType:"json",
            beforeSend:function () {
                $("#inputDept").empty();
                $("#inputDept").attr("title","正在加载部门信息...");
            },
            success:function (result) {
                if (result.code == 100){
                    $("#inputDept").empty();
                    $("#inputDept").attr("title","请选择部门");
                    $.each(result.extend.departments,function (index,dept) {
                        $("<option></option>").attr("value",dept.id).append(dept.deptName).appendTo($("#inputDept"));
                    });
                    getEmp();
                }
            }
        });
    });

    function getEmp() {
        $.ajax({
            url:"${App_Path}/emp/"+$("#emp-save-btn").attr("edit-id"),
            type:"get",
            dataType:"json",
            success:function (result) {
                if (result.code == 100){
                    var empData = result.extend.emp;
                    $("#inputName").val(empData.empName);
                    $("#inputEmail").val(empData.empEmail);

                    $("form input[name='empGender']").val([
                        empData.empGender?'1':'0'
                    ]);

                    $("#inputDept").val(empData.deptId);
                }
            }
        });
    }

    $("#emp-save-btn").click(function () {
        //异步请求，保存员工信息
        var pn = $(this).attr("pn");
        $.ajax({
            url:"${App_Path}/emp/"+$(this).attr("edit-id"),
            data:$("form").serialize(),
            type:"put",
            dataType:"json",
            success:function (result) {
                if (result.code == 100){
                    alert(result.msg);
                    //跳转到员工信息列表页面
                    window.location.href="${App_Path}/list?pn="+pn;
                }else {
                    if (result.extend.fieldErrors.empEmail != undefined){
                        show_validation_msg("#inputEmail","error",result.extend.fieldErrors.empEmail);
                    }
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

    $("#inputEmail").blur(function () {
        var $regEmail = /^\w+@\w+\.[a-zA-Z]{2,3}(\.[a-zA-Z]{2,3})?$/;
        var ctrl = $("#inputEmail").parents("div.form-group");
        ctrl.removeClass("has-success has-error");
        if($("#inputEmail").val() == "") {
            ctrl.addClass("has-error");
            ctrl.find("span.help-block").text("邮箱不可为空！");
        }else if($regEmail.test($("#inputEmail").val()) == false) {
            ctrl.addClass("has-error");
            ctrl.find("span.help-block").text("email格式不符合xxx@xxx.xxx!");
        }else {
            ctrl.addClass("has-success");
            ctrl.find("span.help-block").text("email格式符合使用");
        }
    });



</script>

</body>
</html>