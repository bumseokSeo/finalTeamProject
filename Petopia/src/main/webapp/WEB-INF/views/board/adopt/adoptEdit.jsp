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
		 
		 if(CKEDITOR.instances.content.getData()==''|| CKEDITOR.instances.content.getData().length ==0){
			 alert("본문을 입력해주세요");
			 $("#content").focus();
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
<h1>글 작성</h1>
<hr/>
	<form method="post" action="/board/BoardWriteOk" id="noticeFrm" enctype="multipart/form-data">
	<select name="category" class="select01">
				<option value="강아지" selected="selected">강아지</option>
				<option value="고양이">고양이</option>
				<option value="파충류 | 양서류">파충류 | 양서류</option>
				<option value="조류">조류</option>
				<option value="기타동물">기타동물</option>
			</select>
			<input type="text" name="breed" placeholder="종을 입력해주세요" class="input03" value="${vo.breed}"/>
  	  	<ul>
  	  		<li><input type="hidden" name="boardno" value="${vo.boardno}"/></li>
  	  		<li><input type="hidden" name="boardtype" value="adopt"/></li>
			<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요" value="${vo.title}"/></li>
			<li><textarea id="content" name="content">${vo.content}</textarea> </li>
				<li style="height:70px;"><input type='submit' value='등록' id="reviewsubmit" class="button01" style="margin-right:20px;"/></li>
		</ul>
	</form>
</div>


