<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/boast/boastList.css" type="text/css"/>

<div class="container">
	<div class="Menu_Bar_AB">
		<h1 class="Menu_titleB">자랑 게시판</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_containerB">
		<div class="row" id="rowBoast"></div>
	</div>
		 <div class="paging">
           <b id="prevViewB"> ◀ </b>
           <b id="pViewB"></b>
           <b id="nextViewB"> ▶ </b>
            
        </div>
    
       <div class="Boast_btn"><a href="/board/boardWrite?type=boast"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Boast_search">
		 <form action="/board/boast/boastSearch" id="searchFrmB">
			<select name="searchKey">
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWordB"/>
			<input type="hidden" name="type" value="Boast"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>
<br/>

<script>	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlB = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn='SubMenuSelect'){
			url = '/board/boast/boastLists';
			param = {
				"startNum" : startNum
			};
		}else if(pn='boastSearch'){
			url = '/board/boast/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtmlB += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlB += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlB += "<h4 class='card-title text-center'>"+data[i].title+"</h4>";
					addListHtmlB += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
					addListHtmlB += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
					addListHtmlB += "</div></div>";
				}
				if(data.length<12){
					$("#nextViewB").empty();
				} 
				if(startNum=1){
					$("#prevViewB").empty();
				} 
				$("#rowBoast").append(addListHtmlB);
				$("#pViewB").append(startNum);
			}
		});
});

$('#nextViewB').click(function(){
		var startNum = parseInt($("#pViewB").text());
		var addListHtmlB = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn='SubMenuSelect' && $("#UserBoastShow").css('display')=='block'){
			url = '/board/boast/boastLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*12+1
			};
		}else if(pn='boastSearch'){
			url = '/board/boast/boastLists';
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
					addListHtmlB += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlB += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlB += "<h4 class='card-title text-center'>"+data[i].title+"</h4>";
					addListHtmlB += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
					addListHtmlB += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
					addListHtmlB += "</div></div>";
				}
				if(data.length<12){
					$("#nextViewB").empty();
				} 
				$("#prevViewB").empty();
				$("#rowBoast").empty();
				$("#rowBoast").append(addListHtmlB);
				$("#pViewB").empty();
				$("#pViewB").append(startNum+1);
				$("#prevViewB").append("◀");
				/* console.log(addListHtmlB); */
			}
		});
	   
		
	});
	
$('#prevViewB').click(function(){
	var startNum = parseInt($("#pViewB").text()); // 시작지점
	var addListHtmlB = "";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn='SubMenuSelect' && $("#UserBoastShow").css('display')=='block'){
		url = '/board/boast/boastLists';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*12-12
		};
	}else if(pn='boastSearch'){
		url = '/board/boast/searchLists';
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
				addListHtmlB += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
				addListHtmlB += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
				addListHtmlB += "<h4 class='card-title text-center'>"+data[i].title+"</h4>";
				addListHtmlB += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
				addListHtmlB += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
				addListHtmlB += "</div></div>";
			}
			$("#nextViewB").empty();
			$("#nextViewB").append("▶");
			$("#rowBoast").empty();
			$("#rowBoast").append(addListHtmlB);
			$("#pViewB").empty();
			$("#pViewB").append(startNum-1);
			
			if(parseInt($("#pViewB").text())==1){
				$("#prevViewB").empty();
			} 
			/* console.log(addListHtmlB); */
		}
	});
});

$("#searchFrmB").submit(function() {
	  if ($("#searchWordB").val() == "") {
	     alert("검색어를 입력하세요");
	     return false;
	   }
	   
	});
</script>