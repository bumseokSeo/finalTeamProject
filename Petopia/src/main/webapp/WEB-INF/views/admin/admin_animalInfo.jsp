<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/admin_animalInfo.css" type="text/css"/>

<script>
function breedDelChk(breed){
	if(confirm("반려동물("+breed+") 정보를 삭제하시겠습니까?")) {
		location.href="/admin/breedDel?breedkey="+breed;
	}
}
</script>

<div class="container">
	<ul class="tab_title">
		<li><a href="#">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="#">게시판 관리</a></li>
		<li><a href="#">입양 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content">
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a> > <a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a>
		</div><br/><br/>
		<h3>반려동물 정보 관리</h3>
		<div style="margin-bottom: 80px;">
			<div class="writeBtn">
				<a href="/admin/admin_animalInfo_Write">글쓰기</a>
			</div>
			<div id="searchDiv">
				<form method="get" action="${url}/admin/admin_animalInfo" id="searchForm">
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
		
		
		<ul id="animalInfoList">
			<li>category</li>
			<li>breed</li>
			<li>edit</li>
			<li>delete</li>
			
			<c:forEach var="vo" items="${list }">
				<li>${vo.category }</li>
				<li><a href="/animalInfo/animalInfoSub?breedkey=${vo.breed}">${vo.breed }</a></li>
				<li><a class="editBtn" href="/admin/admin_animalInfo_Edit?breedkey=${vo.breed}">수정</a></li>
				<li><a class="delBtn" href="javascript:breedDelChk('${vo.breed}')">삭제</a></li>
			</c:forEach>
		</ul>
		
		<ul class="paging">
			<!-- 이전페이지 -->
			<c:if test="${apVO.pageNum==1}">
				<li>이전</li>
			</c:if>
			<c:if test="${apVO.pageNum>1}">
				<li><a href="${url}/admin/admin_animalInfo?pageNum=${apVO.pageNum-1}&searchKey=${apVO.searchKey}<c:if test='${apVO.searchWord!=null}'>&searchWord=${apVO.searchWord}</c:if>">이전</a></li>
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
					<a href="${url}/admin/admin_animalInfo?pageNum=${p}&searchKey=${apVO.searchKey}<c:if test='${apVO.searchWord!=null}'>&searchWord=${apVO.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음페이지 -->
			<c:if test="${apVO.pageNum==apVO.totalPage}">
				<li>다음</li>
			</c:if>
			<c:if test="${apVO.pageNum<apVO.totalPage}">
				<li><a href="${url}/admin/admin_animalInfo?pageNum=${apVO.pageNum+1}&searchKey=${apVO.searchKey}<c:if test='${apVO.searchWord!=null}'>&searchWord=${apVO.searchWord}</c:if>">다음</a></li>
			</c:if>
		</ul>
	</div>

</div>