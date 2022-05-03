<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/SubMenuSelect.css" type="text/css"/>
<script>
$(document).ready(function(){
	$("#MenuNotice").click(function(){ 
		$("#UserNoticeShow").css('display','block');
		$("#MenuInfo_container").css('display','none');
		$("#UserShareShow").css('display','none');
		$("#MenuWalk_container").css('display','none');
		$("#MenuBoast_container").css('display','none');
		$("#MenuSuggest_container").css('display','none');
		
	   });
	$("#MenuInfo").click(function(){ 
		$("#MenuNotice_container").css('display','none');
		$("#MenuInfo_container").css('display','block');
		$("#MenuShare_container").css('display','none');
		$("#MenuWalk_container").css('display','none');
		$("#MenuBoast_container").css('display','none');
		$("#MenuSuggest_container").css('display','none');
	   });
	$("#MenuShare").click(function(){ 
		$("#UserNoticeShow").css('display','none');
		$("#MenuInfo_container").css('display','none');
		$("#UserShareShow").css('display','block');
		$("#MenuWalk_container").css('display','none');
		$("#MenuBoast_container").css('display','none');
		$("#MenuSuggest_container").css('display','none');
	 });
	$("#MenuWalk").click(function(){ 
		$("#MenuNotice_container").css('display','none');
		$("#MenuInfo_container").css('display','none');
		$("#MenuShare_container").css('display','none');
		$("#MenuWalk_container").css('display','block');
		$("#MenuBoast_container").css('display','none');
		$("#MenuSuggest_container").css('display','none');
	 });
	$("#MenuBoast").click(function(){ 
		$("#MenuNotice_container").css('display','none');
		$("#MenuInfo_container").css('display','none');
		$("#MenuShare_container").css('display','none');
		$("#MenuWalk_container").css('display','none');
		$("#MenuBoast_container").css('display','block');
		$("#MenuSuggest_container").css('display','none');
	 });
	$("#MenuSuggest").click(function(){ 
		$("#MenuNotice_container").css('display','none');
		$("#MenuInfo_container").css('display','none');
		$("#MenuShare_container").css('display','none');
		$("#MenuWalk_container").css('display','none');
		$("#MenuBoast_container").css('display','none');
		$("#MenuSuggest_container").css('display','block');
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
			<span id="UserNoticeShow"><%@ include file="/WEB-INF/views/board/notice/noticeList.jsp" %></span>
			<span id="UserShareShow"><%@ include file="/WEB-INF/views/board/share/shareList.jsp" %></span>
		</div>
	</div>
</div>

