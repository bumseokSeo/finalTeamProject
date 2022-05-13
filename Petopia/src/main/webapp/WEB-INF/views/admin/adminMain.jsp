<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css"/>
<style>

</style>

<div class="container">
	<ul class="tab_title">
		<li><a href="#">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="#">게시판 관리</a></li>
		<li><a href="#">입양 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content" >
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a>
		</div><br/><br/>
		<h3 style="margin-bottom:30px;">관리자페이지</h3>
		
		<div class="InfoCard">
			<h3>공지사항</h3>
			<a href="#">
			<div class="totalNum">
				<p>${vo.totalNoticeCnt}</p>
			</div>
			</a>
			<div class="subNum">
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
			</div>
		</div>
		
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
				<br/>
				<br/>
			</div>
		</div>
		
		<div class="InfoCard">
			<h3>게시판</h3>
			<a href="#">
			<div class="totalNum">
				<p>${vo.totalBoardCnt}</p>
			</div>
			</a>
			<div class="subNum">
				정보공유 : ${vo.infoCnt}<br/>
				나눔 : ${vo.shareCnt}<br/>
				산책 : ${vo.walkCnt}<br/>
				자랑 : ${vo.boastCnt}<br/>
				건의 : ${vo.suggestCnt}<br/>
			</div>
		</div>
		
		<div class="InfoCard">
			<h3>입양</h3>
			<a href="#">
			<div class="totalNum">
				<p>${vo.totalAdoptCnt}</p>
			</div>
			</a>
			<div class="subNum">
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
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
				강아지 : <a href="/admin/admin_animalInfo?searchKey=강아지">${vo.dogInfoCnt}</a><br/>
				고양이 : <a href="/admin/admin_animalInfo?searchKey=고양이">${vo.catInfoCnt}</a><br/>
				파충류 | 양서류 : <a href="/admin/admin_animalInfo?searchKey=파충류,양서류">${vo.reptileInfoCnt}</a><br/>
				조류 : <a href="/admin/admin_animalInfo?searchKey=조류">${vo.birdInfoCnt}</a><br/>
				기타동물 : <a href="/admin/admin_animalInfo?searchKey=기타">${vo.etcInfoCnt}</a><br/>
			</div>
		</div>
		
		
	</div>

</div>