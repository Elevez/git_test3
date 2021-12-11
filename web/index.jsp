<%--
  Created by IntelliJ IDEA.
  User: ZJ
  Date: 2021/7/1
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <title>HRSystem</title>

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
      <a class="navbar-brand" href="${App_Path}">人力资源管理系统</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${App_Path}">首页</a></li>
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
    <h1>请前往登录页面</h1>
  </div>
  <p>
    <a href="${App_Path}/toLogin">
      <button type="button" class="btn btn-primary btn-lg btn-block">
        前往管理员登录界面
        <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
      </button>
    </a>
  </p>
<%--  <p>--%>
<%--    <a href="${App_Path}/list">--%>
<%--      <button type="button" class="btn btn-primary btn-lg btn-block">--%>
<%--        <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>--%>
<%--        查看员工信息--%>
<%--      </button>--%>
<%--    </a>--%>
<%--  </p>--%>
<%--  <p>--%>
<%--    <a href="${App_Path}/input">--%>
<%--      <button type="button" class="btn btn-primary btn-lg btn-block">--%>
<%--        <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>--%>
<%--        新增员工信息--%>
<%--      </button>--%>
<%--    </a>--%>
<%--  </p>--%>
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
</body>
</html>

