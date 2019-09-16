<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/6
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/common/header.jsp" %>
    <link href="/static/css/OrganManagement.css" type="text/css" rel="stylesheet">

    <%
           session=request.getSession();
           Object userData = session.getAttribute("userData");
           if (userData==null){
               response.sendRedirect(request.getContextPath() + "/jsps/login.jsp");
           }

    %>
</head>
<body>
<div style="width: 1200px;">
    <div class="row">
        <%@include file="/jsps/common/left.jsp" %>
        <div class="col-sm-9">

            <div class="col-sm-12">
                <div>
                    <ul class="nav nav-tabs" id="myTabs">
                        <li class="active">
                            <a href="#reportMessage" aria-controls="reportMessage" data-toggle="tab" id="reportMes"></a>
                        </li>
                        <li>
                            <a href="#uploadPic" aria-controls="uploadPic" data-toggle="tab" id="upPic"></a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <div class="showTree tab-pane active" id="reportMessage">
                            <div class="jigou">
                                <p>录入活动数据</p>
                            </div>
                            <div class="modal-body">

                                <form class="form-horizontal" id="reportDataForm" action="#" method="post">
                                    <input type="hidden" name="id" id="id" value="${userData.id}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">计划名称：</label>
                                        <div class="col-sm-3">
                                             <p class="form-control-static">${userData.activeName}</p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="realNum" class="col-sm-2 control-label">实际桌数：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="realNum" id="realNum" placeholder="请输入计划召开数量"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="newClient" class="col-sm-2 control-label">新客户：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="newClient" id="newClient" placeholder="请输入新客户"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="oldClient" class="col-sm-2 control-label">旧客户：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="oldClient" id="oldClient" placeholder="请输入旧客户"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="intentionClient" class="col-sm-2 control-label">意向客户：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="intentionClient" id="intentionClient" placeholder="请输入意向客户"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="money" class="col-sm-2 control-label">保费：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="money" id="money" placeholder="请输入保费"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="activeTime" class="col-sm-2 control-label">活动时间：</label>
                                        <div class="col-sm-3">
                                            <input type="date" class="form-control" name="activeTime" id="activeTime" placeholder="请输入活动时间"><br>
                                        </div>
                                    </div>

                                    <input type="hidden" name="areaId" id="areaId" value="${user.areaId}">


                                </form>
                                <div style="text-align: center" class="col-sm-6">
                                    <button class="btn btn-default" onclick="report()">提交</button>
                                    <button class="btn btn-default" id="quxiao">取消</button>
                                </div>
                            </div>


                        </div>

                        <div class="showTree tab-pane active" id="uploadPic">
                            <div class="jigou">
                                <p>上传活动图片</p>
                            </div>
                            ddddddd

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $("#myTabs").hide();
    $("#uploadPic").hide();
    function report() {
        var id = $("#id").val();
        //var areaId = $("#areaId").val();
        var data = new FormData($("#reportDataForm")[0]);
        //var data = $("#reportDataForm").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/data/updateData",
            type:"post",
            data:data,
            dataType:"json",
            contentType:false,
            processData:false,
            success:function (data) {
                if (data){
                    alert("success")
                    window.location.href="${pageContext.request.contextPath}/jsps/countyUser/uploadPic.jsp";
                }else {
                    alert("failed")
                }
            },
            error:function (err) {
                alert("Error")
            }
        })

    }
</script>
</html>
