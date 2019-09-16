<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/6
  Time: 8:35
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
                        <p>上报数据</p>
                    </div>

                    <div style="border: 2px solid #11C2EE;width: 1000px;height: 27px;margin: 6px 2px">
                        <div style="background-color: #9acfea;font-family: 黑体;font-size: 16px;">
                            <p>所有计划列表计划</p>
                        </div>
                        <table id="report_tab">

                        </table>
                        <input type="hidden" name="id" id="id">
                        <input type="hidden" name="activeName" id="activeName">
                    </div>

                </div>



            </div>
        </div>
    </div>
</div>

</body>
<script>
    $(function () {
        var id = $("#id").val();
        $("#report_tab").bootstrapTable({
            url:"${pageContext.request.contextPath }/data/findDataByStatus",
            pageNumber:1,
            pageSize:3,
            pageList:[3,6,8],
            pagination:true,
            sidePagination:'client', //客户端分页    服务端分页'server'
            //post提交，默认不写get
            mehtod:'post',
            //发送到服务器的数据编码类型，设置form表单传输编码
            contentType:"aplication/x-www-form-urlencoded;charset=UTF-8",
            striped:true,//斑马线
            columns:[
                {
                    field:'id',
                    title:'编号',
                    formatter:function(value,row,index){
                        return index+1;
                    }
                },{
                    field:'activeName',
                    title:'计划名称'
                },{
                    field:'planNum',
                    title:'计划桌数'
                },{
                    field:'startTime',
                    title:'开始时间'
                },{
                    field:'endTime',
                    title:'结束时间'
                },{
                    field:'entryTime',
                    title:'录入时间'
                },{
                    title:'操作',
                    formatter:function(value,row,index){
                        //return "<a href='javascript:findDataById("+row.id+")'>上报实际数据</a>"
                        return "<a href='${pageContext.request.contextPath}/data/findDataById?id="+row.id+"'>上报实际数据</a>"
                    }
                }
            ]

        })
    })

    /*function findDataById(id) {
        var activeName = $("#activeName").val();
        $.ajax({
            url:"/data/findDataById",
            type:"post",
            data:{id:id},
            dataType:"json",
            success:function (data) {
                if (data) {
                    alert("查询成功")
                    window.location.href="/jsps/countyUser/addDataF.jsp?id="+data.id;
                }else {
                    alert("失败")
                }
            },
            error:function (err) {
                alert("Error")
            }
        })

    }*/
</script>
</html>
