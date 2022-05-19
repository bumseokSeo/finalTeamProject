<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/admin_adopt.css" type="text/css"/>

<script>
function adoptDelChk(boardno){
	if(confirm("게시물("+boardno+") 정보를 삭제하시겠습니까?")) {
		location.href="/admin/adoptDel?boardno="+boardno;
	}
}
</script>

<div class="container">
	<ul class="tab_title">
		<li><a href="/admin/admin_notice">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="/admin/admin_board?searchKey=all">게시판 관리</a></li>
		<li><a href="/admin/admin_adopt?searchKey=all">입양 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
		<li><a href="/admin/admin_boardReview?searchKey=all">게시판 리뷰 관리</a></li>
		<li><a href="/admin/admin_shopReview?searchKey=all">동물병원 리뷰 관리</a></li>
	</ul>
	
	<div class="tab_content">
		<ul class="tab_title2" >
			<li style="float: left;"><a href="/admin/admin_notice">공지사항</a></li>
			<li><a href="/admin/admin_memberList">회원</a></li>
			<li><a href="/admin/admin_board?searchKey=all">게시판</a></li>
			<li><a href="/admin/admin_adopt?searchKey=all">입양</a></li>
			<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보</a></li>
			<li><a href="/admin/admin_boardReview?searchKey=all">게시판 리뷰</a></li>
			<li><a href="/admin/admin_shopReview?searchKey=all">동물병원 리뷰</a></li>
		</ul>
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a> > <a href="/admin/admin_adopt?searchKey=all">입양 게시판 관리</a>
		</div><br/><br/>
		<h3>입양 게시판 관리</h3>
		<div style="margin-bottom: 80px;">
			<div id="searchDiv">
				<div style="float:left; line-height:34px; margin-right:20px;">
					<a href="/admin/admin_adopt?searchKey=all">전체</a>&nbsp;
					<a href="/admin/admin_adopt?searchKey=강아지">강아지</a>&nbsp;
					<a href="/admin/admin_adopt?searchKey=고양이">고양이</a>&nbsp;
					<a href="/admin/admin_adopt?searchKey=파충류,양서류">파충류|양서류</a>&nbsp;
					<a href="/admin/admin_adopt?searchKey=조류">조류</a>&nbsp;
					<a href="/admin/admin_adopt?searchKey=기타">기타동물</a>&nbsp;
				</div>
				<form style="float:left;" method="get" action="${url}/admin/admin_adopt" id="searchForm">
					<select class="searchKey" name="searchKey">
						<option value="all">전체</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
						<option value="파충류,양서류">파충류|양서류</option>
						<option value="조류">조류</option>
						<option value="기타">기타</option>
					</select>
		        	<input class="searchWord" type="search" placeholder="검색하기" aria-label="Search" id="searchWord" name="searchWord">
		        	<input type="submit" value="검색" class="searchBtn" id="searchBtn">
		    	</form>
			</div>
		</div>
		
		
		<ul id="adoptList">
			<li>분류</li>
			<li>품종</li>
			<li>번호</li>
			<li>제목</li>
			<li>아이디</li>
			<li>조회수</li>
			<li>좋아요</li>
			<li>작성일</li>
			<li>관리</li>
			
			<c:forEach var="vo" items="${list }">
				<li>${vo.category }</li>
				<li>${vo.breed }</li>
				<li>${vo.boardno }</li>
				<li><a href="/board/boardView?boardno=${vo.boardno}">${vo.title }</a></li>
				<li>${vo.userid }</li>
				<li>${vo.hit }</li>
				<li>${vo.likes }</li>
				<li>${vo.writedate }</li>
				<li><a class="delBtn" href="javascript:adoptDelChk('${vo.boardno}')">삭제</a></li>
			</c:forEach>
		</ul>
		
		<ul class="paging">
			<!-- 이전페이지 -->
			<c:if test="${apVO.pageNum==1}">
				<li>이전</li>
			</c:if>
			<c:if test="${apVO.pageNum>1}">
				<li><a href="${url}/admin/admin_adopt?pageNum=${apVO.pageNum-1}&searchKey=${apVO.searchKey}<c:if test='${apVO.searchWord!=null}'>&searchWord=${apVO.searchWord}</c:if>">이전</a></li>
			</c:if>
			<!-- 페이지번호 -->
			<c:forEach var="p" begin="${apVO.startPage}" end="${apVO.startPage+apVO.onePageCount-1}">
				<!-- 총페이지수보다 출력할 페이지 번호가 작을때 -->
				<c:if test="${p<=apVO.totalPage}">
					<c:if test="${p==apVO.pageNum}">
						<li class="now">
					</c:if>
					<c:if test="${p!=apVO.pageNum}">
						<li>
					</c:if>
					<a href="${url}/admin/admin_adopt?pageNum=${p}&searchKey=${apVO.searchKey}<c:if test='${apVO.searchWord!=null}'>&searchWord=${apVO.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음페이지 -->
			<c:if test="${apVO.pageNum==apVO.totalPage}">
				<li>다음</li>
			</c:if>
			<c:if test="${apVO.pageNum<apVO.totalPage}">
				<li><a href="${url}/admin/admin_adopt?pageNum=${apVO.pageNum+1}&searchKey=${apVO.searchKey}<c:if test='${apVO.searchWord!=null}'>&searchWord=${apVO.searchWord}</c:if>">다음</a></li>
			</c:if>
		</ul>
	</div>

</div>