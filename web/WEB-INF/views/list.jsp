<%--
  Created by IntelliJ IDEA.
  User: ZJ
  Date: 2021/7/1
  Time: 16:05
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

    <title>list</title>

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
        <h1>查看员工信息</h1>
    </div>
    <div>
        <input type="hidden" id="pn" value="${pn}">
        <!-- Default panel contents -->
        <div style="display: block;float: right">
            <button type="button" class="btn btn-default">
                <a href="${App_Path}/excel"><span class="glyphicon glyphicon glyphicon-save" aria-hidden="true"></span>下载所有员工信息</a>
            </button>
            <button type="button" class="btn btn-primary" id="addEmployee">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>增加
            </button>
            <button type="button" class="btn btn-danger" id="delAllByEmpId">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>批量删除
            </button>
        </div>
        <!-- Table -->
        <table class="table table-striped" id="emps-table">
            <thead>
            <td><input type="checkbox" id="check-all"></td>
            <td>ID</td>
            <td>姓名</td>
            <td>性别</td>
            <td>Email</td>
            <td>部门</td>
            <td colspan="2">操作</td>
            </thead>
            <tbody id="tbody"></tbody>
            <tfoot id="tfoot"></tfoot>
        </table>
    </div>
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
<%--<script src="${App_Path}/static/bootstrap-3.4.1-dist/js/bootstrap.js"></script>--%>
<script type="text/javascript">
    var curPage = $("#pn").val();

    $(function () {

        to_page(curPage);
    });

    function to_page(pn){
        $.ajax({
            url:"${App_Path}/emps",
            data:{"pn":pn},
            type:"get",
            dataType:"json",
            beforeSend:function () {
                $("#emps-table tbody").empty();
                $("#emps-table tfoot").empty();
                $("<tr></tr>").append($("<td></td>")).attr("colspan",7).append("正在加载员工信息，请稍等...")
                    .appendTo("#emps-table tbody")

            },
            success:function (result) {
                if (result.code == 100){
                    if(result.extend.pageInfo.total>0){
                        //列表显示员工数据
                        build_emps_table(result.extend.pageInfo);
                        //显示分页信息
                        build_page_nav(result.extend.pageInfo);
                        curPage=result.extend.pageInfo.pageNum;
                        $("#pn").val(curPage);
                    }
                    else{
                        $("#emps-table tbody").empty();
                        $("#emps-table tfoot").empty();
                        $("<tr></tr>").append($("<td></td>")).attr("colspan",7).append("没有任何员工信息!")
                            .appendTo("#emps-table tbody")
                    }
                }else{
                    $("#emps-table tbody").empty();
                    $("#emps-table tfoot").empty();
                    $("<tr></tr>").append($("<td></td>")).attr("colspan",7).append("系统异常，请稍候重试!")
                        .appendTo("#emps-table tbody")
                }

            },
            error:function () {
                $("#emps-table tbody").empty();
                $("#emps-table tfoot").empty();
                $("<tr></tr>").append($("<td></td>")).attr("colspan",7).append("加载信息错误，请稍等...")
                    .appendTo("#emps-table tbody")
            }
        });
    }

    function build_emps_table(pageInfo) {
        $("#emps-table tbody").empty()
        var emps = pageInfo.list;
        $.each(emps,function (index,emp) {
            var chkTd=$("<td></td>").append($("<input>").addClass("check-item").attr({"type":"checkbox","value":emp.id}));
            var empIdTd=$("<td></td>").append(index+1+(pageInfo.pageNum-1)*pageInfo.pageSize);
            var empNameTd=$("<td></td>").append(emp.empName);
            var empGenderTd=$("<td></td>").append(emp.empGender?"男":"女");
            var empEmailTd=$("<td></td>").append(emp.empEmail);
            var deptNameTd=$("<td></td>").append(emp.department.deptName);
            var editBtn=$("<button></button>").addClass("btn btn-warning btn-xs edit-btn").append($("<span></span>").addClass("glyphicon glyphicon-wrench")).append("修改");
            editBtn.attr({"edit-id":emp.id,"pn":pageInfo.pageNum});
            var deletBtn=$("<button></button>").addClass("btn btn-danger btn-xs delete-btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            deletBtn.attr({"delete-id":emp.id,"pn":pageInfo.pageNum});
            var operationTd=$("<td></td>").append(editBtn).append(" ").append(deletBtn);
            $("<tr></tr>").append(chkTd).append(empIdTd).append(empNameTd).append(empGenderTd).append(empEmailTd).append(deptNameTd).append(operationTd).appendTo("#emps-table tbody");
        });
    }

    function build_page_nav(pageInfo) {
        $("#emps-table tfoot").empty();
        var pageInfoTd=$("<td></td>").addClass("text-left").attr("colspan","7")
            .append("当前第"+pageInfo.pageNum+"页，总"+pageInfo.pages+"页，总"+pageInfo.total+"条记录");

        var pageUl=$("<ul></ul>").addClass("pagination");

        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页"));
        if(pageInfo.isFirstPage){
            firstPageLi.addClass("disabled");
        }else{
            firstPageLi.click(function () {
                to_page(1);
            });
        }
        pageUl.append(firstPageLi);

        var previousPageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!pageInfo.hasPreviousPage){
            previousPageLi.addClass("disabled");
        }else{
            previousPageLi.click(function () {
                to_page(pageInfo.pageNum-1);
            });
        }
        pageUl.append(previousPageLi);
        $.each(pageInfo.navigatepageNums,function (index,navigatepageNum) {
            var navPageLi=$("<li></li>").append($("<a></a>").append(navigatepageNum));
            if (pageInfo.pageNum==navigatepageNum){
                navPageLi.addClass("active");
            }else {
                navPageLi.click(function () {
                    to_page(navigatepageNum);
                });
            }
            pageUl.append(navPageLi);
        });

        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        if (!pageInfo.hasNextPage){
            nextPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(pageInfo.pageNum+1);
            });
        }
        pageUl.append(nextPageLi);

        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页"));
        if (pageInfo.isLastPage){
            lastPageLi.addClass("disabled");
        }else{
            lastPageLi.click(function () {
                to_page(pageInfo.pages);
            });
        }
        pageUl.append(lastPageLi);
        var pageNavTd=$("<td></td>").addClass("text-center").attr("colspan","7").append(pageUl);

        // var pageInfoTr=$("<tr></tr>").append(pageInfoTd);
        // var pageNavTr=$("<tr></tr>").append(pageNavTd);
        // $("<tr></tr>").append(pageInfoTr).append(pageNavTr).appendTo("#emps-table tfoot");
        $("<tr></tr>").append(pageInfoTd).appendTo("#emps-table tfoot");
        $("<tr></tr>").append(pageNavTd).appendTo("#emps-table tfoot");
    }

    $(document).on("click",".delete-btn",function () {
        // alert("ok");
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确定删除["+empName+"]的信息吗！")){
            $.ajax({
                url:"${App_Path}/emp/"+$(this).attr("delete-id"),
                type:"delete",
                dataType:"json",
                success:function (result) {
                    if (result.code == 100){
                        to_page(curPage);
                    }
                    alert(result.msg);
                },
                error:function () {

                }
            });
        }
    });

    $("#check-all").click(function () {
        //attr用于获取自定义属性值，prop用于获取或修改原生DoM属性
        $(".check-item").prop("checked",$(this).prop("checked"))
    });
    $(document).on("click",".check-item",function () {
        var flg = $(".check-item").length == $(".check-item:checked").length;
        $("#check-all").prop("checked",flg);
    });
    //批量删除
    $(document).on("click","#delAllByEmpId",function () {
        //判断是否至少选择一项
        var checkedNum = $(".check-item:checked").length;
        if (checkedNum == 0){
            alert("请选择至少一项！");return;
        }
        //获取选中员工名字
        var checkedListName = $(".check-item:checked").parents("tr").find("td:eq(2)").text();

        if (confirm("确定要删除"+checkedListName+"等员工信息吗！")){
            var checkedList = new Array();
            //获取选中的员工编号
            $(".check-item:checked").each(function() {
                checkedList.push($(this).parents("tr").find("input").val());
            });
            $.ajax({
                url:"${App_Path}/emp/"+checkedList,
                type:"delete",
                dataType:"json",
                success:function (result) {
                    if (result.code == 100){
                        to_page(curPage);
                    }
                    alert(result.msg);
                },
                error:function () {
                }
            });
        }
    });

    $(document).on("click",".edit-btn",function () {
        window.location.href="${App_Path}/edit/"+$(this).attr("edit-id")+"-"+$(this).attr("pn");
        <%--window.location.href="${App_Path}/edit?id="+$(this).attr("edit-id");--%>
    });

    $("#addEmployee").click(function () {
        window.location.href="${App_Path}/input";
    });




</script>
</body>
</html>
