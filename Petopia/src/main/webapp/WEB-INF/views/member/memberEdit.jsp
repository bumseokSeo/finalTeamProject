<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/css/member/memberEdit.css" type="text/css"/>
<script>
	$(function(){
		$('#profileimage').change(function() {//이미지 첨부되면 실행
			
			setImage(this, '#preview2');
		});
		
		var error = document.querySelectorAll('.msgError');
		
		$("#form").submit(function(){
			// 닉네임 유효성검사
			var reg = /^[가-힣a-zA-Z0-9]{2,16}$/;
			if($("#username").val()==''){
				error[0].innerHTML = "닉네임을 입력하세요.";
				error[0].style.display = "block";
				error[0].style.color = "red";
				$("#username").focus();
				return false;
			}else if(!reg.test($("#username").val())){
				error[0].innerHTML = "2~16자 한글과 영문 대 소문자를 사용하세요.";
				error[0].style.display = "block";
				error[0].style.color = "red";
				$("#username").focus();
				return false;
			} else{
				error[0].style.display = "none";
			}
			
			if($("#nameCheckResult").val()=="0"){
				alert("닉네임 중복검사를 해주세요.");
				return false;
			}
			
			// 비밀번호 유효성검사
			reg = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/;
			if($("#userpwd").val()==''){
				error[1].innerHTML = "비밀번호를 입력하세요.";
		        error[1].style.display = "block";
		        error[1].style.color = "red";
		        $("#userpwd").focus();
		        return false;
			}else if(!reg.test($("#userpwd").val())){
				error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
				error[1].style.display = "block";
				error[1].style.color = "red";
		        $("#userpwd").focus();
		        return false;
			}else{
				error[1].style.display = "none";
			}
			
			// 비밀번호 확인 유효성검사
			if($("#userpwd").val() != $("#userpwd2").val()){
				error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
				error[2].style.display = "block";
				error[2].style.color = "red";
				return false;
			}else{
				error[2].style.display = "none";
			}
			
			
			// 이메일 유효성검사
			reg = /^\w{5,20}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
			if($("#useremail").val()==''){
				error[3].innerHTML = "이메일을 입력하세요.";
		        error[3].style.display = "block";
		        error[3].style.color = "red";
		        $("#useremail").focus();
		        return false;
			}else if(!reg.test($("#useremail").val())){
				error[3].innerHTML = "이메일을 확인해주세요.";
				error[3].style.display = "block";
				error[3].style.color = "red";
		        $("#useremail").focus();
		        return false;
			}else{
				error[3].style.display = "none";
			}
			
			if($("#emailCheckResult").val()=="0"){
				alert("이메일 중복검사를 해주세요.");
				return false;
			}
			
			return true;
			
		});
		
	});
	//이미지 미리보기
	function setImage(input, preview2) {
		$('#preview').css("display","none");//display설정 변경
		$('#preview2').css("display","block");//display설정 변경
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(preview2).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	
	// 닉네임 중복검사
	function nameCheckInit(){
		var error = document.querySelectorAll('.msgError');
		error[0].style.display = "none";
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
				if($("#username").val() == "${vo.username}"){
					error[0].innerHTML = "기존 닉네임과 동일합니다.";
					error[0].style.display = "block";
					error[0].style.color = "green";
					$("#nameCheckResult").val("1");
				}else if($("#username").val()==''){
					error[0].innerHTML = "닉네임을 입력하세요.";
					error[0].style.display = "block";
					error[0].style.color = "red";
					$("#username").focus();
				}else if(!reg.test($("#username").val())){
					error[0].innerHTML = "2~16자 한글과 영문 대 소문자를 사용하세요.";
					error[0].style.display = "block";
					error[0].style.color = "red";
					$("#username").focus();
				}else if(result>=1){
					error[0].innerHTML = "닉네임이 중복되었습니다.";
					error[0].style.display = "block";
					error[0].style.color = "red";
					$("#nameCheckResult").val("0");
				}else{
					if(!$("#username").val()==''){
						error[0].innerHTML = "사용가능한 닉네임입니다.";
						error[0].style.display = "block";
						error[0].style.color = "green";
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
		error[3].style.display = "none";
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
				if($("#useremail").val() == "${vo.useremail}"){
					error[3].innerHTML = "기존 이메일과 동일합니다.";
					error[3].style.display = "block";
					error[3].style.color = "green";
					$("#emailCheckResult").val("1");
				}else if($("#useremail").val()==''){
					error[3].innerHTML = "이메일을 입력하세요.";
			        error[3].style.display = "block";
			        error[3].style.color = "red";
			        $("#useremail").focus();
				}else if(!reg.test($("#useremail").val())){
					error[3].innerHTML = "이메일을 확인해주세요.";
					error[3].style.display = "block";
					error[3].style.color = "red";
			        $("#useremail").focus();
				}else if(result>=1){
					error[3].innerHTML = "이메일이 중복되었습니다.";
					error[3].style.display = "block";
					error[3].style.color = "red";
					$("#emailCheckResult").val("0");
				}else{
					if(!$("#useremail").val()==''){
						error[3].innerHTML = "사용가능한 이메일입니다.";
						error[3].style.display = "block";
						error[3].style.color = "green";
						$("#emailCheckResult").val("1");
					}
				}
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	}
	
	function delCheck(){
		if(confirm("정말 탈퇴하시겠습니까?")){
			$(".del_form_box>input[id='delcheckBtn']").hide();
			$(".del_form_box>div[class='delCheck']").eq(0).show();
		}else{
			return false;
		}
	}
	
	function delCheckReal(){
		if($('#userpwdDEL').val()==""){
			alert("비밀번호 입력하세요.");
			return false;
		}else if($('#userpwdDEL').val()!="${vo.userpwd}"){
			alert("비밀번호가 틀렸습니다.");
			return false;
		}else if(confirm("정말 진짜로 탈퇴하시겠습니까?")){
			$("#signDel").submit();
		}else{
			return false;
		}
	}
	
</script>

<c:if test="${kakao=='Y' }">
	<script>
		// sessionStorage.setItem('kakao', 'Y');
	</script>
</c:if>

<div class="container">
	<form id="form" method="post" action="${url}/member/memberEditOk" enctype="multipart/form-data">
		<div class="title_box">
			<span style="font-size:54px;">회원정보 수정</span>
			<br/>
		</div>
		<div class="form_box">
			<c:set var ="profileimage" value="${vo.profileimage}"/>
			<c:choose>
				<c:when test="${vo.profileimage == '' || vo.profileimage == null}">
					<img src='${url}/img/sampleProfile.jpg' id="preview" style="display: block" class="rounded-circle"/>
				</c:when>
				<c:when test="${fn:startsWith(profileimage, 'http://')}">
					<img src='${vo.profileimage}' style="display: block" id="preview" class="rounded-circle"/>
				</c:when>
				<c:when test="${vo.profileimage != '' && vo.profileimage != null}">
					<img src='${url}/img/memberimg/${vo.profileimage}' style="display: block" id="preview" class="rounded-circle"/>
				</c:when>
			</c:choose>
			
			<img src='' id="preview2" style="display: none" class="rounded-circle"/>
			<span class="menuName">프로필 사진 등록</span><br/>
			<input type="file" class="form-control-file border" name="imgName" id="profileimage" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
			
			<c:if test="${kakao=='Y'}">
				<input class="inputStyle" type='hidden' name='userid' id='userid' disabled="disabled" value="${vo.userid}"/>
			</c:if>
			<c:if test="${kakao!='Y'}">
				<span class="menuName">아이디</span><br/>
				<input class="inputStyle" style="border:none;" type='text' name='userid' id='userid' disabled="disabled" value="${vo.userid}"/>
			</c:if>
				<br/>
			
			<span class="menuName">닉네임</span><br/>
			<input class="inputStyle" type='text' name='username' id='username' onkeyup="nameCheckInit()" placeholder='닉네임 입력' value="${vo.username}"/>
			<input type="button" class="checkBtn" onclick="nameCheck()" value="중복확인"><br/>
			<input type="hidden" id="nameCheckResult" value="0"/>
			<span class="msgError"></span><br/>
			<c:if test="${kakao=='Y'}">
				<input class="inputStyle" type='hidden' name='userpwd' id='userpwd' value="${vo.userpwd}"/>
				<span class="msgError"></span>
				
				<input class="inputStyle" type='hidden' name='userpwd2' id='userpwd2' value="${vo.userpwd}"/>
				<span class="msgError"></span>
			</c:if>
			<c:if test="${kakao!='Y'}">
				<span class="menuName">비밀번호</span><br/>
				<input class="inputStyle" type='password' name='userpwd' id='userpwd' placeholder='비밀번호 입력'/><br/>
				<span class="msgError"></span><br/>
				
				<span class="menuName">비밀번호 확인</span><br/>
				<input class="inputStyle" type='password' name='userpwd2' id='userpwd2' placeholder='비밀번호 확인'/><br/>
				<span class="msgError"></span><br/>
			</c:if>
			
			<c:if test="${kakao=='Y'}">
				<span class="menuName">이메일</span><br/>
				<input class="inputStyle" type='text' style="border:none;" name='useremail' id='useremail' placeholder='이메일 입력' value="${vo.useremail }"/>
				<br/>
				<input type="hidden" id="emailCheckResult" value="1"/>
				<span class="msgError"></span><br/>
			</c:if>
			
			<c:if test="${kakao!='Y'}">
				<span class="menuName">이메일</span><br/>
				<input class="inputStyle" type='text' name='useremail' id='useremail' onkeyup="emailCheckInit()" placeholder='이메일 입력' value="${vo.useremail }"/>
				<input type="button" class="checkBtn" onclick="emailCheck()" value="중복확인"><br/>
				<input type="hidden" id="emailCheckResult" value="0"/>
				<span class="msgError"></span><br/>
			</c:if>
			
			
		</div>
		
		<div class="btn_box">
			<input type="reset" id="resetBtn" value="취소하기"></input>
			<input type="submit" id="memberEditBtn" value="정보수정"></input>
		</div>
		
	</form>
	<div class="del_form_box">
		<input class="inputStyle" type='text' id='delConfirm' disabled="disabled" value="정말 탈퇴하시겠습니까? 진심이세요?"/>
		<input type="button" class="checkBtn" id="delcheckBtn" onclick="delCheck()" value="회원탈퇴"><br/>
		<div class="delCheck">
			<c:if test="${kakao=='Y'}">
				<span class="menuName">비밀번호</span><br/>
				<input class="inputStyle" style="border:none;" type='password' name='userpwd' id="userpwdDEL" value="${vo.userpwd}" disabled="disabled" />
				<input type="button" class="checkBtn" id="memberDelBtn" onclick="delCheckReal()" value="회원탈퇴"><br/>
				<span class="msgError"></span><br/>
			</c:if>
			<c:if test="${kakao!='Y'}">
				<span class="menuName">비밀번호</span><br/>
				<input class="inputStyle" type='password' name='userpwd' id="userpwdDEL" placeholder='비밀번호 확인'/>
				<input type="button" class="checkBtn" id="memberDelBtn" onclick="delCheckReal()" value="회원탈퇴"><br/>
				<span class="msgError"></span><br/>
			</c:if>
			
		</div>
		<form method="get" action="/member/memberDelete" id='signDel'>
			<input type="text" name="userid" value="${vo.userid}" readonly style="display:none;">
		</form>
	</div>
</div>
