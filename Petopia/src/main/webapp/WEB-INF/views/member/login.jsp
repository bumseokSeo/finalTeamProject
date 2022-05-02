<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css//login.css" type="text/css"/>

<div class="container">
	
	<form id="login_form">
		<div class="title_box">
			<span style="font-size:54px;">로그인</span>
			<br/>
			<span style="font-size:20px;">펫토피아에 오신 걸 환영합니다!</span>
			<br/>
		</div>
		<div class="bubble_box">
			<span>3초안에 빠른 회원가입</span>
		</div>
		<div class="kakao_box">
			<a href="#" class="btnKakao">
				<span>카카오톡으로 계속하기</span>
			</a>
		</div>
		<div class="or_box">
			<span>혹은</span>
		</div>
		<div class="form_box">
			<input type="text" id="userid" name="userid" placeholder="아이디">
			<input type="password" id="userpwd" name="userpwd" placeholder="비밀번호">
			<button type="button" id="btnLogin">로그인</button>
			
			<div class="loginUtil">
				<ul>
					<li>
						아직 회원이 아니신가요? <a href="/member/signUp">회원가입</a>
					</li>
					<li>
						아이디를 잊으셨나요? <a href="#">아이디찾기</a>
					</li>
					<li>
						비밀번호를 잊으셨나요? <a href="#">비밀번호찾기</a>
					</li>
				</ul>
			</div>
		</div>
		
	</form>
</div>
