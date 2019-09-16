<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/2
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/common/header.jsp" %>
    <link href="/static/css/OrganManagement.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
        var setting = {
            data: {//设置显示数据
                simpleData: {
                    enable: true,//使用简单类型
                    idKey: "id",//结点唯一标示
                    pIdKey: "parentId",//父节点的唯一标示
                    rootPId: 0//根节点属性对应的值
                },
                key: {
                    checked: true,
                    name: "areaName"//节点名称
                }
            },
            view: {//配置显示视图
                showLine: true,//连接线是否显示
                showIcon: true,//图标是否显示
                addHoverDom: addHoverDom,//鼠标移入展示视图
                removeHoverDom: removeHoverDom,//鼠标移除隐藏视图
                selectedMulti: false  //是否可以选中多个节点
            },

            callback: {
                //  onClick:zTreeOnClick,//用于捕获节点被点击的事件回调函数
                onRename: zTreeOnRename,  //捕获节点编辑名称结束之后的事件回调函数
                beforeRemove: zTreeBeforeRemove//用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作

            },
            edit: {//可以编辑
                enable: true,
            },
            async: {//设置异步加载
                enable: true,//使用异步加载
                url: "${pageContext.request.contextPath}/user/findArea",//访问路径
                autoParam: ["id", "areaName", "parentId"], //设置请求参数
                dataType: "json",
            }
        };

        //鼠标移入展示视图
        var newCount = 1;

        function addHoverDom(treeId, treeNode) {  //treeNode代表节点   treeId根节点的id
            //节点的id的值   拼接span，选中id
            var sObj = $("#" + treeNode.tId + "_span");  //li
            //treeNode.editNameFlag 表示是否是可编辑状态，可编辑时不拼接，return
            //$("#addBtn_"+treeNode.tId).length  表示获取span中对象的长度，大于0时返回；小于0，拼接
            if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;  // return：可编辑，结束。不可编辑，拼接
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            //li之后追加span
            sObj.after(addStr);
            var btn = $("#addBtn_" + treeNode.tId);  //追加span对象
            if (btn) btn.bind("click", function () {
                addNodes(treeId, treeNode);
            });
        };

        //添加机构
        function addNodes(treeId, treeNode) {
            //把当前选择的节点座位父节点
            $("#pId").val(treeNode.id);
            $("#addOrganModal").modal("show");
        }
        function organ_add() {
            var areaName = $("#areaName").val();
            var organCode = $("#organCode").val();
            var pId = $("#pId").val();
            var data = new FormData($("#addOrganForm")[0]);

            $.ajax({
                url: "${pageContext.request.contextPath}/organ/addOrgan",
                type: "post",
                data: {areaName: areaName, organCode:organCode,pId:pId},
                dataType: "json",
                success: function (data) {
                    if (data) {
                        alert("成功")
                        findUserZtree();
                    } else {
                        alert("失败")
                    }
                    $("#addOrganModal").modal("hide");
                },
                error: function (err) {
                    alert("Error")
                }

            })
        }

        //删除机构
        function zTreeBeforeRemove(treeId,treeNode) {
            if (treeNode.isParent){
                alert("根节点不能删除")
            }else {
                deleteById(treeNode.id);
                return true;
            }
        }
        function deleteById(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/organ/deleteOrganById",
                type:"post",
                data:{id:id},
                dataType:"json",
                success:function (data) {
                    if (data){
                        alert("删除成功")
                    }else {
                        alert("删除失败")
                    }
                },
                error:function (err) {
                    alert("Error")
                }
            })
        }

        //修改机构名称
        function zTreeOnRename(event,treeId,treeNode,isCancel) {
            var id = treeNode.id;
            var areaName= treeNode.areaName;
            ReNameOrgan(id,areaName);
        }
        function ReNameOrgan(id,areaName) {
            $.ajax({
                url:"${pageContext.request.contextPath}/organ/updateOrganName",
                type:"post",
                data:{"id":id,"areaName":areaName},
                dataType:"json",
                success:function (data) {
                    if (data) {
                        alert("修改成功")
                    }else {
                        alert("修改失败")
                    }
                },
                error:function (err) {
                    alert("Error")
                }
            })
        }
        
        //鼠标移除隐藏视图
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_" + treeNode.tId).unbind().remove();
        };

        $(function () {
            findUserZtree();
        });

        function findUserZtree() {
            $.fn.zTree.init($("#areaTree"), setting);
        }

    </script>
</head>
<body>
<div style="width: 1200px;">
    <div class="row">
        <%@include file="/jsps/common/left.jsp" %>
        <div class="col-sm-9">

            <div class="col-sm-12">

                <div class="showTree">
                    <div class="jigou">
                        <p>机构管理</p>
                    </div>
                    <%--导入开始--%>
                    <div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">导入市级机构数据：</label>
                            <div class="col-sm-4">
                                <input type="file" name="daorushi">
                            </div>
                            <div class="col-sm-4">
                                <input type="submit" name="daorushi" value="确认导入">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"> 导入县级机构数据：</label>
                            <div class="col-sm-4">
                                <input type="file" name="daoruxian">
                            </div>
                            <div class="col-sm-4">
                                <input type="submit" name="daorushi" value="确认导入">
                            </div>
                        </div>
                    </div>
                    <%--导入结束--%>

                    <%--zTree树开始--%>
                    <div>
                        <div class="content_wrap">
                            <div class="zTreeDemoBackground left">
                                <ul id="areaTree" class="ztree"></ul>
                            </div>
                        </div>
                    </div>
                    <%--zTree树结束--%>

                </div>

                <%--添加节点模态框--%>
                <div class="modal fade" id="addOrganModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    <span id="pnode">添加机构</span>
                                </h4>
                            </div>
                            <div class="modal-body">

                                <form class="form-horizontal" id="addOrganForm"
                                      action="#" method="post">

                                   <%-- <div class="form-group">
                                        <label class="col-sm-4 control-label">父节点：</label>
                                        <div class="col-sm-5">
                                            &lt;%&ndash;<input type="text" class="form-control" value="${list.parentId}"><br>&ndash;%&gt;
                                            <p class="form-control-static">${list.areaName}</p>
                                        </div>
                                    </div>--%>

                                    <div class="form-group">
                                        <label for="areaName" class="col-sm-4 control-label">名称：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="areaName" id="areaName"><br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="organCode" class="col-sm-4 control-label">编码：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="organCode" id="organCode"><br>
                                        </div>
                                    </div>
                                    <input type="hidden" name="parentId" id="pId">

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    关闭
                                </button>
                                <button type="button" class="btn btn-primary" onclick="organ_add()">
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

</body>
</html>
