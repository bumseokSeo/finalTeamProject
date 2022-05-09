<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/adopt/adoptWrite.css" type="text/css">
<script src="/js/board/boardWrite.js"></script>

<div class="container">
	<h1>입양 게시글 작성</h1>
	<form method="post" action="/board/adopt/adoptWriteOk" id="adoptFrm">
		<div class="form-group">
			<div>제목</div>
			<div><input type="text" name="title" id="adoptTitle"/></div>
			<div><textarea name="content" id="adoptContent"></textarea></div>
			<div class="adoptBtn">
				<input type="submit" id="adoptWrite" value="등록"/>
				<input type="button" id="adoptCancle" value="취소"/>
				<input type="button" id="adoptBack" value="리스트로 돌아가기"/>
			</div>
		</div>
	</form>
</div>