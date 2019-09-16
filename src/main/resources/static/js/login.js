$(function () {

    $("#codeName").blur(function () {
        var codeName=$(this).val();
            if(!isExistcodeName(codeName)){
                setError($(this),"用户名不存在");
            }else{
                setOk($(this));
            }
    });
    $("#password").blur(function () {
        var password=$(this).val();
        if(!(/^\S{3,6}$/.test(password))){
            setError($(this),"密码由3-6位字母组成");
        }else{
            setOk($(this));
        }
    });

});

function log_but() {
    if (sussesForm()){
        //$("#loginForm").submit();
       var codeName = $("#codeName").val();
       var password = $("#password").val();
       $.ajax({
           url:"/login/userLogin",
           type:"post",
           data:{"codeName":codeName,"password":password},
           dataType:"",
           success:function (data) {
               if (data){
                   alert("登录成功")
                   if (data.level==0 || data.level==1 ){
                       location.href="/jsps/manage/checkManageData.jsp";
                   }else if (data.level==2) {
                       location.href="/jsps/manage/checkCountyUserData.jsp";
                   }

               }
           }
       })

    } else {
        alert("页面错误，请重新提交")
        window.location;
    }
}
function sussesForm() {
    var flag=true;
    $("#loginForm .form-group").each(function(){
        if(!$(this).hasClass("has-success")&&!$(this).hasClass("has-error")){
            $(this).find(".form-control").trigger("blur");
        }
    });
    $("#loginForm .form-group").each(function(){
        if(!$(this).hasClass("has-success")){
            flag=false;
            return;
        }
    });
    return flag;
}

function isExistcodeName(codeName){
    var flag=false;
    $.ajax({
        type:"post",
        url:"/login/getName",
        data:{"codeName":codeName},
        dataType:"json",
        async:false,
        error:function(error){
            console.log("用户名错误！");
        },success:function(data){
            flag=data;
        }
    });
    return flag;
}





function setOk(obj){
    var _pdiv=obj.parents().parents(".form-group");
    if(_pdiv.hasClass("has-error")){
        _pdiv.removeClass("has-error");
    }
    _pdiv.addClass("has-success");
    obj.parents().nextAll("span.help-block").html("&nbsp;");
}
function setError(obj,str){
    var _pdiv=obj.parents().parents(".form-group");
    if(_pdiv.hasClass("has-success")){
        _pdiv.removeClass("has-success");
    }
    _pdiv.addClass("has-error");
    obj.parents().nextAll("span.help-block").html(str);
}