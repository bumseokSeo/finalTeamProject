<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/memberEdit.css" type="text/css"/>
<script>

</script>
<style>
</style>

<div class="container">
	<form id="signUp_form">
		<div class="title_box">
			<span style="font-size:54px;">회원정보 수정</span>
			<br/>
		</div>
		<div class="form_box">
			<span class="menuName">아이디</span><br/>
			<input class="inputStyle" type='text' name='userid' id='userid' placeholder='아이디 입력'/>
			<br/>
			
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
			
		</div>
		
		<div class="btn_box">
			<input type="reset" id="resetBtn" value="취소하기"></input>
			<input type="submit" id="memberEditBtn" value="정보수정"></input>
			
		</div>
	</form>
</div>