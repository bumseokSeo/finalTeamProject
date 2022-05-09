<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
</style>

<div class="container">
	<ul class="tab_title">
		<li>공지사항관리</li>
		<li>회원관리</li>
		<li>정보공유 게시판 관리</li>
		<li>나눔 게시판 관리</li>
		<li>자랑 게시판 관리</li>
		<li>입양 게시판 관리</li>
		<li>산책 게시판 관리</li>
		<li><a href="/admin/admin_animalInfo">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content" >
		관리자페이지
	</div>

</div>