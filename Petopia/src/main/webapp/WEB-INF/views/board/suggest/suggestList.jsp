<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/suggest/suggestList.css" type="text/css"/>

<div class="container">
	<div class="Menu_Bar_ASU">
		<h1 class="Menu_titleSU">건의 사항</h1>
	</div>
	<div class="Menu_containerSU">
		<ul class="List_menu_FSU" id="List_menu_FSU">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회</li>

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
		 <form action="/board/suggest/suggestSearch?type=suggest" id="searchFrmSU">
			<select name="searchKey">
				<option value="title" selected="selected">제목</option>
				<option value="content">내용</option>
				<option value="username">작성자</option>
			</select>
			<input type="text" name="searchWord" id="searchWordSU"/>
			<input type="hidden" name="type" value="suggest"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>

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
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWordSU');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/suggest/suggestLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn=='suggestSearch'){
			url = '/board/suggest/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWordSU" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/suggest/suggestLists';
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
					addListHtmlSU += "<li>"+data[i].suggestno+"</li>";
					if(data[i].secret=="N"){
						addListHtmlSU += "<li style='color:grey;'>비공개 글 입니다.</li>";
					}else{
						addListHtmlSU += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title;
						if(data[i].reviewcnt != 0){
							addListHtmlSU += " [" + data[i].reviewcnt+"]";
						}
						addListHtmlSU += "</a></li>";
					}
					addListHtmlSU += "<li>"+data[i].username+"</li>";
					if(data[i].writedate.startsWith(year+"-"+month+"-"+day)){
						addListHtmlSU += "<li>"+data[i].writedate.substr(-8, 5)+"</li>";
						
					}else{
						addListHtmlSU += "<li>"+data[i].writedate.substr(0, 10)+"</li>";
					}
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
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/suggest/suggestLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*18+1
			};
		}else if(pn=='suggestSearch'){
			url = '/board/suggest/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWordSU" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/suggest/suggestLists';
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
					addListHtmlSU += "<li>"+data[i].suggestno+"</li>";
					if(data[i].secret=="N"){
						addListHtmlSU += "<li style='color:grey;'>비공개 글 입니다.</li>";
					}else{
						addListHtmlSU += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title;
						if(data[i].reviewcnt != 0){
							addListHtmlSU += " [" + data[i].reviewcnt+"]";
						}
						addListHtmlSU += "</a></li>";
					}
					addListHtmlSU += "<li>"+data[i].username+"</li>";
					if(data[i].writedate.startsWith(year+"-"+month+"-"+day)){
						addListHtmlSU += "<li>"+data[i].writedate.substr(-8, 5)+"</li>";
						
					}else{
						addListHtmlSU += "<li>"+data[i].writedate.substr(0, 10)+"</li>";
					}
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
	var pn2 = pn.substring(pn.lastIndexOf('Search'));
	if(pn=='SubMenuSelect'){
		url = '/board/suggest/suggestLists';
		console.log("이전페이지")
		param = {
			"startNum" : startNum*18-18
		};
	}else if(pn=='suggestSearch'){
		url = '/board/suggest/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWordSU" : word
		};
	}else if(pn2 =='Search'){
		url = '/board/suggest/suggestLists';
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
				addListHtmlSU += "<li>"+data[i].suggestno+"</li>";
				if(data[i].secret=="N"){
					addListHtmlSU += "<li style='color:grey;'>비공개 글 입니다.</li>";
				}else{
					addListHtmlSU += "<li><a href='/board/boardView?boardno="+data[i].boardno+"'>"+data[i].title;
					if(data[i].reviewcnt != 0){
						addListHtmlSU += " [" + data[i].reviewcnt+"]";
					}
					addListHtmlSU += "</a></li>";
				}
				addListHtmlSU += "<li>"+data[i].username+"</li>";
				if(data[i].writedate.startsWith(year+"-"+month+"-"+day)){
					addListHtmlSU += "<li>"+data[i].writedate.substr(-8, 5)+"</li>";
					
				}else{
					addListHtmlSU += "<li>"+data[i].writedate.substr(0, 10)+"</li>";
				}
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

