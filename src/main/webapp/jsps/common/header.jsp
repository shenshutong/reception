<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/8/29
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>太平洋保险山东分公司</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.js"></script>
    <link href="${pageContext.request.contextPath}/static/ztree/css/demo.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap-colorpicker.css" rel="stylesheet" />

    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap-colorpicker.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/echarts.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/js/shandong.js" type="text/javascript"></script>


    <style>
        .head-logo {
            height: 80px;
            width: 1500px;
            right: 100px;
            background: url("${pageContext.request.contextPath}/static/img/header/header.jpg");
        }
        .head-caozuo{
            width: 200px;
            height: 20px;
            position: absolute;
            right: 50px;
        }
    </style>
</head>
<body>
<div class="head-logo">
    <div class="head-caozuo">
        <h3>欢迎${user.codeName}登录 &nbsp;&nbsp;
            <a style="color: black" href="${pageContext.request.contextPath}/login/outLogin">退出</a>
        </h3>
    </div>
</div>
</body>
</html>
