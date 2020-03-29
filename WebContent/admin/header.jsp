<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
   	<link rel="stylesheet" href="css/amazeui.css">
    <style>
    .navbar{
        width: 200px;
        height: 89%;
        overflow: hidden;
        box-sizing: border-box;
        background: white;
        display:inline-block;
        border-radius:0;
        text-align:center;
    }
    .avatar{
        width: 100%;
        height: 200px;
        padding: 0;
        border: none;
    }
    body{
    	padding: 40px 0 0 120px;
        height: 100vh;
        overflow: hidden;
       background:radial-gradient(#bfe9ff,#314755);
    }
    .outer {
			position: absolute;
			left: 320px;
			top: 40px;
			background: white;
			margin-right: 50px;
			padding: 30px;
			background: #eee;
			height: 85%;
			width: 70%;
		}
		.inner{
			background: white;
			height: 100%;
			padding: 20px 40px;
			border-radius: 10px;
			
		}
		.outer .inner table tr td{
			white-space:nowrap;
			text-overflow: ellipsis;
			
		}
        .list-group-item {
            border: none;
        }
        .Form {
			position: fixed;
			height: 100vh;
			width: 100%;
			background: rgba(0, 0, 0, .3);
			top: 0;
			left: 0;
			text-align: center;
			z-index: 5;
			display: none;
		}
		.Form .content{
			width: 500px;
			height: 300px;
			background: white;
			border-radius: 15px;
			position: absolute;
			left: 50%;
			top: 25%;
			text-align: center;
			margin-left: -250px;
		}
		.Form .formTitle{
			height: 100px;
			line-height: 100px;
			background:url('images/formBg.jpg') 0% 52%;
			border-radius: 15px 15px 0 0;
			margin-bottom: 30px;
			color: white;
			font-size: 20px;
		}
        .am-btn-default {
			background: white;
		}
        
    </style>
</head>
<script type="text/javascript" src='js/form.js'></script>
<body>
    <div class="list-group navbar">
        <a href="#" class="list-group-item avatar">
            <img src="images/avatar.jpg" class="avatar" alt="">
        </a>
        <a href="chartsList.action" class="glyphicon glyphicon-signal list-group-item">
        	数据统计</a>
        <c:if test="${admin.role!=2}">
        	<a href="moduleList.action" class="glyphicon glyphicon-file list-group-item">
        	板块管理</a>
        </c:if>
        <c:if test="${admin.role!=2}">
        	<a href="topicList.action" class="glyphicon glyphicon-th-large list-group-item">
        	话题管理</a>
        </c:if>
        <c:if test="${admin.role!=3}">
        	<a href="postList.action" class="glyphicon glyphicon-tag list-group-item">
        	帖子管理</a>
        </c:if>
        <c:if test="${admin.role!=3}">
        	<a href="userList.action" class="glyphicon glyphicon-user list-group-item">
        	用户管理</a>
        </c:if>
        <a href="adminEdit.action" class="glyphicon glyphicon-cog list-group-item">
        	修改密码</a>
        	<!-- 
        <a href="newsList.action" class="list-group-item">公告管理</a> -->
        	
        <a href="login.jsp" class="glyphicon glyphicon-paste list-group-item" onClick='if(confirm("确定退出？")==false)return false'>
        	退出登陆</a>
    </div>
</body>

</html>