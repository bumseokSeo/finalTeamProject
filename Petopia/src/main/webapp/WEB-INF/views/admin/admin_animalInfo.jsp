<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function breedDelChk(breed){
	if(confirm("반려동물("+breed+") 정보를 삭제하시겠습니까?")) {
		location.href="/admin/breedDel?breedkey="+breed;
	}
}
</script>
<style>
	.container{
		height: auto;
		overflow:hidden;
	}
	.tab_title{
		float: left;
		width: 19%; 
	}
	.tab_content{
	 	float: right;
		width: 79%;
	}
	#animalInfoList{
		overflow: auto;
	}
	#animalInfoList>li{
		float: left;
		width: 20%;
		height: 40px;
		line-height: 40px;
	}
	#animalInfoList>li:nth-child(4n+2){
		width: 40%;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	#animalInfoList>li:nth-child(4n+1){
		padding-left: 15px;
	}
	#animalInfoList>li:nth-child(n+1):nth-child(-n+4) {
		border-bottom: 3px solid #ddd;
		background-color: rgba(205, 188, 171, 0.5);
		font-weight: bold;
	}
	.editBtn{
		background: #FF7900;
		border: #FF7900;
		font-size: 16px;
		font-weight: 700;
		color: #fff !important;
		padding:2px 15px;
	}
	.delBtn{
		background: gray;
		border: #FF7900;
		font-size: 16px;
		font-weight: 700;
		color: #fff !important;
		padding:2px 15px;
	}
</style>

<div class="container">
	<ul class="tab_title" style="">
		<li>공지사항관리</li>
		<li>회원관리</li>
		<li>정보공유 게시판 관리</li>
		<li>나눔 게시판 관리</li>
		<li>자랑 게시판 관리</li>
		<li>입양 게시판 관리</li>
		<li>산책 게시판 관리</li>
		<li><a href="/admin/admin_animalInfo">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content" style="">
		반려동물 정보 관리
		<div>
			<a href="/admin/admin_animalInfo_Write">글쓰기</a>
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
	</div>

</div>