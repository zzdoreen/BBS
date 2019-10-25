<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>论坛首页</title>
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
	.total{
		font-size:13px;
	}
	.articleInfo .row{
		margin-top:15px;
		color: #777
	}
	.name {
		width:100%;
		overflow:hidden;
		display:inline-block;
		white-space:nowrap;
		text-overflow:ellipsis;
		cursor:default;
	}
	.article-title{
		display:inline-block;
		width:500px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	.search{
		margin-bottom:80px;
		margin-top:-80px;
		display:flex;
		justify-content:flex-end;
		margin-right:200px;
	}
	.search .search-value{
		width:300px;
		background:rgba(255,255,255,0.7);
	}
	.search .box{
		position:relative;
	}
	#search-btn{
		position:absolute;
		right:10px;
		line-height:35px;
	}
	#search-btn:hover{
		color:rgba(64, 109, 149, .8);
	}
</style>
<script>
	window.onload = function(){
		var oBtn = document.getElementById('search-btn')
		var oValue = document.getElementsByClassName('search-value')[0]	
		oBtn.onclick = function(){
				window.open('search.action#'+oValue.value,'_self')		
		}
		
	}
</script>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp" />
		<div class='cl'>
			<div>
				<div>
					<div class='search'>
						<div class='box'>
							<input type='search' class='search-value form-control '/>
							<i id='search-btn' class='glyphicon glyphicon-search'></i>
						</div>
					</div>	
						<c:forEach var="module" items="${moduleList}">
							<div class="container module">
								<div id="title">
									<span>${module.name}</span>
								</div>
								<c:forEach var="topic" items="${module.topicList}" varStatus="status">
								<div class="media article">
									<div style='float:left'>
										<a href="#">
											<img class="media-object" width="64px" height="64px" src="img/icon.png">
										</a>
									</div>
									<div class="media-body">
										<h4 class="media-heading">
											<a class="heading"
												href="topic.action?topic.id=${topic.id}">${topic.name}</a>
											<strong class='total' style="float: right">发帖总数: <span>${topic.postTotal}</span></strong>
										</h4>
										<div class="articleInfo">
											<a style='color:#777' href="post.action?post.id=${topic.lastPost.id}" class="article-title"
												title="最新发帖">${topic.lastPost.title}</a>
											<cite style='color:#777'>${topic.lastPost.systimes}</cite>
											<div class="row">
												<div class="col-xs-4">
													<div class="col-xs-4">
														<span class='name'>${topic.lastPost.user.nickname}</span>
													</div>
													<div class="col-xs-4">
														<span class="iconfont">&#xe7ac;</span>&nbsp;&nbsp;${topic.replyCount}
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
						</c:forEach>

					</div>
			</div>
		</div>
	</div>

</body>
</html>