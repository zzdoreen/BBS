<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
   
    <style>
    .navbar{
        width: 200px;
        height: 90%;
        overflow: hidden;
        box-sizing: border-box;
        background: white;
        display:inline-block;
        border-radius:0;
        text-algin:center;
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
    </style>
</head>

<body>
    <div class="list-group navbar">
        <a href="#" class="list-group-item avatar">
            <img src="images/avatar.jpg" class="avatar" alt="">
        </a>
        <c:if test="${admin.role!=2}">
        <a href="moduleList.action" class="list-group-item"
        <%if(request.getRequestURI().contains("module_")){out.print("class='list-group-item active'");}%> role="presentation"
        >
        	<i class='glyphicon glyphicon-file'></i>
        	板块管理</a>
        </c:if>
        <c:if test="${admin.role!=2}">
        <a href="topicList.action" class="list-group-item"
        <%if(request.getRequestURI().contains("topic_")){out.print("class='list-group-item active'");}%> role="presentation"
        >
        	<i class='glyphicon glyphicon-th-large'></i>
        	话题管理</a>
        </c:if>
        <c:if test="${admin.role!=3}">
        <a href="postList.action" class="list-group-item"
        <%if(request.getRequestURI().contains("post_")){out.print("class='list-group-item active'");}%> role="presentation"
        >
        	<i class='glyphicon glyphicon-tag'></i>
        	帖子管理</a>
        </c:if>
        <c:if test="${admin.role!=3}">
        <a href="userList.action" class="list-group-item"
        <%if(request.getRequestURI().contains("user_")){out.print("class='list-group-item active'");}%> role="presentation"
        >
        	<i class='glyphicon glyphicon-user'></i>
        	用户管理</a>
        </c:if>
        <a href="adminEdit.action" class="list-group-item"
        <%if(request.getRequestURI().contains("admin_")){out.print("class='list-group-item active'");}%> role="presentation"
        >
        	<i class='glyphicon glyphicon-cog'></i>
        	修改密码</a>
        <a href="login.jsp" class="list-group-item"
        <%if(request.getRequestURI().contains("admin_")){out.print("class='list-group-item active'");}%> role="presentation"
        >
        	<i class='glyphicon glyphicon-paste'></i>
        	退出登陆</a>
    </div>
</body>

</html>