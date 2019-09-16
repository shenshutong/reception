<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/9
  Time: 10:42
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
                                    <a href="#manageEcharts" aria-controls="reportMessage" data-toggle="tab" id="reportMes">统计图</a>
                                </li>
                                <li>
                                    <a href="#manageTab" aria-controls="uploadPic" data-toggle="tab" onclick="manage_table()">详细列表信息</a>
                                </li>
                            </ul>

                            <div class="tab-content">

                                <div class="tab-pane active" id="manageEcharts" >

                                   <div style="width: 700px;float: right">
                                    <div id="areaName" style="height: 80%;width: 100%"></div>

                                    <script type="text/javascript">
                                        $(function(){
                                            $("#manageTab").hide();
                                            $.ajax({
                                                url:"${pageContext.request.contextPath }/checkData/checkManageEcharts",
                                                type:"post",
                                                data:{},
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
                                                                text:"河北省预估保费统计图", //主标题文本
                                                                x:'center'
                                                            },

                                                            xAxis: {
                                                                type: 'category',
                                                                data: arr1
                                                            },
                                                            yAxis: {
                                                                type: 'value',
                                                                name:'预估保费',
                                                                max:'10000000'
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
                                    <div style="width: 450px;float: left;">
                                    <div id="shandongMap" style="height:80%;width: 100%; margin-right: 70%;display: inline-block"></div>
                                    <script type="text/javascript">
                                        var dom = document.getElementById("shandongMap");
                                        var myChart = echarts.init(dom);
                                        var app = {};
                                        option = null;
                                        myChart.showLoading();

                                        $.get('/static/echarts/json/shandong.json', function (geoJson) {


                                            myChart.hideLoading();

                                            echarts.registerMap('shandong', geoJson);

                                            myChart.setOption(option = {
                                                visualMap: {
                                                    min: 800,
                                                    max: 5000,
                                                    text:['High','Low'],
                                                    top:'left',
                                                    realtime: false,
                                                    calculable: true,
                                                    inRange: {
                                                        color: ['lightskyblue','yellow', 'orangered']
                                                    }
                                                },
                                                series: [
                                                    {
                                                        type: 'map',
                                                        mapType: 'shandong', // 自定义扩展图表类型
                                                        itemStyle:{
                                                            normal:{label:{show:true}},
                                                            emphasis:{label:{show:true}}
                                                        },
                                                        data:[
                                                            {name: '潍坊市', value: 2005.34},
                                                            {name: '烟台市', value: 907.48},
                                                            {name: '威海市', value: 968.1},
                                                            {name: '青岛市', value: 992.6},
                                                            {name: '济南市', value: 4405.49},
                                                            {name: '泰安市', value: 4089.64},
                                                            {name: '德州市', value: 3769.78},
                                                            {name: '济宁市', value: 4518.97},
                                                            {name: '菏泽市', value: 4520.26},
                                                            {name: '临沂市', value: 3368},
                                                            {name: '聊城市', value: 4918.26},
                                                            {name: '滨州市', value: 3881.84},
                                                            {name: '莱芜市', value: 4178.01},
                                                            {name: '枣庄市', value: 2227.92},
                                                            {name: '东营市', value: 2180.98},
                                                            {name: '淄博市', value: 4172.94},
                                                            {name: '日照市', value: 805.9}
                                                        ],
                                                    }
                                                ]
                                            });
                                        });;
                                        if (option && typeof option === "object") {
                                            myChart.setOption(option, true);
                                        }
                                    </script>
                                    </div>

                                </div>

                            <div class="tab-pane active" id="manageTab">
                               <table id="manage_tab">

                               </table>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>

function manage_table(){
    $("#manageTab").show();
    $("#manage_tab").bootstrapTable({
        url:"${pageContext.request.contextPath }/checkData/showManageData",
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
