<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/share/shareList.css" type="text/css"/>
<script>

//$("#searchFrm").submit(function() {
//   if ($("#searchWord").val() == "") {
//      alert("검색어를 입력하세요");
//      return false;
//   }
   
//});
	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlS = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if(pn='SubMenuSelect'){
			url = '/board/share/shareLists';
			param = {
				"startNum" : startNum 
			};
		}if(pn='shareSearch'){
			url = '/board/share/searchLists';
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
					addListHtmlS += "<div class='col-sm-3 Share'><div class='card Share_group'><a href='/board/boardView?boardno="+data[i].boardno+"'><img src='/img/Logo(main).png'></a>";
					addListHtmlS += "<div class='card-body'><div class='card-title Share_title'>"+data[i].title+"</div><div class='card-text Share_content'>";
					addListHtmlS += "<label class='Share_text'>"+data[i].userid+"</label><label class='Share_text'>"+data[i].writedate+"</label></div></div></div></div>";
				}
				if(data.length<19){
					$("#nextView").empty();
				} 
				if(startNum=1){
					$("#prevView").empty();
				} 
				$(".Menu_containerS").append(addListHtmlS);
				$("#pView").append(startNum);
			}
		});
});

$('#nextView').click(function(){
		var startNum = parseInt($("#pView").text());
		var addListHtmlS = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn='SubMenuSelect'){
			url = '/board/share/shareLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*19+1
			};
		}else if(pn='shareSearch'){
			url = '/board/share/shareLists';
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
					addListHtmlS += "<div class='col-sm-3 Share'><div class='card Share_group'><a href='/board/boardView?boardno="+data[i].boardno+"'><img src='/img/Logo(main).png'></a>";
					addListHtmlS += "<div class='card-body'><div class='card-title Share_title'>"+data[i].title+"</div><div class='card-text Share_content'>";
					addListHtmlS += "<label class='Share_text'>"+data[i].userid+"</label><label class='Share_text'>"+data[i].writedate+"</label></div></div></div></div>";
				}
				if(data.length<19){
					$("#nextView").empty();
				} 
				$("#prevView").empty();
				$(".Menu_containerS").empty();
				$(".Menu_containerS").append(addListHtmlS);
				$("#pView").empty();
				$("#pView").append(startNum+1);
				$("#prevView").append("◀");
				/* console.log(addListHtmlS); */
			}
		});
	   
		
	});
	
$('#prevView').click(function(){
	var startNum = parseInt($("#pView").text()); // 시작지점
	var addListHtmlS = "";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn='SubMenuSelect'){
		url = '/board/share/shareLists';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*19-19
		};
	}else if(pn='shareSearch'){
		url = '/board/share/searchLists';
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
				addListHtmlS += "<div class='col-sm-3 Share'><div class='card Share_group'><a href='/board/boardView?boardno="+data[i].boardno+"'><img src='/img/Logo(main).png'></a>";
				addListHtmlS += "<div class='card-body'><div class='card-title Share_title'>"+data[i].title+"</div><div class='card-text Share_content'>";
				addListHtmlS += "<label class='Share_text'>"+data[i].userid+"</label><label class='Share_text'>"+data[i].writedate+"</label></div></div></div></div>";
			}
			$("#nextView").empty();
			$("#nextView").append("▶");
			$(".Menu_containerS").empty();
			$(".Menu_containerS").append(addListHtmlS);
			$("#pView").empty();
			$("#pView").append(startNum-1);
			
			if(parseInt($("#pView").text())==1){
				$("#prevView").empty();
			} 
			/* console.log(addListHtmlS); */
		}
	});
});
</script>

<div class="container">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">나눔 게시판</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_containerS">

		</div>
		 <div class="paging" style="width:100%; text-align: center; font-size: 35px;">
           <b id="prevView"> ◀ </b>
           <b id="pView"></b>
           <b id="nextView" > ▶ </b>
            
        </div>
    
       <div class="Share_btn"><a href="/board/boardWrite"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Share_search">
		 <form action="/board/notice/noticeSearch" id="searchFrm">
			<select name="searchKey">
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="hidden" name="type" value="notice"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>