<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#signUp_form{
	margin: 0 auto;
	width: 550px;
}

.title_box{
	margin: 50px 0 30px;
	text-align: center;
	font-size: 32px;
}

.form_box{
	margin: 0 auto 30px;
	width: 90%;
	
}

.menuName{
	display:inline-block;
	width:100%;
	margin-top:35px;
	margin-bottom: 10px;
	font-size:1.1em;
	color: #2F4858;
	font-weight: 600;
}
.inputStyle{
	background-color:inherit;
	border:none;
	border-bottom:1px solid #2F4858;
	box-sizing:border-box;
	height:30px;
	width:70%;
}
#checkBtn{
	float: right;
	width: 120px;
	height:30px;
	border: none;
}

.btn_box{
	width: 90%;
	margin: 15px auto 50px;
}
#loginBtn{
	width: 100%;
	background: #FF7900;
	border: #FF7900;
	height: 46px;
	line-height: 44px;
	font-size: 16px;
	font-weight: 700;
	color: #fff;
}
</style>

<div class="container">
	<form id="signUp_form">
		<div class="title_box">
			<span style="font-size:54px;">회원가입</span>
			<br/>
		</div>
		<div class="form_box">
			<span class="menuName">아이디</span><br/>
			<input class="inputStyle" type='text' name='userid' id='userid' placeholder='아이디 입력'/>
			<button id="checkBtn">중복확인</button><br/>
			
			<span class="menuName">닉네임</span><br/>
			<input class="inputStyle" type='text' name='username' id='username' placeholder='닉네임 입력'/>
			<button id="checkBtn">중복확인</button><br/>
			
			<span class="menuName">비밀번호</span><br/>
			<input class="inputStyle" type='password' name='userpwd' id='userpwd' placeholder='비밀번호 입력'/><br/>
			
			<span class="menuName">비밀번호 확인</span><br/>
			<input class="inputStyle" type='password' name='userpwd' id='userpwd2' placeholder='비밀번호 확인'/><br/>
			
			<span class="menuName">이메일</span><br/>
			<input class="inputStyle" type='text' name='useremail' id='useremail' placeholder='이메일 입력'/>
			<button id="checkBtn">중복확인</button><br/>
			
			<span class="menuName">휴대전화</span><br/>
			<input class="inputStyle" type='text' name='tel' id='tel' placeholder='전화번호 입력'/>
			<button id="checkBtn">인증요청</button><br/>
		</div>
		<div class="agree_box">
			<span>모두 동의합니다</span><br/>
			<span>이용약관 동의</span><br/>
			<span>개인정보 취급방침 동의</span>
		</div>
		<div class="btn_box">
			<button type="button" id="loginBtn">회원가입</button>
		</div>
	</form>
</div>