<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css"/>
<style>
.InfoCard{
	float:left; 
	width:30%; 
	padding:15px; 
	border:1px solid black;
	border-radius: 5px; 
	margin:15px;
}

.totalNum{
	float: right;
	background: #FF8500;
	border: 5px solid #FF6D00;
	border-radius: 100%;
	width: 100px;
	height: 100px;
	position: relative;
}
.totalNum>p{
	position: absolute;
	color: #fff;
	font-size: 36px;
	font-weight: 700;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
.subNum{
	margin-top: 30px;
	font-size: 18px;
}
</style>

<div class="container">
	<ul class="tab_title">
		<li><a href="#">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="#">정보공유 게시판 관리</a></li>
		<li><a href="#">나눔 게시판 관리</a></li>
		<li><a href="#">자랑 게시판 관리</a></li>
		<li><a href="#">입양 게시판 관리</a></li>
		<li><a href="#">산책 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content" >
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a>
		</div><br/><br/>
		<h3>관리자페이지</h3>
		<div class="InfoCard">
			<h3>회원</h3>
			<a href="/admin/admin_memberList">
				<div class="totalNum">
					<p>${vo.totalMemberCnt}</p>
				</div>
			</a>
			<div class="subNum">
				관리자 : <a href="/admin/admin_memberList?searchKey=userlevel&searchWord=1">${vo.level1MemberCnt}</a><br/>
				일반회원 : <a href="/admin/admin_memberList?searchKey=userlevel&searchWord=2">${vo.level2MemberCnt}</a><br/>
				정지 : <a href="/admin/admin_memberList?searchKey=userlevel&searchWord=3">${vo.level3MemberCnt}</a><br/>
			</div>
		</div>
		
		<div class="InfoCard">
			<h3>반려동물 정보</h3>
			<a href="/admin/admin_animalInfo?searchKey=all">
				<div class="totalNum">
					<p>${vo.totalAnimalInfoCnt}</p>
				</div>
			</a>
			<div class="subNum">
				강아지 : ${vo.dogInfoCnt}<br/>
				고양이 : ${vo.catInfoCnt}<br/>
				파충류 | 양서류 : ${vo.reptileInfoCnt}<br/>
				조류 : ${vo.birdInfoCnt}<br/>
				기타동물 : ${vo.etcInfoCnt}<br/>
			</div>
		</div>
	</div>

</div>