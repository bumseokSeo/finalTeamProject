<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/share/shareList.css" type="text/css"/>

<div class="container">
	<div class="Menu_Bar_AS">
		<h1 class="Menu_titleS">나눔 할래요</h1>
	</div>
	<div class="Menu_containerS">
		<div class="row" id="rowShare"></div>
	
		 <div class="paging">
           <b id="prevViewS">  </b>
           <b id="pViewS"></b>
           <b id="nextViewS"> > </b>
            
        </div>
    
       <div class="Share_btn"><a href="/board/boardWrite?type=share"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
		<br/><br/><br/>
		<div class="Share_search">
			 <form action="/board/share/shareSearch?type=share" id="searchFrmS">
				<select name="searchKey" id="SKey">
					<option value="title" selected="selected">제목</option>
					<option value="content">내용</option>
					<option value="username">작성자</option>
				</select>
				<input type="text" name="searchWord" id="searchWordS"/>
				<input type="hidden" name="type" value="share"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
	</div>
</div>
<br/>

<script>	
$(document).ready(function(){
		var startNum = 0; 
		var addListHtmlS = "";
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/share/shareLists';
			param = {
				"startNum" : startNum
			};
		}else if(pn=='shareSearch'){
			url = '/board/share/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/share/shareLists';
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
					addListHtmlS += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlS += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlS += "<h4 class='card-title text-center'>";
					if(data[i].likes>10){
					addListHtmlS +=	"<strong>★ </strong>";
					}
					addListHtmlS += data[i].title+"</h4>";
					addListHtmlS += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
					addListHtmlS += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
					addListHtmlS += "</div></div>";
				}
				if(data.length<12){
					$("#nextViewS").empty();
				} 
				if(startNum=1){
					$("#prevViewS").empty();
				} 
				$("#rowShare").append(addListHtmlS);
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
		var pn2 = pn.substring(pn.lastIndexOf('Search'));
		if(pn=='SubMenuSelect'){
			url = '/board/share/shareLists';
			console.log("다음페이지")
			param = {
				"startNum" : startNum*12
			};
		}else if(pn=='shareSearch'){
			url = '/board/share/shareLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
		}else if(pn2 =='Search'){
			url = '/board/share/shareLists';
			param = {
				"startNum" : startNum*12
			};
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtmlS += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
					addListHtmlS += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
					addListHtmlS += "<h4 class='card-title text-center'>";
					if(data[i].likes>10){
					addListHtmlS +=	"<strong>★ </strong>";
					}
					addListHtmlS += data[i].title+"</h4>";
					addListHtmlS += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
					addListHtmlS += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
					addListHtmlS += "</div></div>";
				}
				if(data.length<12){
					$("#nextViewS").empty();
				} 
				$("#prevViewS").empty();
				$("#rowShare").empty();
				$("#rowShare").append(addListHtmlS);
				$("#pViewS").empty();
				$("#pViewS").append(startNum+1);
				$("#prevViewS").append("<");
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
	var pn2 = pn.substring(pn.lastIndexOf('Search'));
	if(pn=='SubMenuSelect'){
		url = '/board/share/shareLists';
		console.log("이전페이지")
		param = {
			"startNum" : (startNum-1)*12-12
		};
	}else if(pn=='shareSearch'){
		url = '/board/share/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWord" : word
		};
	}else if(pn2 =='Search'){
		url = '/board/share/shareLists';
		param = {
			"startNum" : startNum*12
		};
	}
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'json',
		data :param,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtmlS += "<div class='col col-xl-3 col-lg-4 col-md-6 col-sm-12 cardDiv'><div class='card'>";
				addListHtmlS += "<a href='/board/boardView?boardno="+data[i].boardno+"'><img class='shareimg' src='"+data[i].filename1+"'></a></div>";
				addListHtmlS += "<h4 class='card-title text-center'>";
				if(data[i].likes>10){
				addListHtmlS +=	"<strong>★ </strong>";
				}
				addListHtmlS += data[i].title+"</h4>";
				addListHtmlS += "<div class='card-body'><p class='card-text text-end'>"+data[i].username+"</p>";
				addListHtmlS += "<p class='card-text text-end'><small class='text-muted'>"+data[i].writedate+"</small></p></div>";
				addListHtmlS += "</div></div>";
			}
			$("#nextViewS").empty();
			$("#nextViewS").append(">");
			$("#rowShare").empty();
			$("#rowShare").append(addListHtmlS);
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