<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/adopt/adoptList.css" type="text/css"/>
<div class="container">
	<div class="Menu_Bar_AD">
		<h1 class="Menu_titleD">입양게시판</h1>
	</div>
		<div class="Menu_containerD">
			<div class="row" id="rowAdopt"></div>
		
		 <div class="paging" style="width:100%; text-align: center; font-size: 35px;">
           <b id="prevViewD" > ◀ </b>
           <b id="pViewD" ></b>
           <b id="nextViewD" > ▶ </b>
            
        </div>
    
       <div class="Adopt_btn"><a href="/board/boardWrite?type=adopt"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
		<br/><br/><br/>
		<div class="Adopt_search">
			 <form action="/board/adopt/adoptSearch" id="searchFrmD">
				<select name="searchKey">
					<option value="title" selected="selected">제목</option>
					<option value="username">글쓴이</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWordD"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
	</div>
	
</div>
<br/>

<script>	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlD = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if(pn=='adoptList'){
			url = '/board/adopt/adoptListMethod';
			param = {
				"startNum" : startNum
			};
		}else if(pn=='adoptSearch'){
			url = '/board/adopt/searchLists';
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
					addListHtmlD += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlD += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='adoptimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlD += "<h4 class='card-title text-center'>"+data[i].title+"</h4>";
					addListHtmlD += "<h5 style='font-weight:bold; text-align:center; margin-bottom:0px;'>"+data[i].breed+"</h5>";
					addListHtmlD += "<div class='card-body'><span style='float:left;'>"+data[i].category+"</span><p class='card-text text-end'>"+data[i].username+"</p>";
					addListHtmlD += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
					addListHtmlD += "</div></div>";
				}
				if(data.length<9){
					$("#nextViewD").empty();
				} 
				if(startNum=1){
					$("#prevViewD").empty();
				} 
				$("#rowAdopt").append(addListHtmlD);
				$("#pViewD").append(startNum);
			}
		});
});

$('#nextViewD').click(function(){
		var startNum = parseInt($("#pViewD").text());
		var addListHtmlD = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn=='adoptList'){
			url = '/board/adopt/adoptListMethod';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*12+1
			};
		}else if(pn=='adoptSearch'){
			url = '/board/adopt/adoptListMethod';
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
					addListHtmlD += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlD += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlD += "<h4 class='card-title text-center'>"+data[i].title+"</h4>";
					addListHtmlD += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
					addListHtmlD += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
					addListHtmlD += "</div></div>";
				}
				if(data.length<8){
					$("#nextViewD").empty();
				} 
				$("#prevViewD").empty();
				$("#rowAdopt").empty();
				$("#rowAdopt").append(addListHtmlD);
				$("#pViewD").empty();
				$("#pViewD").append(startNum+1);
				$("#prevViewD").append("◀");
				/* console.log(addListHtmlD); */
			}
		});
	   
		
	});
	
$('#prevViewD').click(function(){
	var startNum = parseInt($("#pViewD").text()); // 시작지점
	var addListHtmlD = "";
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn=='adoptList'){
		url = '/board/adopt/adoptListMethod';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*12-12
		};
	}else if(pn=='adoptSearch'){
		url = '/board/adopt/searchLists';
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
				addListHtmlD += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
				addListHtmlD += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
				addListHtmlD += "<h4 class='card-title text-center'>"+data[i].title+"</h4>";
				addListHtmlD += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
				addListHtmlD += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
				addListHtmlD += "</div></div>";
			}
			$("#nextViewD").empty();
			$("#nextViewD").append("▶");
			$("#rowAdopt").empty();
			$("#rowAdopt").append(addListHtmlD);
			$("#pViewD").empty();
			$("#pViewD").append(startNum-1);
			
			if(parseInt($("#pViewD").text())==1){
				$("#prevViewD").empty();
			} 
			/* console.log(addListHtmlD); */
		}
	});
});

$("#searchFrmD").submit(function() {
	  if ($("#searchWordD").val() == "") {
	     alert("검색어를 입력하세요");
	     return false;
	   }
	   
	});
</script>
