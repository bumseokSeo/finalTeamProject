<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/share/shareList.css" type="text/css"/>

<div class="container">
	<h1 class="Share_logo">입양게시판</h1>
	<div>총 페이지 수: ${pvo.totalPage }</div>
	<div>총 게시글 수: ${pvo.totalRecord }</div>
	<div class="row Share_top">
		<c:forEach var="listVo" items="${adoptList}">
		<div class="col-sm-3 Share">
			<div class="card Share_group">
				<a href="/board/notice/noticeView?boardno=${listVo.boardno}"><img src="/img/Logo(main).png"></a>
				<div class="card-body">
					<div class="card-title Share_title">${listVo.title }</div>
					<div class="card-text Share_content">
						<label class="Share_text">${listVo.userid }</label> 
						<label class="Share_text">${listVo.writedate }</label>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<div class="Share_btn"><a href="/board/adopt/adoptWrite"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Share_search">
		<select name="searchWord">
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
			<c:if test="${pvo.currentPage==1}">
				<li class="page-item" style="display:none"><i class="fa fa-angle-left"></i></li>
			</c:if>
			<c:if test="${pvo.currentPage>1}">
				<li class="page=item"><a href="${url }/board/share/shareList?currentPage=${pvo.currentPage-1 }"><i class="fa fa-angle-left"></i></a>
			</c:if>
			<!-- 페이지번호 -->
			<c:forEach var="p" begin="${pvo.startPage }" end="${pvo.totalPage }">
				<c:if test="${p<=pvo.totalPage}">
					<c:choose>
						<c:when test="${p==pvo.currentPage}">
							<li class="page-item disabled"><a>${p}</a></li>
						</c:when>
						<c:when test="${p!=pvo.currentPage}">
							<li class="page-item"><a href="${url }/board/share/shareList?currentPage=${p}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>	
			<!-- 다음페이지 -->
			<c:if test="${pvo.currentPage==pvo.totalPage }">
				<li class="page-item" style="display:none"><i class="fa fa-angle-right"></i></li>
			</c:if>
			<c:if test="${pvo.currentPage<pvo.totalPage }">
				<li><a href="${url }/board/share/shareList?currentPage=${pvo.currentPage+1}"><i class="fa fa-angle-right"></i></a>
			</c:if>
			
		</ul>
	</div>
</div>
<br/>