<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src='js/jquery-3.3.1.min.js'></script>
</head>
<style>
        .bg {
            background-image: url('img/t.jpg')!important; 
            background-position: 0% 30% !important;         
        }

        .container.box {
            margin-top: 70px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .container .user-avatar {
            margin-top: -180px;
            width: 100%;
        }

        .user-avatar img {
            border-radius: 50%;
            border: 5px solid #ccc;
            width: 150px;
            height: 150px;
            margin-left: 50%;
            transform: translateX(-75px);
        }

        .nav {
            width: 100%;
            display: flex;
            height: 50px;
            line-height: 50px;
            border: 1px solid rgb(86, 152, 159);
            background: rgb(86, 152, 159);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .nav .item {
            flex-grow: 1;
            text-align: center;
            text-decoration: none;
            color: white;
            letter-spacing: 15px;
        }

        .nav .item:hover {
            border-bottom: 3px solid rgb(35, 118, 183);
            padding: 2px;
        }

        .info,
        .setting {
            width: 100%;
            background: rgb(240, 240, 240);
            padding: 20px;
            color: rgb(35, 118, 183);
            display: flex;
            justify-content: space-around;

        }

        /* 内容部分的样式 */
        .info .users {
            width:30%;
            margin-right: 10px;
            text-align: center;
            margin-top: 20px;
        }

        .info .post {
            width:70%
        }

        .info .title {
            font-weight: 700;
            font-size: 15px;
        }

        .info .title::after {
            content: '';
            display: block;
            margin-top: 10px;
            border-bottom: 2px dashed rgb(35, 118, 183);
        }

        .users .avatar {
            width: 100px;
            height: 100px;
            border: 3px solid rgb(35, 118, 183);
            box-shadow: 0 0 2px #333;
        }

        .users .user-info {
            text-align: left;
            margin-top: 20px;
            margin-left:20%;
            display: flex;
            flex-direction: column;
        }

        .user-info li {
            padding: 5px;
            list-style: none;
        }
        .user-info li span{
        	margin-right:20px;
        }
        .post-item {
            margin: 10px;
            background: rgb(86, 152, 159);
            position: relative;
            border-radius: 10px;
            padding: 5px;
            color: #f5f5f5;
            padding:10px;
        }

        .post-item::before {
            content: '';
            display: block;
            border: 10px solid transparent;
            border-right-color: rgb(86, 152, 159);
            position: absolute;
            left: -20px;
            top: 10px;
        }

        /* 设置部分的样式 */

        .setting .reset-avatar {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-content: center;
            text-align: center;
            padding: 20px;
            margin-left: 10%;
        }

        .setting .reset-info {
            flex-grow: 2;
            padding: 20px;
            margin-left: -10%;
        }

        .setting .reset-info .btn {
            margin-top: 10px;
            margin-right: 20px;
        }

        .setting .reset-info label {
            margin-top: 10px;
        }

        .file {
            position: relative;
            display: inline-block;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
            width: 150px;
            margin-top: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .reset-avatar img {
            width: 150px;
            height: 150px;
            overflow: hidden;
            border: 2px solid #004974;
            box-shadow: 0 0 3px #333;
            margin-top: -50px;
        }
        .information {
        	display:block;
        	color:#f5f5f5
        }
    </style>
<body>
	<jsp:include page="header.jsp" />
	<div class="container box"> 
        <div class="user-avatar">
            <img src='${user.avatar}' alt="">
        </div>
        <nav class="nav">
            <a href="user.action" class="item"><i class="glyphicon glyphicon-home"></i>主页</a>
            <a href="edit.action?user.id=${user.id}" class="item"><i class="glyphicon glyphicon-cog"></i> 设置</a>
        </nav>
        <form class="form-horizontal setting" action="update.action" method="post">
            <div class="reset-avatar">
                <img  id="pictures" class="img_wrap" src='${user.avatar}'>
                <button class="file  btn btn-primary">修改头像
                	
                    <input type="file" id="upload" accept="image/*" capture="camera"  value="img/head.jpeg"/>
                </button>
            </div>
            <div class="reset-info">
                <input type="text" name="user.avatar" value="${user.avatar}" id='user-avatar' style="display:none" required="required" class="form-control" >
                <label for="">用户ID：</label><input name="user.id" type="hidden" value="${user.id}" class="form-control">
                <input type="text" class="form-control" id="" value="${user.id}" required="required" disabled="disabled">
                <label for="">用户名：</label><input name="user.username" type="hidden" value="${user.username}" class="form-control">
                <input type="text" class="form-control" id="" value="${user.username}" required="required" disabled="disabled">
                <label for="">积分：</label><input name="user.score" type="hidden" value="${user.score}" class="form-control">
                <input type="text" class="form-control" id="" value="${user.score}" required="required" disabled="disabled">
                <label for="">昵称：</label><input type="text" name="user.nickname" value="${user.nickname}" required="required" class="form-control" >
                <label for="">密码：</label><input type="text" name="user.password"  class="form-control">
                <button type='submit'  class="btn btn-primary">确定</button>
                <button type='reset' id='btn' class="btn btn-default">取消</button>
            </div>

        </form>
        
    </div>
    
    <script>
    var oBtn = document.getElementById('btn')
    var pic = document.getElementById('pictures')
    var oAvatar = document.getElementById('upload')
    var data
    var demo_h5_upload_ops = {
            init: function () {
                this.eventBind();
            },
            eventBind: function () {
                var that = this;
                $("#upload").change(function () {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        that.compress(this.result);
                    };
                    reader.readAsDataURL(this.files[0]);
                });
            },
            compress: function (res) {
                var that = this;
                var img = new Image(),
                    maxH = 300;

                img.onload = function () {
                    var cvs = document.createElement('canvas'),
                        ctx = cvs.getContext('2d');

                    if (img.height > maxH) {
                        img.width *= maxH / img.height;
                        img.height = maxH;
                    }
                    cvs.width = img.width;
                    cvs.height = img.height;

                    ctx.clearRect(0, 0, cvs.width, cvs.height);
                    ctx.drawImage(img, 0, 0, img.width, img.height);
                    var dataUrl = cvs.toDataURL('image/jpeg', 1);
                    $(".img_wrap").attr("src", dataUrl);
                    $(".img_wrap").show();
                    // 上传略
                    
                     $("#user-avatar").attr("value",dataUrl)
                     that.upload(dataUrl);
                };

                img.src = res
            },
            upload: function (image_data) {
                /*这里写上次方法,图片流是base64_encode的*/
            }
        };


        $(document).ready(function () {
            demo_h5_upload_ops.init();
            
            oBtn.onclick = function(){
            	console.log(pic.src)
            }
        });
        
    </script>
