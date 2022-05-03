<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/share/shareWrite.css" type="text/css"> 
<script src="/js/board/share/shareWrite.js"></script>
<div class="container">
	<h1>나눔게시판 글 작성</h1>
	<form method="post" action="/board/share/shareWriteOk" id="shareFrm">
		<div class="form-group">
			<div>제목</div>
			<div><input type="text" name="title" id="shareTitle"/></div>
			<div><textarea name="content" id="shareContent"></textarea></div>
			<div class="shareBtn">
				<input type="submit" id="shareWrite" value="등록"/>
				<input type="button" id="shareCancle" value="취소"/>
				<input type="button" id="shareBack" value="리스트로 돌아가기"/>
			</div>
		</div>
	</form>
</div>