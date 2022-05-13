<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/admin_memberList.css" type="text/css"/>

<script>
// 회원 탈퇴
function memberDelChk(userid){
	if(confirm("회원("+userid+") 정보를 삭제하시겠습니까?")) {
		location.href="/admin/memberDel?userid="+userid;
	}
}
// 회원등급 변경
function changeAdmin(userid){
	if(confirm("회원("+userid+") 등급을 '관리자'로 변경하시겠습니까?")){
		location.href="/admin/memberChangeAdmin?userid="+userid;
	}
}
function changeNormal(userid){
	if(confirm("회원("+userid+") 등급을 '일반회원'으로 변경하시겠습니까?")){
		location.href="/admin/memberChangeNormal?userid="+userid;
	}
}
function changeStop(userid){
	if(confirm("회원("+userid+") 등급을 '정지'로 변경하시겠습니까?")){
		location.href="/admin/memberChangeStop?userid="+userid;
	}
}


/*쪽지부분*/	 
function sendMessage(username){
	var msgInfo = document.querySelectorAll('.msgInfo');
	msgInfo[0].innerHTML = "'"+username+"'님에게 메시지를 보냅니다.";
	$(".modal").show();
	var Name = username;
	
		//.modal안에 button을 클릭하면 .modal닫기
		$(".modal button").click(function(){
			$(".modal").hide();
		});
		
		//.modal밖에 클릭시 닫힘
		$(".modal").click(function (e) {
		    if (e.target.className != "modal") {
		      return false;
		    } else {
		      $(".modal").hide();
		    }   
	  	});
		
		$('#messagebtn').on('click',function(){
	    	console.log(Name);
			//메세지 내용 공백 검사
	    	var content=document.getElementById("messagecontent");
			if(content.value==""){
				alert("메세지를 입력해주세요.");
				content.focus();
				return false;
			}
			var username = document.getElementById("username");//메세지 받는 계정
			
			var content = document.getElementById("messagecontent");//내용
			var logName = "${logName}";
			
			//로그인 상태일 경우 메세지 보내기 진행
			if(logName!=null){
				//메세지 보내기 절차
				var url= "${url}/message/messagesend";
				var params = "username="+Name+"&content="+messagecontent.value;
				$.ajax({
					url:url,
					data:params,
					success:function(result){
						var $result = $(result);
						alert("쪽지를 보냈습니다.");
						$(".modal").hide();
					},
					error:function(e){
						console.log(e.resopnseText);
					}
				});
			}
			else{
				alert("로그인후 이용해주세요.");
				return false;
			}
	    	
		});
	/*쪽지부분*/
}

$(document).ready(function() {
	$(".searchKey").change(function() {
		var result = $(".searchKey option:selected").val();
		
		if(result == 'userlevel'){
			$(".searchWordSelect").show();
			$(".searchWordSelect").attr('name', 'searchWord');
			$(".searchWord").hide();
			$(".searchWord").removeAttr('name', 'searchWord');
		}else{
			$(".searchWordSelect").hide();
			$(".searchWordSelect").removeAttr('name', 'searchWord');
			$(".searchWord").show();
			$(".searchWord").attr('name', 'searchWord');
		}
	});
});
</script>


<div class="container">
	<ul class="tab_title">
		<li><a href="#">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="#">정보공유 게시판 관리</a></li>
		<li><a href="#">나눔 게시판 관리</a></li>
		<li><a href="#">자랑 게시판 관리</a></li>
		<li><a href="#">입양 게시판 관리</a></li>
		<li><a href="#">산책 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
	</ul>
	
	<div class="tab_content" >
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a> > <a href="/admin/admin_memberList">회원 관리</a>
		</div><br/><br/>
		
		<h3>회원 관리</h3>
		
		<div style="margin-bottom: 80px;">
			<div id="searchDiv">
				<form method="get" action="${url}/admin/admin_memberList" id="searchForm">
					<select class="searchKey" name="searchKey">
						<option value="userid">아이디</option>
						<option value="username">닉네임</option>
						<option value="useremail">이메일</option>
						<option value="userlevel">등급</option>
					</select>
		        	<input class="searchWord" type="search" placeholder="검색하기" aria-label="Search" id="searchWord" name="searchWord">
		        	<select style="display: none;" class="searchWordSelect">
		        		<option value="1">관리자</option>
		        		<option value="2">일반회원</option>
		        		<option value="3">정지</option>		        		
		        	</select>
		        	<input type="submit" value="검색" class="searchBtn" id="searchBtn">
		    	</form>
			</div>
		</div>
		
		<ul id="memberList">
			<li>아이디</li>
			<li>닉네임</li>
			<li>이메일</li>
			<li>등급</li>
			<li>카카오</li>
			<li>등급변경</li>
			<li>관리</li>
			
			<c:forEach var="vo" items="${list}">
				<li>${vo.userid}</li>
				<li>${vo.username}</li>
				<li>${vo.useremail}</li>
				<li>
					<c:if test='${vo.userlevel == 1}'>관리자</c:if>
					<c:if test='${vo.userlevel == 2}'>일반회원</c:if>
					<c:if test='${vo.userlevel == 3}'>정지</c:if>
				</li>
				<li>
					<c:if test='${vo.kakaoid != null}'>Y</c:if>
					<c:if test='${vo.kakaoid == null}'>N</c:if>
				</li>
				<li>
					<c:if test='${vo.userlevel == 1}'>
						<a href="#" style="color:blue; font-weight:700;">
					</c:if>
					<c:if test='${vo.userlevel != 1}'>
						<a href="javascript:changeAdmin('${vo.userid}')">
					</c:if>
					관리자</a>&nbsp;|
						
					<c:if test='${vo.userlevel == 2}'>
						<a href="#" style="color:blue; font-weight:700;">
					</c:if>
					<c:if test='${vo.userlevel != 2}'>
						<a href="javascript:changeNormal('${vo.userid}')">
					</c:if>
					일반회원</a>&nbsp;|
					
					<c:if test='${vo.userlevel == 3}'>
						<a href="#" style="color:blue; font-weight:700;">
					</c:if>
					<c:if test='${vo.userlevel != 3}'>
						<a href="javascript:changeStop('${vo.userid}')">
					</c:if>
					정지</a>
				</li>
				<li>
					<a class="chatBtn" href="javascript:sendMessage('${vo.username}')">쪽지보내기</a>
					<a class="delBtn" href="javascript:memberDelChk('${vo.userid}')">탈퇴</a>
					
					
					
				</li>
			</c:forEach>
		</ul>
		
		<ul class="paging">
			<!-- 이전페이지 -->
			<c:if test="${apVO.pageNum==1}">
				<li>이전</li>
			</c:if>
			<c:if test="${apVO.pageNum>1}">
				<li><a href="${url}/admin/admin_memberList?pageNum=${apVO.pageNum-1}<c:if test='${apVO.searchWord!=null}'>&searchKey=${apVO.searchKey}&searchWord=${apVO.searchWord}</c:if>">이전</a></li>
			</c:if>
			<!-- 페이지번호 -->
			<c:forEach var="p" begin="${apVO.startPage}" end="${apVO.startPage+apVO.onePageCount-1}">
				<!-- 총페이지수보다 출력할 페이지 번호가 작을때 -->
				<c:if test="${p<=apVO.totalPage}">
					<c:if test="${p==apVO.pageNum}">
						<li class="now">
					</c:if>
					<c:if test="${p!=apVO.pageNum}">
						<li>
					</c:if>
					<a href="${url}/admin/admin_memberList?pageNum=${p}<c:if test='${apVO.searchWord!=null}'>&searchKey=${apVO.searchKey}&searchWord=${apVO.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음페이지 -->
			<c:if test="${apVO.pageNum==apVO.totalPage}">
				<li>다음</li>
			</c:if>
			<c:if test="${apVO.pageNum<apVO.totalPage}">
				<li><a href="${url}/admin/admin_memberList?pageNum=${apVO.pageNum+1}<c:if test='${apVO.searchWord!=null}'>&searchKey=${apVO.searchKey}&searchWord=${apVO.searchWord}</c:if>">다음</a></li>
			</c:if>
		</ul>
		
	</div>

</div>

<div class="modal">
	<button>&times;</button>
	<div class="modalBox">
		<div class="modaltop">
			<br>
			<h4><span class="msgInfo"></span></h4>
		</div>
		<div class="modalbody">
			<form method="get" id="messageForm" action="#">			
				<input type="text" name="messagecontent" id="messagecontent" maxlength="100" />
				<input type="button" value="전송" id="messagebtn"/>
			</form>
		</div>
	</div>
</div>