<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/9/6
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/common/header.jsp" %>
    <link href="/static/css/OrganManagement.css" type="text/css" rel="stylesheet">
    <style type="text/css">

        .item {
            width: 200px;
            height: 200px;
            float: left;
            position: relative;
            margin: 0px;
        }
        .addImg {
            width: 200px;
            height: 200px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 2;
            cursor: pointer;
        }
        .preview,.preBlock{
            position: absolute;
            display: block;
            width: 200px;
            height: 200px;
            left: 0;
            top: 0;
        }
        .delete {
            width: 30px;
            position: absolute;
            right: -30px;
            top: -15px;
            cursor: pointer;
            display: none;
        }
        .preBlock img {
            display: block;
            width: 200px;
            height: 200px;
        }
        .upload_input{
            display: block;
            width: 0;
            height: 0;
            -webkit-opacity: 0.0;
            /* Netscape and Older than Firefox 0.9 */
            -moz-opacity: 0.0;
            /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/
            -khtml-opacity: 0.0;
            /* IE9 + etc...modern browsers */
            opacity: .0;
            /* IE 4-9 */
            filter:alpha(opacity=0);
            /*This works in IE 8 & 9 too*/
            -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            /*IE4-IE9*/
            filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
        }
    </style>
</head>
<body>
<div style="width: 1200px;">
    <div class="row">
        <%@include file="/jsps/common/left.jsp" %>
        <div class="col-sm-9">

            <div class="col-sm-12">
                <div class="showTree tab-pane active">
                    <div class="jigou">
                        <p>上传活动照片</p>
                    </div>
                    <div class="modal-body">
                        <h3>请上传活动照片</h3>

                        <div class="col-sm-offset-4">
                            <div class="item">
                                <img class="icon addImg" onclick="clickImg(this);" src="/static/img/addImg.png">
                                <input name="url" type="file" class="upload_input" onchange="change(this)">
                                <div class="preBlock">
                                    <img id="card" class="preview" alt="" name="pic" width="190" height="190">
                                </div>
                                <img class="delete" onclick="deleteImg(this)" src="/static/img/delete.png">
                            </div>
                        </div>
                        <div style="text-align: center;margin: 50px" class="col-sm-9">
                        <button class="btn btn-primary" onclick="upPic()">上传图片</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    //点击
    var clickImg = function(obj){
        $(obj).parent().find('.upload_input').click();
    }

    //删除
    var deleteImg = function(obj){
        $(obj).parent().find('input').val('');
        $(obj).parent().find('img.preview').attr("src","");
        //IE9以下
        $(obj).parent().find('img.preview').css("filter","");
        $(obj).hide();
        $(obj).parent().find('.addImg').show();
    }

    //选择图片
    function change(file) {
        //预览
        var pic = $(file).parent().find(".preview");
        //添加按钮
        var addImg = $(file).parent().find(".addImg");
        //删除按钮
        var deleteImg = $(file).parent().find(".delete");

        var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

        // gif在IE浏览器暂时无法显示
        if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
            if (ext != '') {
                alert("图片的格式必须为png或者jpg或者jpeg格式！");
            }
            return;
        }
        //判断IE版本
        var isIE = navigator.userAgent.match(/MSIE/)!= null,
            isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
        isIE10 = navigator.userAgent.match(/MSIE 10.0/)!= null;
        if(isIE && !isIE10) {
            file.select();
            var reallocalpath = document.selection.createRange().text;
            // IE6浏览器设置img的src为本地路径可以直接显示图片
            if (isIE6) {
                pic.attr("src",reallocalpath);
            }else{
                // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
                pic.css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + reallocalpath + "\")");
                // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
                pic.attr('src','data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
            }
            addImg.hide();
            deleteImg.show();
        }else {
            html5Reader(file,pic,addImg,deleteImg);
        }
    }

    //H5渲染
    function html5Reader(file,pic,addImg,deleteImg){
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            pic.attr("src",this.result);
        }
        addImg.hide();
        deleteImg.show();
    }

    /* 使用二进制方式处理dataUrl */
    function processData(dataUrl) {
        var binaryString = window.atob(dataUrl.split(',')[1]);
        var arrayBuffer = new ArrayBuffer(binaryString.length);
        var intArray = new Uint8Array(arrayBuffer);
        for (var i = 0, j = binaryString.length; i < j; i++) {
            intArray[i] = binaryString.charCodeAt(i);
        }

        var data = [intArray],
            blob;

        try {
            blob = new Blob(data);
        } catch (e) {
            window.BlobBuilder = window.BlobBuilder ||
                window.WebKitBlobBuilder ||
                window.MozBlobBuilder ||
                window.MSBlobBuilder;
            if (e.name === 'TypeError' && window.BlobBuilder) {
                var builder = new BlobBuilder();
                builder.append(arrayBuffer);
                blob = builder.getBlob(imgType); // imgType为上传文件类型，即 file.type
            } else {
                console.log('版本过低，不支持上传图片');
            }
        }
        return blob;
    }
    function upPic(){
        //1.获取图片的数据
        var dataUrl=$("#card").attr("src");
        //2.把二进制的图片数据转为Blob对象
        var blob = processData(dataUrl);
        var formData = new FormData();
        formData.append('pic', blob);
        $.ajax({
            url:"/data/uploadPic",
            method: "post",
            data: formData,
            processData: false,// true  ajax 提交的时候不会序列化 data，而是直接使用data
            contentType: false,// contentType 主要设置你发送给服务器的格式，
            success: function (data) {
                if(data.status){
                    alert("上传成功");
                    window.location.reload();
                }else{
                    alert("上传失败");
                }
            },
            error: function () {
                console.log('Upload error');
            }
        });
    }

</script>
</html>
