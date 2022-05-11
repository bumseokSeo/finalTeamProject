<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/notice/noticeList.css" type="text/css"/>
<script>
</script>
<div class="container">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">공지 사항</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_F">
			<li>게시물 번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			
			<c:forEach var="listVo" items="${noticeList}">
				<li>${listVo.boardno}</li>
				<li><a href="/board/notice/noticeView?boardno=${listVo.boardno}">${listVo.title}</a></li>
				<li>${listVo.writedate}</li>
				<li>${listVo.hit}</li>
			</c:forEach>
			
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
		<!-- 페이징 -->
	<div class="Share_paging">
		<ul>
			<c:if test="${pVO2.currentPage==1}">
				<li class="page-item" style="display:none"><i class="fa fa-angle-left"></i></li>
			</c:if>
			<c:if test="${pVO2.currentPage>1}">
				<li class="page=item"><a href="${url}/board/SubMenuSelect?type=notice&currentPage=${pVO2.currentPage-1 }"><i class="fa fa-angle-left"></i></a>
			</c:if>
			<!-- 페이지번호 -->
			<c:forEach var="p" begin="${pVO2.startPage }" end="${pVO2.totalPage }">
				<c:if test="${p<=pVO2.totalPage}">
					<c:choose>
						<c:when test="${p==pVO2.currentPage}">
							<li class="page-item disabled"><a>${p}</a></li>
						</c:when>
						<c:when test="${p!=pVO2.currentPage}">
							<li class="page-item"><a href="${url }/board/SubMenuSelect?type=notice&currentPage=${p}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>	
			<!-- 다음페이지 -->
			<c:if test="${pVO2.currentPage==pVO2.totalPage }">
				<li class="page-item" style="display:none"><i class="fa fa-angle-right"></i></li>
			</c:if>
			<c:if test="${pVO2.currentPage<pVO2.totalPage }">
				<li><a href="${url}/board/SubMenuSelect?type=notice&currentPage=${pVO2.currentPage+1}"><i class="fa fa-angle-right"></i></a>
			</c:if>
			
		</ul>
	</div>
</div>
<br/>