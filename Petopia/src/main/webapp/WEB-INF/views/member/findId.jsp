<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/findid.css" type="text/css"/>
<style>
</style>
<script type="text/javascript">
	function formcheck(){
		var useremail = document.getElementById("useremail");
		if(useremail.value == ""){
			alert("이메일을 입력해주세요.");
			useremail.focus();
			return false;
		}
		
		return true;
	}
</script>


<div class="container">
	<form id="form" method="post" action="${url}/member/findIdOk" onsubmit="return formcheck()">
		<div class="title_box">
			<span style="font-size:54px;">아이디 찾기</span>
			<br/>
		</div>
		<div class="form_box">
			<span class="menuName">이메일</span><br/>
			<input class="inputStyle" type='text' name='useremail' id='useremail' placeholder='가입한 이메일을 입력해주세요'/>
			<input type="submit" id="btnFindId" value="아이디 찾기"></input>
			
			
			
		</div>
		<div class="findIdBottom">
			<div>
				<a href="/member/resetPwd" title="비밀번호 찾기" >비밀번호 찾기</a>
			</div>
			<div>
				<a href="/member/signUp" title="회원가입">회원가입</a>
			</div>
		</div>
	</form>
</div>