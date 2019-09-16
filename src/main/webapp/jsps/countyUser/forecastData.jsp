<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/3
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/common/header.jsp" %>
    <link href="/static/css/OrganManagement.css" type="text/css" rel="stylesheet">

</head>
<body>
<div style="width: 1200px;">
    <div class="row">
        <%@include file="/jsps/common/left.jsp" %>
        <div class="col-sm-9">

            <div class="col-sm-12">
                <div class="showTree">
                    <div class="jigou">
                        <p>预报数据</p>
                    </div>

                    <%--预报数据开始--%>
                    <div style="border: 2px solid #11C2EE;width: 600px;height: 400px;margin: 6px 2px" id="jihua">
                        <div style="background-color: #9acfea;font-family: 黑体;font-size: 16px;" >
                            <p>提交计划</p>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" id="forecastDataForm" action="#" method="post">
                                <div class="form-group">
                                    <label for="activeName" class="col-sm-4 control-label">计划名称：</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" name="activeName" id="activeName" placeholder="请输入计划名称"><br>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="activeNum" class="col-sm-4 control-label">计划召开桌数：</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" name="activeNum" id="activeNum" placeholder="请输入计划召开数量"><br>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="startTime" class="col-sm-4 control-label">开始时间：</label>
                                    <div class="col-sm-5">
                                        <input type="date" class="form-control" name="startTime" id="startTime"><br>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="endTime" class="col-sm-4 control-label">结束时间：</label>
                                    <div class="col-sm-5">
                                        <input type="date" class="form-control" name="endTime" id="endTime"><br>
                                    </div>
                                </div>
                            </form>
                            <div style="text-align: center">
                            <button class="btn btn-default" onclick="forecast()">提交</button>
                            <button class="btn btn-default" id="quxiao">取消</button>
                            </div>
                        </div>
                    </div>
                     <%--预报数据结束--%>

                </div>



            </div>
        </div>
    </div>
</div>

</body>
<script>
    function forecast() {
        var data = new FormData($("#forecastDataForm")[0]);

        $.ajax({
            url:"${pageContext.request.contextPath}/countyUser/forecastData",
            type:"post",
            data:data,
            dataType:"json",
            contentType:false,
            processData:false,
            success:function (data) {
                if (data){
                    alert("添加成功")
                    $("#jihua").hide();
                }else {
                    alert("添加失败")
                }
            },
            error:function (err) {
                alert("Error")
            }
        })
    }
</script>
</html>
