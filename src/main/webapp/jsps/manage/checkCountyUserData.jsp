<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/11
  Time: 9:03
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
                        <p>查看数据</p>
                    </div>
                    <div>
                        <div class="form-group">
                            <div class="col-sm-3">
                                开始时间： <input type="date" id="startTime" name="startTime">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3">
                                结束时间：<input type="date" id="endTime" name="endTime">
                            </div>
                        </div>
                        <input type="submit" id="time_sub" value="查询">
                    </div>


                    <ul class="nav nav-tabs" id="myTabs">
                        <li class="active">
                            <a href="#countyUserEcharts" aria-controls="reportMessage" data-toggle="tab" id="reportMes">统计图</a>
                        </li>
                        <li>
                            <a href="#countyUserTab" aria-controls="uploadPic" data-toggle="tab" onclick="countyUser_table()">详细列表信息</a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane active" id="countyUserEcharts">

                            <div id="areaName" style="height: 80%">
                                <input type="hidden" id="areaId" name="areaId" value="${user.areaId}">
                            </div>

                            <script type="text/javascript">
                                $(function(){
                                    $("#manageTab").hide();
                                    var areaId = $("#areaId").val();
                                    $.ajax({
                                        url:"${pageContext.request.contextPath }/checkData/checkCountyUserEcharts",
                                        type:"post",
                                        data:{areaId:areaId},
                                        dataType:"json",
                                        success:function(data){
                                            if(data){
                                                var dom = document.getElementById("areaName");
                                                var myChart = echarts.init(dom);
                                                option=null;
                                                var arr1 = [];
                                                var arr2 = [];
                                                for (var i=0;i<data.length;i++){
                                                    arr1.push(data[i].areaName);
                                                    arr2.push(data[i].money);
                                                }
                                                option = {
                                                    title : {
                                                        text:arr1+"预估保费统计图", //主标题文本
                                                        x:'center'
                                                    },

                                                    xAxis: {
                                                        type: 'category',
                                                        data: arr1
                                                    },
                                                    yAxis: {
                                                        type: 'value',
                                                        name:'预估保费',
                                                        max:'100000'
                                                    },
                                                    series: [{
                                                        data: arr2,
                                                        type: 'bar'
                                                    }]
                                                };
                                                if (option && typeof option === "object") {
                                                    myChart.setOption(option, true);
                                                }
                                            }
                                        }
                                    });
                                });
                            </script>
                        </div>

                        <div class="tab-pane active" id="countyUserTab">
                            <table id="countyUser_tab">

                            </table>
                            <input type="hidden" id="id" name="areaId" value="${user.areaId}">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>

    function countyUser_table(){
        $("#countyUserTab").show();
        $("#countyUser_tab").bootstrapTable({
            url:"${pageContext.request.contextPath }/checkData/showCountyUserData",
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
            queryParams:function(param){//请求参数 封装的表格对象
                return{
                    id:$("#id").val()
                }
            },
            columns:[
                {
                    field:'id',
                    title:'编号',
                    formatter:function(value,row,index){
                        return index+1;
                    }
                },{
                    field:'areaName',
                    title:'机构名称'
                },{
                    field:'planNum',
                    title:'计划召开桌数'
                },{
                    field:'realNum',
                    title:'实际召开桌数'
                },{
                    title:'执行率',
                    formatter:function(value,row,index){
                        return "100%";
                    }
                },{
                    field:'newClient',
                    title:'新客户'
                },{
                    field:'oldClient',
                    title:'旧客户'
                },{
                    field:'intentionClient',
                    title:'意向客户'
                },{
                    field:'money',
                    title:'预估保费'
                }
            ]

        })
    }


</script>
</html>
