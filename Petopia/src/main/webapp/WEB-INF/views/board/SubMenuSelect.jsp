<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
});
</script>
<div id="Board_container">
	<div id="Board_wrap">
		<div id="Board_lnb">
			<div id="Board_sub_M">서브메뉴</div>
			
				<ul id="MenuSpan">
					<li><span id="MenuNotice">공지사항</span></li>
					<li><span id="MenuInfo">정보공유 게시판</span></li>
					<li><span id="MenuShare">나눔 할래요</span></li>
					<li><span id="MenuWalk">산책 할래요</span></li>
					<li><span id="MenuBoast">자랑 할래요</span></li>
					<li><span id="MenuSuggest">건의 할래요</span></li>
				</ul>
		</div>
		<div id="resultArea">
			<div id="UserNoticeShow"><%@ include file="/WEB-INF/views/board/notice/noticeList.jsp" %></div>
			<div id="UserInfoShow"><%@ include file="/WEB-INF/views/board/info/infoList.jsp" %></div>
			<div id="UserShareShow"><%@ include file="/WEB-INF/views/board/share/shareList.jsp" %></div>
			<div id="UserWalkShow"><%@ include file="/WEB-INF/views/board/walk/walkList.jsp" %></div>
			<div id="UserBoastShow"><%@ include file="/WEB-INF/views/board/boast/boastList.jsp" %></div>
			<div id="UserSuggestShow"><%@ include file="/WEB-INF/views/board/suggest/suggestList.jsp" %></div>
		</div>
	</div>
</div>

