<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/info/infoList.css" type="text/css"/>
<div class="container">
	<div class="Menu_Bar_AI">
		<h1 class="Menu_titleI">정보공유</h1>
	</div>
	<div class="Menu_containerI">
		<ul class="List_menu_FI" id="List_menu_FI">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회</li>

		</ul><!-- 게시물 -->
		
		 <div class="paging">
           <b id="prevViewI"> ◀ </b>
           <b id="pViewI"></b>
           <b id="nextViewI" > ▶ </b>
            
        </div>
    
       <div class="info_btn"><a href="/board/boardWrite?type=info"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="info_search">
		 <form action="/board/info/infoSearch?type=info" id="searchFrmI">
			<select name="searchKey">
				<option value="title" selected="selected">제목</option>
					<option value="content">내용</option>
					<option value="username">작성자</option>
			</select>
			<input type="text" name="searchWord" id="searchWordI"/>
			<input type="hidden" name="type" value="info"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
</div>
</div>
<br/>

<script>
$("#searchFrmI").submit(function() {
   if ($("#searchWordI").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlI = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'))
		if(pn=='SubMenuSelect'){
			url = '/board/info/infoLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn=='infoSearch'){
			url = '/board/info/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/info/infoLists';
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
				var date = new Date();
				var year = date.getFullYear();
				var month = new String(('0' + (date.getMonth() + 1)).slice(-2));
				var day = new String(('0' + date.getDate()).slice(-2));
				
				for (var i = 0; i < data.length; i++) {
					addListHtmlI += "<li>"+data[i].boardno+"</li>";
					addListHtmlI += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title;
					if(data[i].reviewcnt != 0){
						addListHtmlI += " [" + data[i].reviewcnt+"]";
					}
					addListHtmlI += "</a></li><li>"+data[i].username+"</li>"
					if(data[i].writedate.startsWith(year+"-"+month+"-"+day)){
						addListHtmlI += "<li>"+data[i].writedate.substr(-8, 5)+"</li>";
					}else{
						addListHtmlI += "<li>"+data[i].writedate.substr(0, 10)+"</li>";
					}
					
					addListHtmlI += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextViewI").empty();
				} 
				if(startNum=1){
					$("#prevViewI").empty();
				} 
				$("#List_menu_FI").append(addListHtmlI);
				$("#pViewI").append(startNum);
			}
		});
});

$('#nextViewI').click(function(){
		var startNum = parseInt($("#pViewI").text());
		var addListHtmlI = "";
		var addListHtmlIpo = "";
					addListHtmlIpo += "<li>번호</li>";
					addListHtmlIpo += "<li>제목</li>";
					addListHtmlIpo += "<li>작성자</li>";
					addListHtmlIpo += "<li>작성일</li>";
					addListHtmlIpo += "<li>조회</li>";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/info/infoLists';
			param = {
				"startNum" : startNum*18+1
			};
		}else if(pn=='infoSearch'){
			url = '/board/info/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/info/infoLists';
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
				var date = new Date();
				var year = date.getFullYear();
				var month = new String(('0' + (date.getMonth() + 1)).slice(-2));
				var day = new String(('0' + date.getDate()).slice(-2));
				
				for (var i = 0; i < data.length; i++) {
					addListHtmlI += "<li>"+data[i].boardno+"</li>";
					addListHtmlI += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title;
					if(data[i].reviewcnt != 0){
						addListHtmlI += " [" + data[i].reviewcnt+"]";
					}
					addListHtmlI += "</a></li><li>"+data[i].username+"</li>"
					if(data[i].writedate.startsWith(year+"-"+month+"-"+day)){
						addListHtmlI += "<li>"+data[i].writedate.substr(-8, 5)+"</li>";
					}else{
						addListHtmlI += "<li>"+data[i].writedate.substr(0, 10)+"</li>";
					}
					
					addListHtmlI += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<19){
					$("#nextViewI").empty();
				} 
				$("#prevViewI").empty();
				$("#List_menu_FI").empty();
				$("#List_menu_FI").append(addListHtmlIpo);
				$("#List_menu_FI").append(addListHtmlI);
				$("#pViewI").empty();
				$("#pViewI").append(startNum+1);
				$("#prevViewI").append("◀");
			}
		});
	   
		
	});
	
$('#prevViewI').click(function(){
	var startNum = parseInt($("#pViewI").text()); // 시작지점
	var addListHtmlI = "";
	var addListHtmlIpo = "";
				addListHtmlIpo += "<li>번호</li>";
				addListHtmlIpo += "<li>제목</li>";
				addListHtmlIpo += "<li>작성자</li>";
				addListHtmlIpo += "<li>작성일</li>";
				addListHtmlIpo += "<li>조회</li>";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	var pn2 = pn.substring(pn.lastIndexOf('Search'));
	if(pn=='SubMenuSelect'){
		url = '/board/info/infoLists';
		param = {
			"startNum" : (startNum-1)*18-18
		};
	}else if(pn=='infoSearch'){
		url = '/board/info/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn2 =='Search'){
		url = '/board/info/infoLists';
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
			var date = new Date();
			var year = date.getFullYear();
			var month = new String(('0' + (date.getMonth() + 1)).slice(-2));
			var day = new String(('0' + date.getDate()).slice(-2));
			
			for (var i = 0; i < data.length; i++) {
				addListHtmlI += "<li>"+data[i].boardno+"</li>";
				addListHtmlI += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title;
				if(data[i].reviewcnt != 0){
					addListHtmlI += " [" + data[i].reviewcnt+"]";
				}
				addListHtmlI += "</a></li><li>"+data[i].username+"</li>"
				if(data[i].writedate.startsWith(year+"-"+month+"-"+day)){
					addListHtmlI += "<li>"+data[i].writedate.substr(-8, 5)+"</li>";
				}else{
					addListHtmlI += "<li>"+data[i].writedate.substr(0, 10)+"</li>";
				}
				
				addListHtmlI += "<li>"+data[i].hit+"</li>";
			}
			$("#nextViewI").empty();
			$("#nextViewI").append("▶");
			$("#List_menu_FI").empty();
			$("#List_menu_FI").append(addListHtmlIpo);
			$("#List_menu_FI").append(addListHtmlI);
			$("#pViewI").empty();
			$("#pViewI").append(startNum-1);
			
			if(parseInt($("#pViewI").text())==1){
				$("#prevViewI").empty();
			} 
		}
	});
   
	
});
</script>