//选择用户等级，展示模态框
function add_but() {
    var areaId = $("#areaId").val();
    if (areaId){
        $("#addUserModal").modal("show");
    }else {
        alert("请选择用户等级")
    }
}
//添加用户
function user_add() {
    var data = new FormData($("#addUserForm")[0]);
    $.ajax({
        url:"/user/addUser",
        type:"post",
        data:data,
        dataType:"json",
        contentType:false,
        processData:false,
        success:function (data) {
            if (data){
                alert("添加成功")
                $("#user_tab").bootstrapTable("refresh");
            }else {
                alert("添加失败")
            }
            $("#addUserModal").modal("hide");
        },
        error:function (err) {
            alert("Error")
        }
    })
}