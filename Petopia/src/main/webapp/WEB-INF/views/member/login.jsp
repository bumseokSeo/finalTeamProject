<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css//login.css" type="text/css"/>
<script type="text/javascript">
	$(function() {
	    cookieCheck();
	});
	function formcheck() {
		var userid = document.getElementById("userid");
		if (userid.value == "") {
			alert("아이디를 입력해주세요");
			userid.focus();
			return false;
		}
		var userpwd = document.getElementById("userpwd");
		if (userpwd.value == "") {
			alert("비밀번호를 입력해주세요");
			userpwd.focus();
			return false;
		}
		saveid();
		return true;
		
	}
	function saveid(){
		//체크박스가 체크상태일 때 쿠키를 저장
		if(document.getElementById("rememberId").checked){//체크값이 true인경우
			//변수=값;path=/;expires=날짜;
			var now = new Date();
			now.setDate(now.getDate()+365);
			var cookieData = "userid="+userid.value+";path=/;expires="+now+";";
			document.cookie =cookieData;
			document.cookie = "rememberId=on;path=/;expires="+now+";";
		}else{
			var now = new Date();
			now.setDate(now.getDate()-365);
			var cookieData = "userid="+userid.value+";path=/;expires="+now+";";
			document.cookie =cookieData;
			document.cookie = "rememberId=on;path=/;expires="+now+";";
		}
	}
	function cookieCheck(){
		var cookieid = getCookie("userid");
        if(cookieid !=""){
        	$("input:checkbox[id='rememberId']").prop("checked", true);
            $('#userid').val(cookieid);
        }
	}
	
    function getCookie(Name) {
        var search = Name + "=";
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1){
                	end = document.cookie.length;
                }  
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
</script>
<div class="container">
	
	<form id="login_form" method="post" action="${url}/member/loginOk" onsubmit="return formcheck()">
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
			<div id="saveid">
				<input type="checkbox" value="rememberId" id="rememberId"/> 
				<label id="rememberId2"> 아이디 저장하기 </label>
			</div>
			<input type="submit" id="btnLogin" value="로그인"></input>
			
			<div class="loginUtil">
				<ul>
					<li>
						아직 회원이 아니신가요? <a href="/member/signUp">회원가입</a>
					</li>
					<li>
						아이디를 잊으셨나요? <a href="/member/findId">아이디찾기</a>
					</li>
					<li>
						비밀번호를 잊으셨나요? <a href="/member/resetPwd">비밀번호찾기</a>
					</li>
				</ul>
			</div>
		</div>
		
	</form>
</div>
