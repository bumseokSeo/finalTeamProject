<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/boast/boastList.css" type="text/css"/>

<div class="container">
	<div class="Menu_Bar_AB">
		<h1 class="Menu_titleB">자랑 할래요</h1>
	</div>
	<div class="Menu_containerB">
		<div class="row" id="rowBoast"></div>
	
		 <div class="paging">
           <b id="prevViewB"> ◀ </b>
           <b id="pViewB"></b>
           <b id="nextViewB"> ▶ </b>
            
        </div>
    
       <div class="Boast_btn"><a href="/board/boardWrite?type=boast"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/><br/>
	<div class="Boast_search">
		 <form action="/board/boast/boastSearch?type=boast" id="searchFrmB">
			<select name="searchKey" id="SKey">
				<option value="title" selected="selected">제목</option>
				<option value="content">내용</option>
				<option value="username">작성자</option>
			</select>
			<input type="text" name="searchWord" id="searchWordB"/>
			<input type="hidden" name="type" value="boast"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
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
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/boast/boastLists';
			param = {
				"startNum" : startNum
			};
		}else if(pn=='boastSearch'){
			url = '/board/boast/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/boast/boastLists';
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
					addListHtmlB += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlB += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlB += "<h4 class='card-title text-center'>";
					if(data[i].likes>10){
					addListHtmlB +=	"<strong>★</strong>";
					}
					addListHtmlB += data[i].title+"</h4>";
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
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/boast/boastLists';
			param = {
				"startNum" : startNum*12+1
			};
		}else if(pn=='boastSearch'){
			url = '/board/boast/boastLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/boast/boastLists';
			param = {
				"startNum" : startNum*12+1
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
					addListHtmlB += "<h4 class='card-title text-center'>";
					if(data[i].likes>10){
					addListHtmlB +=	"<strong>★</strong>";
					}
					addListHtmlB += data[i].title+"</h4>";
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
	var pn2 = pn.substring(pn.lastIndexOf('Search'));
	if(pn=='SubMenuSelect'){
		url = '/board/boast/boastLists';
		param = {
			"startNum" : (startNum-1)*12-12
		};
	}else if(pn=='boastSearch'){
		url = '/board/boast/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn2 =='Search'){
		url = '/board/boast/boastLists';
		param = {
			"startNum" : startNum*12-12
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
				addListHtmlB += "<h4 class='card-title text-center'>";
				if(data[i].likes>10){
				addListHtmlB +=	"<strong>★</strong>";
				}
				addListHtmlB += data[i].title+"</h4>";
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