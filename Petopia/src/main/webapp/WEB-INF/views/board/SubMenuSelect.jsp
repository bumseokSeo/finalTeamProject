<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/css/SubMenuSelect.css" type="text/css"/>
<script>
$(document).ready(function(){
	//$("#resultArea>div").css('display','none !important');
	switch('${type}'){
	case 'notice' : 
		
		console.log(22);
			  $("#UserNoticeShow").css('display','block');
			  break;
	case 'info' : 
		  	  $("#UserInfoShow").css('display','block');
			  break;
	case 'share' : 
			 $("#UserShareShow").css('display','block');
			  break;
	case 'walk' : 
			  $("#UserWalkShow").css('display','block');
			  break;
	case 'boast' : 
			  $("#UserBoastShow").css('display','block');
			  break;
	case 'suggest' : 
			  $("#UserSuggestShow").css('display','block');
			  break;
		
	}
		
	$("#MenuNotice").click(function(){
		$("#resultArea>div").css('display','none');
		$("#UserNoticeShow").css('display','block');
	  });
	$("#MenuInfo").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserInfoShow").css('display','block');
	   });
	$("#MenuShare").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserShareShow").css('display','block');
	 });
	$("#MenuWalk").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserWalkShow").css('display','block');
	 });
	$("#MenuBoast").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserBoastShow").css('display','block');
	 });
	$("#MenuSuggest").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserSuggestShow").css('display','block');
	 });
	
	$("#MenuNotice2").click(function(){
		$("#resultArea>div").css('display','none');
		$("#UserNoticeShow").css('display','block');
	  });
	$("#MenuInfo2").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserInfoShow").css('display','block');
	   });
	$("#MenuShare2").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserShareShow").css('display','block');
	 });
	$("#MenuWalk2").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserWalkShow").css('display','block');
	 });
	$("#MenuBoast2").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserBoastShow").css('display','block');
	 });
	$("#MenuSuggest2").click(function(){ 
		$("#resultArea>div").css('display','none');
		$("#UserSuggestShow").css('display','block');
	 });
});
</script>

<style>

</style>
<div id="Board_container">
	<div id="Board_wrap">
		<c:if test="${logStatus != 'Y' }">
			<div id="Board_lnb2">
		</c:if>
		<c:if test="${logStatus == 'Y' }">
			<div id="Board_lnb">
				<div id="Board_sub_M">
						<div class="box">
							<p class="explain">회원정보수정<p>
							<a href="/member/memberEdit">
								<c:set var ="profileimage" value="${logImg }"/>
								<c:choose>
									<c:when test="${fn:startsWith(profileimage, 'http://')}">
										<img src='${logImg }' style="display: block" id="preview" class="rounded-circle"/>
									</c:when>
									<c:when test="${logImg == '' || logImg == null}">
										<img src='${url}/img/sampleProfile.jpg' id="preview" style="display: block" class="rounded-circle"/>
									</c:when>
									<c:when test="${logImg != '' || logImg != null}">
										<img src='${url}/img/memberimg/${logImg}' style="display: block" id="preview" class="rounded-circle"/>
									</c:when>
								</c:choose>
							</a>
						</div>
						<p id="logName"><b>${logName}</b>님</p>
						<p class="myCnt">내가 쓴 글 <span><b>${vo.myWriteCnt}</b>개</span></p>
						<p class="myCnt">내가 쓴 댓글 <span><b>${vo.myReviewCnt}</b>개</span></p>
				</div>
			</c:if>
				<ul id="MenuSpan">
					<li><span id="MenuNotice">공지사항</span></li>
					<li><span id="MenuInfo">정보공유</span></li>
					<li><span id="MenuShare">나눔 할래요</span></li>
					<li><span id="MenuWalk">산책 할래요</span></li>
					<li><span id="MenuBoast">자랑 할래요</span></li>
					<li><span id="MenuSuggest">건의 할래요</span></li>
				</ul>
		</div>
		<div id="resultArea">
			<ul id="MenuSpanTop">
				<li><span id="MenuNotice2">공지사항</span></li>
				<li><span id="MenuInfo2">정보공유</span></li>
				<li><span id="MenuShare2">나눔</span></li>
				<li><span id="MenuWalk2">산책</span></li>
				<li><span id="MenuBoast2">자랑</span></li>
				<li><span id="MenuSuggest2">건의</span></li>
			</ul><br/>
			<div id="UserNoticeShow"><%@ include file="/WEB-INF/views/board/notice/noticeList.jsp" %></div>
			<div id="UserInfoShow"><%@ include file="/WEB-INF/views/board/info/infoList.jsp" %></div>
			<div id="UserShareShow"><%@ include file="/WEB-INF/views/board/share/shareList.jsp" %></div>
			<div id="UserWalkShow"><%@ include file="/WEB-INF/views/board/walk/walkList.jsp" %></div>
			<div id="UserBoastShow"><%@ include file="/WEB-INF/views/board/boast/boastList.jsp" %></div>
			<div id="UserSuggestShow"><%@ include file="/WEB-INF/views/board/suggest/suggestList.jsp" %></div>
		</div>
	</div>
</div>

