<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/share/shareList.css" type="text/css"/>

<div class="container">
	<div class="Menu_Bar_AS">
		<h1 class="Menu_titleS">나눔 게시판</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_containerS">

		</div>
		 <div class="paging">
           <b id="prevViewS"> ◀ </b>
           <b id="pViewS"></b>
           <b id="nextViewS"> ▶ </b>
            
        </div>
    
       <div class="Share_btn"><a href="/board/boardWrite?type=share"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Share_search">
		 <form action="/board/notice/noticeSearch" id="searchFrmS">
			<select name="searchKey">
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWordS"/>
			<input type="hidden" name="type" value="share"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>

<script>	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlS = "";
		 console.log("나눔"); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if(pn='SubMenuSelect' && $("#UserShareShow").css('display')=='block'){
			url = '/board/share/shareLists';
			param = {
				"startNum" : startNum
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
					addListHtmlS += "<div class='PostArea'><div class='PostImg_Area'><a href='/board/boardView?boardno="+data[i].boardno+"'><img src='"+data[i].filename1+"'></a></div>";
					addListHtmlS += "<div class='Post_body'><div class='Post_body_title'>"+data[i].title+"</div><div class='Post_body_content'>";
					addListHtmlS += "<label class='Share_text'>"+data[i].userid+"</label><label class='Share_text'>"+data[i].writedate+"</label></div></div></div>";
				}
				if(data.length<8){
					$("#nextViewS").empty();
				} 
				if(startNum=1){
					$("#prevViewS").empty();
				} 
				$(".Menu_containerS").append(addListHtmlS);
				$("#pViewS").append(startNum);
			}
		});
});

$('#nextViewS').click(function(){
		var startNum = parseInt($("#pViewS").text());
		var addListHtmlS = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn='SubMenuSelect' && $("#UserShareShow").css('display')=='block'){
			url = '/board/share/shareLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*8+1
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
					addListHtmlS += "<div class='PostArea'><div class='PostImg_Area'><a href='/board/boardView?boardno="+data[i].boardno+"'><img src='"+data[i].filename1+"'></a></div>";
					addListHtmlS += "<div class='Post_body'><div class='Post_body_title'>"+data[i].title+"</div><div class='Post_body_content'>";
					addListHtmlS += "<label class='Share_text'>"+data[i].userid+"</label><label class='Share_text'>"+data[i].writedate+"</label></div></div></div>";
				}
				if(data.length<8){
					$("#nextViewS").empty();
				} 
				$("#prevViewS").empty();
				$(".Menu_containerS").empty();
				$(".Menu_containerS").append(addListHtmlS);
				$("#pViewS").empty();
				$("#pViewS").append(startNum+1);
				$("#prevViewS").append("◀");
				/* console.log(addListHtmlS); */
			}
		});
	   
		
	});
	
$('#prevViewS').click(function(){
	var startNum = parseInt($("#pViewS").text()); // 시작지점
	var addListHtmlS = "";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn='SubMenuSelect' && $("#UserShareShow").css('display')=='block'){
		url = '/board/share/shareLists';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*8-8
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
				addListHtmlS += "<div class='PostArea'><div class='PostImg_Area'><a href='/board/boardView?boardno="+data[i].boardno+"'><img src='"+data[i].filename1+"'></a></div>";
				addListHtmlS += "<div class='Post_body'><div class='Post_body_title'>"+data[i].title+"</div><div class='Post_body_content'>";
				addListHtmlS += "<label class='Share_text'>"+data[i].userid+"</label><label class='Share_text'>"+data[i].writedate+"</label></div></div></div>";
			}
			$("#nextViewS").empty();
			$("#nextViewS").append("▶");
			$(".Menu_containerS").empty();
			$(".Menu_containerS").append(addListHtmlS);
			$("#pViewS").empty();
			$("#pViewS").append(startNum-1);
			
			if(parseInt($("#pViewS").text())==1){
				$("#prevViewS").empty();
			} 
			/* console.log(addListHtmlS); */
		}
	});
});

$("#searchFrmS").submit(function() {
	  if ($("#searchWordS").val() == "") {
	     alert("검색어를 입력하세요");
	     return false;
	   }
	   
	});
</script>