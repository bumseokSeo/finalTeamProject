<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/notice/noticeList.css" type="text/css"/>
<div class="container">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">공지 사항</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_F" id="List_menu_F">
			<li>게시물 번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>

		</ul><!-- 게시물 -->
		</div>
		 <div class="paging" style="width:100%; text-align: center; font-size: 35px;">
           <b id="prevView" > < </b>
           <b id="pView" ></b>
           <b id="nextView" > > </b>
            
        </div>
    
       <div class="Share_btn"><a href="/board/notice/noticeWrite"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Share_search">
		 <form action="/board/notice/noticeSearch" id="searchFrm">
			<select name="searchKey">
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="userid">글쓴이</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>

<script>
$("#searchFrm").submit(function() {
   if ($("#searchWord").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
window.onload=function(){
		var startNum = 1; // oldlist안에 li태그의 길이
		var addListHtml = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if($("#UserNoticeShow").css('display','block')){
			url = '/board/notice/noticeLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn='noticeSearch'){
			url = '/board/notice/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
			console.log(startNum);
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtml += "<li>"+data[i].boardno+"</li>";
					addListHtml += "<li><a href='/board/notice/noticeView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
					addListHtml += "<li>"+data[i].writedate+"</li>";
					addListHtml += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextView").remove();
				} 
				$("#List_menu_F").append(addListHtml);
				$("#pView").append(startNum);
			}
		});
}

$('#nextView').click(function(){
		var startNum = $("#List_menu_F li").length/4 -1; // oldlist안에 li태그의 길이
		var addListHtml = "";
		var addListHtmlpo = "";
					addListHtmlpo += "<li>게시물 번호</li>";
					addListHtmlpo += "<li>제목</li>";
					addListHtmlpo += "<li>날짜</li>";
					addListHtmlpo += "<li>조회수</li>";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if($("#UserNoticeShow").css('display','block')){
			url = '/board/notice/noticeLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum 
			};
		}else if(pn='noticeSearch'){
			url = '/board/notice/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
			console.log(startNum);
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtml += "<li>"+data[i].boardno+"</li>";
					addListHtml += "<li><a href='/board/notice/noticeView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
					addListHtml += "<li>"+data[i].writedate+"</li>";
					addListHtml += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextView").remove();
				} 
				$("#List_menu_F").empty();
				$("#List_menu_F").append(addListHtmlpo);
				$("#List_menu_F").append(addListHtml);
				/* console.log(addListHtml); */
			}
		});
	   
		
	});
	
$('#prevView').click(function(){
	var startNum = $("#pView")*19; // 시작지점
	var addListHtml = "";
	var addListHtmlpo = "";
				addListHtmlpo += "<li>게시물 번호</li>";
				addListHtmlpo += "<li>제목</li>";
				addListHtmlpo += "<li>날짜</li>";
				addListHtmlpo += "<li>조회수</li>";
	 console.log(startNum); 
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if($("#UserNoticeShow").css('display','block')){
		url = '/board/notice/noticeLists';
		console.log("다음페이지")
		param = {
			"startNum" : startNum 
		};
	}else if(pn='noticeSearch'){
		url = '/board/notice/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWord" : word
		};
		console.log(startNum);
	}
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'json',
		data :param,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml += "<li>"+data[i].boardno+"</li>";
				addListHtml += "<li><a href='/board/notice/noticeView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
				addListHtml += "<li>"+data[i].writedate+"</li>";
				addListHtml += "<li>"+data[i].hit+"</li>";
			}
			if(data.length<19){
				$("#nextView").remove();
			} 
			$("#List_menu_F").empty();
			$("#List_menu_F").append(addListHtmlpo);
			$("#List_menu_F").append(addListHtml);
			$("#pView").empty();
			$("#pView").append(startNum)
			/* console.log(addListHtml); */
		}
	});
   
	
});
</script>