<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/walk/walkList.css" type="text/css"/>
<div class="container">
	<div class="Menu_Bar_AW">
		<h1 class="Menu_titleW">산책 할래요</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_FW" id="List_menu_FW">
			<li>게시물 번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>날짜</li>
			<li>조회수</li>

		</ul><!-- 게시물 -->
		</div>
		 <div class="paging">
           <b id="prevViewW"> ◀ </b>
           <b id="pViewW"></b>
           <b id="nextViewW" > ▶ </b>
            
        </div>
    
       <div class="info_btn"><a href="/board/boardWrite?type=walk"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="info_search">
		 <form action="/board/notice/noticeSearch" id="searchFrmW">
			<select name="searchKey">
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWordW"/>
			<input type="hidden" name="type" value="walk"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>

<script>
$("#searchFrmW").submit(function() {
   if ($("#searchWordW").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlW = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/walk/walkLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn=='walkSearch'){
			url = '/board/walk/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/walk/walkLists';
			param = {
				"startNum" : startNum
			};
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtmlW += "<li>"+data[i].boardno+"</li>";
					addListHtmlW += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
					addListHtmlW += "<li>"+data[i].username+"</li>"
					addListHtmlW += "<li>"+data[i].writedate+"</li>";
					addListHtmlW += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextViewW").empty();
				} 
				if(startNum=1){
					$("#prevViewW").empty();
				} 
				$("#List_menu_FW").append(addListHtmlW);
				$("#pViewW").append(startNum);
			}
		});
});

$('#nextViewW').click(function(){
		var startNum = parseInt($("#pViewW").text());
		var addListHtmlW = "";
		var addListHtmlWpo = "";
					addListHtmlWpo += "<li>게시물 번호</li>";
					addListHtmlWpo += "<li>제목</li>";
					addListHtmlWpo += "<li>작성자</li>";
					addListHtmlWpo += "<li>날짜</li>";
					addListHtmlWpo += "<li>조회수</li>";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/walk/walkLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*18+1
			};
		}else if(pn=='walkSearch'){
			url = '/board/walk/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/walk/walkLists';
			param = {
				"startNum" : startNum*18+1
			};
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtmlW += "<li>"+data[i].boardno+"</li>";
					addListHtmlW += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
					addListHtmlW += "<li>"+data[i].username+"</li>"
					addListHtmlW += "<li>"+data[i].writedate+"</li>";
					addListHtmlW += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextViewW").empty();
				} 
				$("#prevViewW").empty();
				$("#List_menu_FW").empty();
				$("#List_menu_FW").append(addListHtmlWpo);
				$("#List_menu_FW").append(addListHtmlW);
				$("#pViewW").empty();
				$("#pViewW").append(startNum+1);
				$("#prevViewW").append("◀");
				/* console.log(addListHtmlW); */
			}
		});
	   
		
	});
	
$('#prevViewW').click(function(){
	var startNum = parseInt($("#pViewW").text()); // 시작지점
	var addListHtmlW = "";
	var addListHtmlWpo = "";
				addListHtmlWpo += "<li>게시물 번호</li>";
				addListHtmlWpo += "<li>제목</li>";
				addListHtmlWpo += "<li>작성자</li>";
				addListHtmlWpo += "<li>날짜</li>";
				addListHtmlWpo += "<li>조회수</li>";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	var pn2 = pn.substring(pn.lastIndexOf('Search'));
	if(pn=='SubMenuSelect'){
		url = '/board/walk/walkLists';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*18-18
		};
	}else if(pn='walkSearch'){
		url = '/board/walk/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn2 =='Search'){
		url = '/board/walk/walkLists';
		param = {
			"startNum" : startNum*18-18
		};
	}
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'json',
		data :param,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtmlW += "<li>"+data[i].boardno+"</li>";
				addListHtmlW += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
				addListHtmlW += "<li>"+data[i].username+"</li>"
				addListHtmlW += "<li>"+data[i].writedate+"</li>";
				addListHtmlW += "<li>"+data[i].hit+"</li>";
			}
			$("#nextViewW").empty();
			$("#nextViewW").append("▶");
			$("#List_menu_FW").empty();
			$("#List_menu_FW").append(addListHtmlWpo);
			$("#List_menu_FW").append(addListHtmlW);
			$("#pViewW").empty();
			$("#pViewW").append(startNum-1);
			
			if(parseInt($("#pViewW").text())==1){
				$("#prevViewW").empty();
			} 
			/* console.log(addListHtmlW); */
		}
	});
   
	
});
</script>