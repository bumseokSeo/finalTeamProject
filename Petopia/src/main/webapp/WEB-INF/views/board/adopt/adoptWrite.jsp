<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/notice/noticeWrite.css" type="text/css"/>
  <script>
 $(function(){
	 $("#noticeFrm").submit(function(){
	 if($("#title").val()==''){
		 alert("제목을 입력해주세요");
		 return false;
	 }
	 
	 if($("#content").val()==''){
		 alert("본문을 입력해주세요");
		 return false;
	 }
	 });
 });
</script>				
</head>
<body>
<div id="notice-wrapper"><!--  전체 틀  -->
<h1>공지사항 작성</h1>
<hr/>
	<form method="post" action="/board/BoardWriteOk" id="noticeFrm" enctype="multipart/form-data">
  	  	<ul>
			<li><input type="hidden" name="boardtype" value="adopt"/></li>
			<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요"/></li>
			<li><textarea id="ckeditor1" name="content"></textarea> </li>
				<li style="height:70px;"><input type='submit' value='등록' id="reviewsubmit" class="button01" style="margin-right:20px;"/></li>
		</ul>
	</form>
</div>
<script>
     CKEDITOR.replace('ckeditor1');
</script>