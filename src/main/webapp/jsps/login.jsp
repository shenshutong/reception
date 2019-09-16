<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/8/28
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录</title>
    <link href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/login.css" type="text/css" rel="stylesheet" />
    <script src="/static/common/jquery-3.2.1.js"></script>
    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
      .login_bg {
          position: absolute;
          left: 0;
          top: 10%;
          width: 100%;
          height: 85%;
          background: url("${pageContext.request.contextPath}/static/img/login/timg1.jpg");
          background-size: 100%;
      }
      #loginForm .form-group {
          margin-bottom:0px;
      }
    </style>
</head>
<body>

<div class="reg-logo">
    <div class="lg-juzhong">
        <a href="">
            <img class="logo" src="${pageContext.request.contextPath}/static/img/header/img1.jpg">
        </a>

    </div>
</div>

<div class="login_bg">
    <div class="d_form">
    <form class="form-horizontal"  id="loginForm" method="post" action="${pageContext.request.contextPath}/login/userLogin">
        <h3 style="text-align: center">请登录</h3>
        <div class="col-sm-12">
        <div class="form-group" style="margin-bottom:20px;">
            <label for="codeName" class="col-sm-4 control-label" style="font-size: 15px; font-weight: inherit">用户名:</label>
            <div class="col-sm-8" >
                <input type="text" class="form-control" id="codeName" name="codeName">
            </div>
        </div>
        <div class="form-group" style="margin-bottom:20px;">
            <label for="password" class="col-sm-4 control-label" style="font-size: 15px; font-weight: inherit">密码:</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="password" name="password">
            </div>
        </div>

        </div>
        <div style="text-align: center">
            <button onclick="log_but()" class="btn btn-primary" style="background-color: #5cb85c">登录</button>
            <button onclick="" class="btn btn-default">重置</button>
        </div>
    </form>
    </div>
</div>


<script src="/static/js/login.js"></script>
<%@include file="/jsps/common/foot.jsp"%>
</body>

</html>
