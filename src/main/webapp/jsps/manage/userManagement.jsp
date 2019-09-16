<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/8/29
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/common/header.jsp"%>
    <link href="/static/css/userManagement.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
        var setting = {
            data: {//设置显示数据
                simpleData: {
                    enable: true,//使用简单类型
                    idKey:"id",//结点唯一标示
                    pIdKey:"parentId",//父节点的唯一标示
                    rootPId:0//根节点属性对应的值
                },
                key:{
                    checked:true,
                    name:"areaName"//节点名称
                }
            },
            view:{//配置显示视图
                showLine:true,//连接线是否显示
                showIcon:true,//图标是否显示
                addHoverDom: addHoverDom,//鼠标移入展示视图
                removeHoverDom: removeHoverDom,//鼠标移除隐藏视图
                selectedMulti: false  //是否可以选中多个节点
            },

            callback: {
                onClick:zTreeOnClick,//用于捕获节点被点击的事件回调函数
            },
            edit:{//可以编辑
                enable: true,
            },
            async: {//设置异步加载
                enable: true,//使用异步加载
                url:"${pageContext.request.contextPath}/user/findArea",//访问路径
                autoParam:["id", "areaName", "parentId"], //设置请求参数
                dataType:"json",
            }
        };

        //鼠标移入展示视图
        var newCount = 1;
        function addHoverDom(treeId, treeNode) {  //treeNode代表节点   treeId根节点的id
            //节点的id的值   拼接span，选中id
            var sObj = $("#" + treeNode.tId + "_span");  //li
            //treeNode.editNameFlag 表示是否是可编辑状态，可编辑时不拼接，return
            //$("#addBtn_"+treeNode.tId).length  表示获取span中对象的长度，大于0时返回；小于0，拼接
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;  // return：可编辑，结束。不可编辑，拼接
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            //li之后追加span
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);  //追加span对象
            if (btn) btn.bind("click", function(){
                addNodes(treeId, treeNode);
            });
        };

        //鼠标移除隐藏视图
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };

        //查询用户列表
        function zTreeOnClick(event,treeId,treeNode) {
            $("#user_tab").show();
            var id = treeNode.id;
            $("#user_id").val(treeNode.id);
            $("#user_tab").bootstrapTable("refresh");
            $("#areaId").val(treeNode.id);
            userTab();
        }
        function userTab(){
                $("#user_tab").bootstrapTable({
                    url:"${pageContext.request.contextPath }/user/findUserTableById",
                    pageNumber:1,
                    pageSize:3,
                    pageList:[3,6,8],
                    pagination:true,
                    sidePagination:'server', //客户端分页    服务端分页'server'
                    //post提交，默认不写get
                    mehtod:'post',
                    //发送到服务器的数据编码类型，设置form表单传输编码
                    contentType:"aplication/x-www-form-urlencoded;charset=UTF-8",
                    striped:true,//斑马线
                    queryParams:function(param){
                        return {
                            limit:param.limit,
                            offset:param.offset,
                            id:$("#user_id").val()
                        }
                    },
                    responseHandler:function(res){
                        return {
                            "total":res.total,
                            "rows":res.list
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
                            field:'userName',
                            title:'名称'
                        },{
                            field:'codeName',
                            title:'code信息'
                        },{
                            field:'level',
                            title:'级别'
                        },{
                            title:'操作',

                        }
                    ]

                })
        }

        $(function(){
            findUserZtree();
        });

        function findUserZtree() {
            $.fn.zTree.init($("#areaTree"),setting);
        }

    </script>
</head>
<body>

<div style="width: 1200px;">
    <div class="row">
        <%@include file="/jsps/common/left.jsp"%>
        <div class="col-sm-9">

            <div class="col-sm-12">
                <%--ztree+table开始--%>
                <div class="showTree">
                    <div class="yonghubiaoti">
                        <p >用户管理</p>
                    </div>
                    <%--zTree树开始--%>
                    <div style=" border: 2px solid #11C2EE;width: 386px;height: 560px;float: left">
                        <div class="content_wrap">
                            <div class="zTreeDemoBackground left">
                                <ul id="areaTree" class="ztree"></ul>
                            </div>
                        </div>
                    </div>
                    <%--zTree树结束--%>
                    <%--用户列表--%>
                    <div class="user_table">
                        <input type="hidden" id="user_id">
                        <table id="user_tab">

                        </table>
                        <button class="btn btn-default" type="button" onclick="add_but()">
                            <img width="20" height="20" src="/static/img/left/temp4.jpg">
                            添加
                        </button>
                    </div>
                    <%--用户列表--%>
                </div>
                <%--ztree+table结束--%>

                <%--添加用户模态框--%>
                <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    <span id="pnode">添加用户</span>
                                </h4>
                            </div>
                            <div class="modal-body">

                                <form class="form-horizontal" id="addUserForm" action="#" method="post">

                                    <div class="form-group">
                                        <label for="userName" class="col-sm-4 control-label">用户名称：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="userName" id="userName" placeholder="请输入用户名"><br>
                                        </div>

                                        <div class="col-sm-4">
                                            <span class="help-block" id="msg"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="codeName" class="col-sm-4 control-label">code描述：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="codeName" id="codeName" placeholder="请输入登录名称"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password" class="col-sm-4 control-label">密码：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="password" id="password" placeholder="请输入密码"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password" class="col-sm-4 control-label">级别：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="level" id="level"><br>
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-control" name="areaId" id="areaId"><br>


                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    关闭
                                </button>
                                <button type="button" class="btn btn-primary" onclick="user_add()">
                                    提交
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <!-- 模态框结束 -->


            </div>
        </div>
    </div>
</div>


<script src="/static/js/userManage/userManagement.js"></script>
</body>
</html>
