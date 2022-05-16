<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css"/>
<style>

</style>

<div class="container">
	<ul class="tab_title">
		<li><a href="/admin/admin_notice">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="/admin/admin_board?searchKey=all">게시판 관리</a></li>
		<li><a href="/admin/admin_adopt?searchKey=all">입양 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
		<li><a href="/admin/admin_boardReview?searchKey=all">게시판 리뷰 관리</a></li>
		<li><a href="#">동물병원 리뷰 관리</a></li>
	</ul>
	
	<div class="tab_content" >
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a>
		</div><br/><br/>
		<h3 style="margin-bottom:30px;">관리자페이지</h3>
		
		<div class="InfoCard">
			<h3>공지사항</h3>
			<a href="/admin/admin_notice">
				<div class="totalNum">
					<p>${vo.totalNoticeCnt}</p>
				</div>
			</a>
			<div class="subNum">
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
			</div>
		</div>
		
		<div class="InfoCard">
			<h3>게시판</h3>
			<a href="/admin/admin_board?searchKey=all">
			<div class="totalNum">
				<p>${vo.totalBoardCnt}</p>
			</div>
			</a>
			<div class="subNum">
				정보공유 : <a href="/admin/admin_board?searchKey=info">${vo.infoCnt}</a><br/>
				나눔 : <a href="/admin/admin_board?searchKey=share">${vo.shareCnt}</a><br/>
				산책 : <a href="/admin/admin_board?searchKey=walk">${vo.walkCnt}</a><br/>
				자랑 : <a href="/admin/admin_board?searchKey=boast">${vo.boastCnt}</a><br/>
				건의 : <a href="/admin/admin_board?searchKey=suggest">${vo.suggestCnt}</a><br/>
			</div>
		</div>
		
		<div class="InfoCard">
			<h3>입양</h3>
			<a href="/admin/admin_adopt?searchKey=all">
			<div class="totalNum">
				<p>${vo.totalAdoptCnt}</p>
			</div>
			</a>
			<div class="subNum">
				강아지 : <a href="/admin/admin_adopt?searchKey=강아지">${vo.dogAdoptCnt}</a><br/>
				고양이 : <a href="/admin/admin_adopt?searchKey=고양이">${vo.catAdoptCnt}</a><br/>
				파충류 | 양서류 : <a href="/admin/admin_adopt?searchKey=파충류,양서류">${vo.reptileAdoptCnt}</a><br/>
				조류 : <a href="/admin/admin_adopt?searchKey=조류">${vo.birdAdoptCnt}</a><br/>
				기타동물 : <a href="/admin/admin_adopt?searchKey=기타">${vo.etcAdoptCnt}</a><br/>
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
		
		<div class="InfoCard">
			<h3>리뷰(게시판)</h3>
			<a href="#">
			<div class="totalNum">
				<p>${vo.totalReplyCnt}</p>
			</div>
			</a>
			<div class="subNum">
				공지사항 : <a href="#">${vo.noticeReplyCnt}</a><br/>
				정보공유 : <a href="#">${vo.infoReplyCnt}</a><br/>
				나눔 : <a href="#">${vo.shareReplyCnt}</a><br/>
				산책 : <a href="#">${vo.walkReplyCnt}</a><br/>
				자랑 : <a href="#">${vo.boastReplyCnt}</a><br/>
				건의 : <a href="#">${vo.suggestReplyCnt}</a><br/>
				입양 : <a href="#">${vo.adoptReplyCnt}</a>
			</div>
		</div>
		
		<div class="InfoCard">
			<h3>리뷰(동물병원)</h3>
			<a href="/admin/admin_boardReview?searchKey=all">
			<div class="totalNum">
				<p>${vo.totalShopReviewCnt}</p>
			</div>
			</a>
			<div class="subNum">
			</div>
		</div>
		
	</div>

</div>