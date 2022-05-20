<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/findid.css" type="text/css"/>
<style>
</style>
<script type="text/javascript">
</script>


<div class="container">
	<div id="form">
		<div class="title_box">
			<span style="font-size:54px;">아이디 찾기</span>
			<br/>
		</div>
		<img alt="" src="${url}/img/check.png" id="check">
			<div class="box">
				<span class="content">찾은 아이디는</span><br/>
				<span class="content"><b>${tempUserId}</b> 입니다.</span><br/>
			<div class="info">
			개인정보 보호를 위해 아이디의 일부만 보여집니다.<br>
			아이디 찾기에 어려움이 있다면 관리자에게 문의해주세요.
		</div>
			
			
			
		</div>
		<div class="findIdBottom">
			<div>
				<a href="/member/resetPwd" title="비밀번호 찾기" >비밀번호 찾기</a>
			</div>
			<div>
				<a href="/member/login" title="로그인">로그인</a>
			</div>
		</div>
	</div>
</div>