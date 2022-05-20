<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/boardWrite.css" type="text/css"/>
  <script>
 $(function(){
	 $("#noticeFrm").submit(function(){
		 if($("#title").val()==''){
			 alert("제목을 입력해주세요");
			 return false;
		 }
		 
		 if(CKEDITOR.instances.ckeditor1.getData()==''){
			 alert("본문을 입력해주세요");
			 return false;
		 }
	 });
	 CKEDITOR.replace('content',{
		 filebrowerUploadMethod:'form',
         filebrowserImageUploadUrl : '/board/ckeditorImageUpload',
         height:500,
         extraPlugins:'autogrow'
  });
 });
</script>				
</head>
<body>
<div id="notice-wrapper"><!--  전체 틀  -->
<h1>건의글 수정</h1>
<hr/>
	<form method="post" action="/board/boardEditOk" id="noticeFrm" enctype="multipart/form-data">
  	  	<ul>
  	  		<li><input type="hidden" name="boardno" value="${vo.boardno}"/></li>
  	  		<li><input type="hidden" name="boardtype" value="suggest"/></li>
			<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요" value="${vo.title}"/></li>
			<li><textarea id="content" name="content">${vo.content}</textarea> </li>
				<li style="height:70px;"><input type='submit' value='등록' id="reviewsubmit" class="button01" style="margin-right:20px;"/></li>
		</ul>
	</form>
</div>


