<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	<div class="tab_content" >
		<h3>관리자페이지</h3>
	</div>

</div>