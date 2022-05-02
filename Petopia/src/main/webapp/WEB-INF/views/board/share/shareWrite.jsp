<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/share/shareWrite.css" type="text/css"> 
<script src="/js/board/share/shareWrite.js"></script>
<div class="container">
	<h1>게시판</h1>
	<form method="post" action="/board/boardWriteOk" id="shareFrm">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="shareSubject"/></li>
			<li><textarea name="content" id="shareContent"></textarea></li>
			<li><input type="submit" value="등록"/></li>
		</ul>
	</form>
</div>