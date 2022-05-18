<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/suggest/suggestList.css" type="text/css"/>
<script>
$("#searchFrmSU").submit(function() {
   if ($("#searchWordSU").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlSU = "";
		console.log("공지"); 
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWordSU');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if(pn='SubMenuSelect'&& $("#UserSuggestShow").css('display')=='block'){
			url = '/board/suggest/suggestLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn='suggestSearch'){
			url = '/board/suggest/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWordSU" : word
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
					addListHtmlSU += "<li>"+data[i].boardno+"</li>";
					addListHtmlSU += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
					addListHtmlSU += "<li>"+data[i].userid+"</li>"
					addListHtmlSU += "<li>"+data[i].writedate+"</li>";
					addListHtmlSU += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextViewSU").empty();
				} 
				if(startNum=1){
					$("#prevViewSU").empty();
				} 
				$("#List_menu_FSU").append(addListHtmlSU);
				$("#pViewSU").append(startNum);
			}
		});
});

$('#nextViewSU').click(function(){
		var startNum = parseInt($("#pViewSU").text());
		var addListHtmlSU = "";
		var addListHtmlSUpo = "";
					addListHtmlSUpo += "<li>게시물 번호</li>";
					addListHtmlSUpo += "<li>제목</li>";
					addListHtmlSUpo += "<li>작성자</li>";
					addListHtmlSUpo += "<li>날짜</li>";
					addListHtmlSUpo += "<li>조회수</li>";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWordSU');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn='SubMenuSelect'&& $("#UserSuggestShow").css('display')=='block'){
			url = '/board/suggest/suggestLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*19+1
			};
		}else if(pn='suggestSearch'){
			url = '/board/suggest/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWordSU" : word
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
					addListHtmlSU += "<li>"+data[i].boardno+"</li>";
					addListHtmlSU += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
					addListHtmlSU += "<li>"+data[i].userid+"</li>"
					addListHtmlSU += "<li>"+data[i].writedate+"</li>";
					addListHtmlSU += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextViewSU").empty();
				} 
				$("#prevViewSU").empty();
				$("#List_menu_FSU").empty();
				$("#List_menu_FSU").append(addListHtmlSUpo);
				$("#List_menu_FSU").append(addListHtmlSU);
				$("#pViewSU").empty();
				$("#pViewSU").append(startNum+1);
				$("#prevViewSU").append("◀");
				/* console.log(addListHtmlSU); */
			}
		});
	   
		
	});
	
$('#prevViewSU').click(function(){
	var startNum = parseInt($("#pViewSU").text()); // 시작지점
	var addListHtmlSU = "";
	var addListHtmlSUpo = "";
					addListHtmlSUpo += "<li>게시물 번호</li>";
					addListHtmlSUpo += "<li>제목</li>";
					addListHtmlSUpo += "<li>작성자</li>";
					addListHtmlSUpo += "<li>날짜</li>";
					addListHtmlSUpo += "<li>조회수</li>";
	 console.log(startNum); 
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWordSU');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn='SubMenuSelect' && $("#UserSuggestShow").css('display')=='block'){
		url = '/board/suggest/suggestLists';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*19-19
		};
	}else if(pn='suggestSearch'){
		url = '/board/suggest/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWordSU" : word
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
				addListHtmlSU += "<li>"+data[i].boardno+"</li>";
				addListHtmlSU += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title+"</a></li>";
				addListHtmlSU += "<li>"+data[i].userid+"</li>"
				addListHtmlSU += "<li>"+data[i].writedate+"</li>";
				addListHtmlSU += "<li>"+data[i].hit+"</li>";
			}
			$("#nextViewSU").empty();
			$("#nextViewSU").append("▶");
			$("#List_menu_FSU").empty();
			$("#List_menu_FSU").append(addListHtmlSUpo);
			$("#List_menu_FSU").append(addListHtmlSU);
			$("#pViewSU").empty();
			$("#pViewSU").append(startNum-1);
			
			if(parseInt($("#pViewSU").text())==1){
				$("#prevViewSU").empty();
			} 
			/* console.log(addListHtmlSU); */
		}
	});
});
</script>

<div class="container">
	<div class="Menu_Bar_ASU">
		<h1 class="Menu_titleSU">건의 사항</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_containerSU">
		<ul class="List_menu_FSU" id="List_menu_FSU">
			<li>게시물 번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>날짜</li>
			<li>조회수</li>

		</ul><!-- 게시물 -->
		</div>
		 <div class="paging">
           <b id="prevViewSU"> ◀ </b>
           <b id="pViewSU"></b>
           <b id="nextViewSU" > ▶ </b>
            
        </div>
    
       <div class="Suggest_btn"><a href="/board/boardWrite?type=suggest"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Suggest_search">
		 <form action="/board/suggest/suggestSearch" id="searchFrmSU">
			<select name="searchKey">
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWordSU"/>
			<input type="hidden" name="type" value="suggest"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>