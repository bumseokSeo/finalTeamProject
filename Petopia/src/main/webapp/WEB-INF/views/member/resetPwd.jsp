<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/member/resetPwd.css" type="text/css"/>
<style>
</style>
<script type="text/javascript">
	function formcheck(){
		console.log("???????????");
		var userid = document.getElementById("userid");
		if(userid.value == ""){
			alert("아이디를 입력해주세요.");
			userid.focus();
			return false;
		}
		
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
	<form id="form" method="post" action="${url}/member/findpw" onsubmit="return formcheck()">
		<div class="title_box">
			<span style="font-size:54px;">비밀번호 찾기</span>
			<br/>
		</div>
		<div class="form_box">
			<span class="menuName">아이디</span><br/>
			<input class="inputStyle" type='text' name='userid' id='userid' placeholder='아이디를 입력해주세요'/>
			<span class="menuName">이메일</span><br/>
			<input class="inputStyle" type='text' name='useremail' id='useremail' placeholder='가입한 이메일을 입력해주세요'/>
			<input type="submit" id="btnFindPwd" value="비밀번호 초기화"></input>
			
			
			
		</div>
		<div class="findPwdBottom">
			<div>
				<a href="/member/findId" title="아이디 찾기" >아이디 찾기</a>
			</div>
			<div>
				<a href="/member/signUp" title="회원가입">회원가입</a>
			</div>
		</div>
	</form>
</div>