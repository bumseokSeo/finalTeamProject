<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/notice/noticeList.css" type="text/css"/>
<div class="container">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">공지 사항</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_F">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
		</ul><!-- 게시물 -->
	</div>
		
		<div class="Share_btn"><a href="/board/notice/noticeWrite"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
		<br/><br/><br/>
		<div class="Share_search">
			<select>
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="userid">글쓴이</option>
			</select>
			<input type="text" id="share_search"/>
			<input type="button" value="검색"/>
		</div>
		<br/><br/>
		<div class="Share_paging">
			<ul>
				<a href="#"><li>이전</li></a>
				<a href="#"><li>1</li></a>
				<a href="#"><li>2</li></a>
				<a href="#"><li>3</li></a>
				<a href="#"><li>4</li></a>
				<a href="#"><li>5</li></a>
				<a href="#"><li>다음</li></a>
			</ul>
		</div>
</div>
<br/>