<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/member/signUp.css" type="text/css"/>


<script>

// 아이디 중복검사
function idCheckInit(){
	var error = document.querySelectorAll('.msgError');
	error[0].style.display = "none";
	if($("#idCheckResult").val()=="1") {
		$("#idCheckResult").val("0");
	}
}
function idCheck(){
	var error = document.querySelectorAll('.msgError');
	var reg = /^[a-z0-9]{5,20}$/;
	var url = '/member/idCheck';
	$.ajax({
		type: 'get',
		dataType: 'text',
		url: url,
		data: {
			'id':$("#userid").val()
		},
		success: function(result){
			
			if($("#userid").val()==''){
				error[0].innerHTML = "아이디를 입력하세요.";
				error[0].style.display = "block";
				error[0].style.color = "red";
				$("#userid").focus();
			}else if(!reg.test($("#userid").val())){
				error[0].innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
			   	error[0].style.display = "block";
				error[0].style.color = "red";
			    $("#userid").focus();
			}else if(result>=1){
				error[0].innerHTML = "아이디가 중복되었습니다.";
				error[0].style.display = "block";
				error[0].style.color = "red";
				$("#idCheckResult").val("0");
			}else{
				if(!$("#userid").val()==''){
					error[0].innerHTML = "사용가능한 아이디입니다.";
					error[0].style.display = "block";
					error[0].style.color = "green";
					$("#idCheckResult").val("1");
				}
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}

// 닉네임 중복검사
function nameCheckInit(){
	var error = document.querySelectorAll('.msgError');
	error[1].style.display = "none";
	if($("#nameCheckResult").val()=="1") {
		$("#nameCheckResult").val("0");
	}
}
function nameCheck(){
	var error = document.querySelectorAll('.msgError');
	var reg = /^[가-힣a-zA-Z0-9]{2,16}$/;
	var url = '/member/nameCheck';
	$.ajax({
		type: 'get',
		dataType: 'text',
		url: url,
		data: {
			'name':$("#username").val()
		},
		success: function(result){
			if($("#username").val()==''){
				error[1].innerHTML = "닉네임을 입력하세요.";
				error[1].style.display = "block";
				error[1].style.color = "red";
				$("#username").focus();
			}else if(!reg.test($("#username").val())){
				error[1].innerHTML = "2~16자 한글과 영문 대 소문자를 사용하세요.";
				error[1].style.display = "block";
				error[1].style.color = "red";
				$("#username").focus();
			}else if(result>=1){
				error[1].innerHTML = "닉네임이 중복되었습니다.";
				error[1].style.display = "block";
				error[1].style.color = "red";
				$("#nameCheckResult").val("0");
			}else{
				if(!$("#username").val()==''){
					error[1].innerHTML = "사용가능한 닉네임입니다.";
					error[1].style.display = "block";
					error[1].style.color = "green";
					$("#nameCheckResult").val("1");
				}
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}

//이메일 중복검사
function emailCheckInit(){
	var error = document.querySelectorAll('.msgError');
	error[4].style.display = "none";
	if($("#emailCheckResult").val()=="1") {
		$("#emailCheckResult").val("0");
	}
}
function emailCheck(){
	var error = document.querySelectorAll('.msgError');
	var reg = /^\w{6,12}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
	var url = '/member/emailCheck';
	$.ajax({
		type: 'get',
		dataType: 'text',
		url: url,
		data: {
			'email':$("#useremail").val()
		},
		success: function(result){
			if($("#useremail").val()==''){
				error[4].innerHTML = "이메일을 입력하세요.";
		        error[4].style.display = "block";
		        error[4].style.color = "red";
		        $("#useremail").focus();
			}else if(!reg.test($("#useremail").val())){
				error[4].innerHTML = "이메일을 확인해주세요.";
				error[4].style.display = "block";
				error[4].style.color = "red";
		        $("#useremail").focus();
			}else if(result>=1){
				error[4].innerHTML = "이메일이 중복되었습니다.";
				error[4].style.display = "block";
				error[4].style.color = "red";
				$("#emailCheckResult").val("0");
			}else{
				if(!$("#useremail").val()==''){
					error[4].innerHTML = "사용가능한 이메일입니다.";
					error[4].style.display = "block";
					error[4].style.color = "green";
					$("#emailCheckResult").val("1");
				}
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}

// 휴대전화 중복검사&인증
function telCheckInit(){
	var error = document.querySelectorAll('.msgError');
	error[5].style.display = "none";
	error[6].style.display = "none";
	if($("#telCheckResult").val()=="1") {
		$("#telCheckResult").val("0");
	}
	if($("#smsCheckResult").val()=="0") {
		$("#smsCheckResult").val("1");
	}
}
function telCheck() {
	var error = document.querySelectorAll('.msgError');
	var reg = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;
	var url = '/member/telCheck';
	$.ajax({
		type: 'get',
		dataType: 'text',
		url: url,
		data: {
			'tel':$("#tel").val()
		},
		success: function(result){
			if($("#tel").val()==''){
				error[5].innerHTML = "전화번호를 입력하세요.";
		        error[5].style.display = "block";
		        error[5].style.color = "red";
		        $("#tel").focus();
			}else if(!reg.test($("#tel").val())){
				error[5].innerHTML = "전화번호을 확인해주세요. '-'없이 숫자만 입력해주세요.";
				error[5].style.display = "block";
				error[5].style.color = "red";
		        $("#tel").focus();
			}else if(result>=1){
				error[5].innerHTML = "전화번호가 중복되었습니다.";
				error[5].style.display = "block";
				error[5].style.color = "red";
				$("#telCheckResult").val("0");
			}else{
				if(!$("#tel").val()==''){
					error[5].innerHTML = "사용가능한 전화번호입니다.";
					error[5].style.display = "block";
					error[5].style.color = "green";
					$("#telCheckResult").val("1");
				}
			}
		},
		error: function(e){
			console.log(e.responseText);
		}
	});
}
function smsCheck() {
	var error = document.querySelectorAll('.msgError');
	if($("#telCheckResult").val()=="0"){
		alert("휴대전화 중복검사를 해주세요.");
		return false;
	}else{
		$(".form_box>div[class='smsCheck']").eq(0).show();
		alert('인증번호 발송 완료!');
		
		$.ajax({
			type: "get",
			url: "/member/smsCheck",
			data: {
				'tel':$("#tel").val()
			},
			success: function(res){
				$('#smsConfirm').click(function(){
					if($.trim(res) == $("#telCheckNumber").val()){
						error[6].innerHTML = "휴대전화 인증이 정상적으로 완료되었습니다.";
						error[6].style.display = "block";
						error[6].style.color = "green";
						$("#smsCheckResult").val("1");
					}else{
						error[6].innerHTML = "인증번호가 올바르지 않습니다.";
						error[6].style.display = "block";
						error[6].style.color = "red";
						$("#smsCheckResult").val("0");
					}
				});
			}
		});
	}
}


// 유효성검사
$(()=>{
	var error = document.querySelectorAll('.msgError');
	$("#signUp_form").submit(function(){
		
		//아이디 유효성검사
		var reg = /^[a-z0-9]{5,20}$/;
		if($("#userid").val()==''){
			error[0].innerHTML = "아이디를 입력하세요.";
			error[0].style.display = "block";
			error[0].style.color = "red";
			$("#userid").focus();
			return false;
		}else if(!reg.test($("#userid").val())){
			error[0].innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
		   	error[0].style.display = "block";
			error[0].style.color = "red";
		    $("#userid").focus();
		    return false;
		}else{
			error[0].style.display = "none";
		}
		
		if($("#idCheckResult").val()=="0"){
			alert("아이디 중복검사를 해주세요.");
			return false;
		}
		
		// 닉네임 유효성검사
		reg = /^[가-힣a-zA-Z0-9]{2,16}$/;
		if($("#username").val()==''){
			error[1].innerHTML = "닉네임을 입력하세요.";
			error[1].style.display = "block";
			error[1].style.color = "red";
			$("#username").focus();
			return false;
		}else if(!reg.test($("#username").val())){
			error[1].innerHTML = "2~16자 한글과 영문 대 소문자를 사용하세요.";
			error[1].style.display = "block";
			error[1].style.color = "red";
			$("#username").focus();
			return false;
		} else{
			error[1].style.display = "none";
		}
		
		if($("#nameCheckResult").val()=="0"){
			alert("닉네임 중복검사를 해주세요.");
			return false;
		}
		
		
		// 비밀번호 유효성검사
		reg = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/;
		if($("#userpwd").val()==''){
			error[2].innerHTML = "비밀번호를 입력하세요.";
	        error[2].style.display = "block";
	        error[2].style.color = "red";
	        $("#userpwd").focus();
	        return false;
		}else if(!reg.test($("#userpwd").val())){
			error[2].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
			error[2].style.display = "block";
			error[2].style.color = "red";
	        $("#userpwd").focus();
	        return false;
		}else{
			error[2].style.display = "none";
		}
		
		// 비밀번호 확인 유효성검사
		if($("#userpwd").val() != $("#userpwd2").val()){
			error[3].innerHTML = "비밀번호가 일치하지 않습니다.";
			error[3].style.display = "block";
			error[3].style.color = "red";
			return false;
		}else{
			error[3].style.display = "none";
		}
		
		// 이메일 유효성검사
		reg = /^\w{5,20}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
		if($("#useremail").val()==''){
			error[4].innerHTML = "이메일을 입력하세요.";
	        error[4].style.display = "block";
	        error[4].style.color = "red";
	        $("#useremail").focus();
	        return false;
		}else if(!reg.test($("#useremail").val())){
			error[4].innerHTML = "이메일을 확인해주세요.";
			error[4].style.display = "block";
			error[4].style.color = "red";
	        $("#useremail").focus();
	        return false;
		}else{
			error[4].style.display = "none";
		}
		
		if($("#emailCheckResult").val()=="0"){
			alert("이메일 중복검사를 해주세요.");
			return false;
		}
		
		// 휴대전화 유효성검사
		reg = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;
		if($("#tel").val()==''){
			error[5].innerHTML = "전화번호를 입력하세요.";
	        error[5].style.display = "block";
	        error[5].style.color = "red";
	        $("#tel").focus();
	        return false;
		}else if(!reg.test($("#tel").val())){
			error[5].innerHTML = "전화번호을 확인해주세요. '-'없이 숫자만 입력해주세요.";
			error[5].style.display = "block";
			error[5].style.color = "red";
	        $("#tel").focus();
	        return false;
		}else{
			error[5].style.display = "none";
		}
		if($("#telCheckResult").val()=="0"){
			alert("휴대전화 중복검사를 해주세요.");
			return false;
		}
		if($("#smsCheckResult").val()=="0"){
			alert("휴대전화 인증을 해주세요.");
			return false;
		}
		
		// 이용약관 체크박스
		if($("#check1").is(":checked") == false){
			error[7].innerHTML = "회원가입을 위해 이용약관에 동의해주시기 바랍니다.";
	        error[7].style.display = "block";
	        error[7].style.color = "red";
	        $("#check1").focus();
	        return false;
		}else{
			error[7].style.display = "none";
		}
		
		// 개인정보취급방침 체크박스
		if($("#check2").is(":checked") == false){
			error[8].innerHTML = "회원가입을 위해 개인정보취급방침에 동의해주시기 바랍니다.";
	        error[8].style.display = "block";
	        error[8].style.color = "red";
	        $("#check2").focus();
	        return false;
		}else{
			error[8].style.display = "none";
		}

		var data = $("#signUp_form").serialize();
		return true;
	});
	
});

// 약관 온오프
$(document).ready(function(){
	$(".agree_box div[class='more']").click(function(){
		var idx = $(this).index();
		if($(this).hasClass("on")){
			$(this).removeClass("on");
			if(idx == 3){
				$(".agree_box>div[class='moreText']").eq(0).hide();
			}else if(idx == 9){
				$(".agree_box>div[class='moreText']").eq(1).hide();
			}
		}else{
			$(this).addClass("on");
			if(idx == 3){
				$(".agree_box>div[class='moreText']").eq(0).show();
			}else if(idx == 9){
				$(".agree_box>div[class='moreText']").eq(1).show();
			}
		}
	});
	
	$(".agree_box>div[class='moreText']").eq(0).load("/txt/TermsOfService.txt");
	
	$(".agree_box>div[class='moreText']").eq(1).load("/txt/PrivacyPolicy.txt");
	
	
});

</script>
<c:if test="${kakao=='Y' }">
	<script>
		sessionStorage.setItem('kakao', 'Y');
	</script>
</c:if>

<div class="container">
	<form id="signUp_form" method="post" action="/member/signUpOk">
		<div class="title_box">
			<span style="font-size:54px;">회원가입</span>
			<br/>
		</div>
		<div class="form_box">
			<span class="menuName">아이디</span><br/>
			<input class="inputStyle" type='text' name='userid' id='userid' onkeyup="idCheckInit()" placeholder='아이디 입력'/>	
			<input type="button" class="checkBtn" onclick="idCheck()" value="중복확인"><br/>
			<input type="hidden" id="idCheckResult" value="0"/>
			<span class="msgError"></span><br/>
			
			<span class="menuName">닉네임</span><br/>
			<input class="inputStyle" type='text' name='username' id='username' onkeyup="nameCheckInit()" placeholder='닉네임 입력'/>
			<input type="button" class="checkBtn" onclick="nameCheck()" value="중복확인"><br/>
			<input type="hidden" id="nameCheckResult" value="0"/>
			<span class="msgError"></span><br/>
			
			<span class="menuName">비밀번호</span><br/>
			<input class="inputStyle" type='password' name='userpwd' id='userpwd' placeholder='비밀번호 입력'/><br/>
			<span class="msgError"></span><br/>
			
			<span class="menuName">비밀번호 확인</span><br/>
			<input class="inputStyle" type='password' id='userpwd2' placeholder='비밀번호 확인'/><br/>
			<span class="msgError"></span><br/>
			
			<c:if test="${kakao=='Y'}">
				<span class="menuName">이메일</span><br/>
				<input class="inputStyle" type='text' style="border:none;" name='useremail' id='useremail' onkeyup="emailCheckInit()" placeholder='이메일 입력' value="${sessionScope.k_useremail}" readonly/>
				<input type="hidden" id="emailCheckResult" value="1"/>
				<span class="msgError"></span><br/>
				<input class="inputStyle" type='hidden' name='kakaoid' id='kakaoid' value="${sessionScope.k_id}" readonly/>
			</c:if>
			<c:if test = "${kakao!='Y'}">
				<span class="menuName">이메일</span><br/>
				<input class="inputStyle" type='text' name='useremail' id='useremail' onkeyup="emailCheckInit()" placeholder='이메일 입력'/>
				<input type="button" class="checkBtn" onclick="emailCheck()" value="중복확인"><br/>
				<input type="hidden" id="emailCheckResult" value="0"/>
				<span class="msgError"></span><br/>
			</c:if>
		
			
			<span class="menuName">휴대전화</span><br/>
			<input class="inputStyle" type='text' name='tel' id='tel' onkeyup="telCheckInit()" placeholder='전화번호 입력'/>
			<input type="button" class="checkBtn btn2" onclick="smsCheck()" value="인증요청">
			<input type="button" class="checkBtn btn2" onclick="telCheck()" value="중복확인"><br/>
			<input type="hidden" id="telCheckResult" value="0"/>
			<span class="msgError"></span><br/>
			<div class="smsCheck">
				<input class="inputStyle" type='text' id='telCheckNumber' placeholder='인증번호 입력'/>
				<input type="button" class="checkBtn" id="smsConfirm" value="확인"><br/>
				<input type="hidden" id="smsCheckResult" value="0"/>
				<span class="msgError"></span><br/>
			</div>
		</div>
		<div class="agree_box">
			<h3>이용약관</h3>
			<span class="msgError"></span><br/>
			<div class="more">자세히보기</div>
			<div class="moreText">
				
			</div>
			<p class="check">
				<span>이용약관에 동의하십니까?</span>
				<input type="checkbox"  id="check1">
			</p>
			<h3>개인정보 취급방침</h3>
			<span class="msgError"></span><br/>
			<div class="more">자세히보기</div>
			<div class="moreText">
			
			</div>
			<p class="check">
				<span>개인정보 취급방침에 동의하십니까?</span>
				<input type="checkbox" id="check2">
			</p>
		</div>
		<div class="btn_box">
			<button id="signUpBtn">회원가입</button>
		</div>
	</form>
</div>