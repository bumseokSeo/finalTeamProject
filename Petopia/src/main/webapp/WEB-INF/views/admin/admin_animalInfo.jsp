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
	a{ 
		text-decoration:none !important;
	}
	a:hover{ 
		text-decoration:none !important;
	}
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
	
	.tab_title>li{
		width: 200px;
		min-width: 200px !important;
		padding: 10px;
		background: rgba(255, 121, 0, 0.6);
	}
	.tab_title>li>a{
		color: rgba(255, 255, 255);  
		font-size: 16px;
		font-weight: 600;
	}
	
	.tab_title>li:hover{ 
		background: rgba(255, 146, 0, 1);
		color: black !important;
	}
	.tab_title>li:hover a{
		color: black !important;
		font-size: 18px;
	}
	
	#animalInfoList{
		overflow: auto;
		list-style-type: none;
		padding-left: 0px;
	}
	#animalInfoList>li{
		float: left;
		width: 15%;
		height: 40px;
		line-height: 40px;
		list-style-type: none;
		border-bottom: 1px solid #ddd;
	}
	#animalInfoList>li:nth-child(4n+2){
		width: 50%;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	#animalInfoList>li:nth-child(4n+1){
		width: 20%;
		padding-left: 15px;
	}
	#animalInfoList>li:nth-child(n+1):nth-child(-n+4) {
		border-bottom: 3px solid #ddd;
		background-color: rgba(205, 188, 171, 0.5);
		font-weight: bold;
	}
	#animalInfoList>li:nth-child(4n+3),
	#animalInfoList>li:nth-child(4n){
		text-align: center;
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
	
	.writeBtn{
		width: 80px;
		background-color: #ff6d00;
		text-align: center;
		border-radius: 5px;
		padding: 5px;
		margin:15px 0px;
	}
	.writeBtn>a{
		color: #fff;
		font-weight: 700;
	}
	.writeBtn:hover a{
		color: #fff;
	}
	
</style>

<div class="container">
	<ul class="tab_title">
		<li><a href="#">공지사항관리</a></li>
		<li><a href="#">회원관리</a></li>
		<li><a href="#">정보공유 게시판 관리</a></li>
		<li><a href="#">나눔 게시판 관리</a></li>
		<li><a href="#">자랑 게시판 관리</a></li>
		<li><a href="#">입양 게시판 관리</a></li>
		<li><a href="#">산책 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content">
		<h3>반려동물 정보 관리</h3>
		<div class="writeBtn">
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