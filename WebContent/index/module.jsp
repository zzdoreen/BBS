<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>${module.name}</title>
<link rel="stylesheet" href="fonts/iconfont.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<style>
.cl {
		margin-top: 170px !important;
	}
	.module{
		padding:50px;
		padding-top:10px;
		margin-bottom:40px;
		border-radius:5px;
		box-shadow:0 0 5px #ccc
	}
	#title {
		height: 50px;
		line-height: 50px;
		font-size: 20px;
		margin-bottom:20px;
	}

	#title span {
		padding-left: 25px;
	}

	#title::before {
		content: ' ';
		display: inline-block;
		position: absolute;
		width: 15px;
		height: 50px;
		background: rgba(64, 109, 149, .8);
	}

	#title::after {
		content: ' ';
		display: block;
		width: 100%;
		height: 1px;
		border-bottom: dashed rgba(64, 109, 149, .8) 1.5px;
		
	}
	.article{
		margin-bottom: 20px;
		padding:0 10px;
	}
	.articleInfo{
		margin-top: 30px;
		padding-left:10px;
	}
	.post-title{
		color: #777;
		width:70%;
		display:inline-block;
		overflow:hidden;
	}
	.total{
		font-size:13px;
	}
	.articleInfo .row{
		margin-top:15px;
		color: #777
	}
	.heading{
		margin-left:15px;
	}
	.article-title{
		display:inline-block;
		width:500px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	.name {
		width:100%;
		overflow:hidden;
		display:inline-block;
		white-space:nowrap;
		text-overflow:ellipsis;
		cursor:default;
	}
</style>
<body>
    <div id="wrap">
        <jsp:include page="header.jsp" />
        <div class='cl'>
            <div>
                <div>
                    <div class="container module">
                        <div id="title">
                            <span>${module.name}</span>
                        </div>
                        <c:forEach var="topic" items="${topicList}" varStatus="status">
                            <div class="media article">
                                <div style='float:left'>
                                    <a href="#">
                                        <img class="media-object" width="64px" height="64px" src="img/icon.png">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a class="heading" href="topic.action?topic.id=${topic.id}">${topic.name}</a>
                                        <strong class='total' style="float: right">发帖总数:
                                            <span>${topic.postTotal}</span></strong>
                                    </h4>
                                    <div class="articleInfo">
                                        <a href="post.action?post.id=${topic.lastPost.id}"
                                            class="article-title" title="最新发帖">${topic.lastPost.title}</a>
                                        <cite style='color:#777'>${topic.lastPost.systimes}</cite>
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <div class="col-xs-4">
                                                    <span class='name'>${topic.lastPost.user.nickname}</span>
                                                </div>
                                                <div class="col-xs-4">
                                                    <span
                                                        class="iconfont">&#xe7ac;</span>&nbsp;&nbsp;${topic.replyCount}
                                                </div>
                                                <div class="col-xs-4">
                                                    <span class="iconfont">&#xe64c;</span>&nbsp;&nbsp;${topic.viewCount}
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
        <div>
        </div>
    </div>
</body>
</html>