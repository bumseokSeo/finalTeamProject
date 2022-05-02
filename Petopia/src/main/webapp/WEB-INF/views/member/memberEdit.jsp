<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/memberEdit.css" type="text/css"/>
<script>
	$(function(){
		$('#profileimage').change(function() {//이미지 첨부되면 실행
			
			setImage(this, '#preview2');
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
	
	//회원정보수정 폼 체크
	function formcheck(){
		
		return true;
	}
</script>
<style>

</style>

<div class="container">
	<form id="signUp_form" method="post" action="${url}/member/memberEditOk" onsubmit="return formcheck()" enctype="multipart/form-data">
		<div class="title_box">
			<span style="font-size:54px;">회원정보 수정</span>
			<br/>
		</div>
		<div class="form_box">
			<c:if test="${vo.profileimage == '' || vo.profileimage == null}">
				<img src='${url}/img/sampleProfile.jpg' id="preview" style="display: block" class="rounded-circle"/>
			</c:if>
			<c:if test="${vo.profileimage != '' && vo.profileimage != null}">
				<img src='${url}/img/memberimg/${vo.profileimage}' style="display: block" id="preview" class="rounded-circle"/>
			</c:if>
			<img src='' id="preview2" style="display: none" class="rounded-circle"/>
			<span class="menuName">프로필 사진 등록</span><br/>
			<input type="file" class="form-control-file border" name="imgName" id="profileimage" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
			
			<span class="menuName">아이디</span><br/>
			<input class="inputStyle" type='text' name='userid' id='userid' disabled="disabled" value="${vo.userid}"/>
			<br/>
			
			<span class="menuName">닉네임</span><br/>
			<input class="inputStyle" type='text' name='username' id='username' placeholder='닉네임 입력' value="${vo.username}"/>
			<button id="checkBtn">중복확인</button><br/>
			
			<span class="menuName">비밀번호</span><br/>
			<input class="inputStyle" type='password' name='userpwd' id='userpwd' placeholder='비밀번호 입력'/><br/>
			
			<span class="menuName">비밀번호 확인</span><br/>
			<input class="inputStyle" type='password' name='userpwd' id='userpwd2' placeholder='비밀번호 확인'/><br/>
			
			<span class="menuName">이메일</span><br/>
			<input class="inputStyle" type='text' name='useremail' id='useremail' placeholder='이메일 입력' value="${vo.useremail }"/>
			<button id="checkBtn">중복확인</button><br/>
			
		</div>
		
		<div class="btn_box">
			<input type="reset" id="resetBtn" value="취소하기"></input>
			<input type="submit" id="memberEditBtn" value="정보수정"></input>
			
		</div>
	</form>
</div>