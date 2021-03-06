<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<link rel="stylesheet" href="/css/admin/admin_animalInfo_Edit.css" type="text/css"/>

<script>
$(function(){
	CKEDITOR.replace("content",{
		width :'100%',
		allowedContent:true,
		toolbar :[['NewPage','Preview','Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','-',
		'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Outdent','Indent','HorizontalRule','Link','Unlink','-',
		'Find','Replace','SelectAll','Image','Flash','Table','SpecialChar'],
		'/',['Styles','Format','Font','FontSize','Undo','Redo'],['TextColor','BGColor'],['Cut','Copy','Paste','PasteText'],['Source']],
		enterMode:CKEDITOR.ENTER_BR
	});
	
	CKEDITOR.replace("distinction",{
		width :'100%',	
		allowedContent:true,
		toolbar :[['NewPage','Preview','Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','-',
		'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Outdent','Indent','HorizontalRule','Link','Unlink','-',
		'Find','Replace','SelectAll','Image','Flash','Table','SpecialChar'],
		'/',['Styles','Format','Font','FontSize','Undo','Redo'],['TextColor','BGColor'],['Cut','Copy','Paste','PasteText'],['Source']],
		enterMode:CKEDITOR.ENTER_BR
	});
	
	CKEDITOR.replace("disease",{
		width :'100%',	
		allowedContent:true,
		toolbar :[['NewPage','Preview','Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','-',
		'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Outdent','Indent','HorizontalRule','Link','Unlink','-',
		'Find','Replace','SelectAll','Image','Flash','Table','SpecialChar'],
		'/',['Styles','Format','Font','FontSize','Undo','Redo'],['TextColor','BGColor'],['Cut','Copy','Paste','PasteText'],['Source']],
		enterMode:CKEDITOR.ENTER_BR
	});
	
	
	$('#filename1').change(function() {//이미지 첨부되면 실행
		
		setImage(this, '#preview1');
	});
	function setImage(input, preview1) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(preview1).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	
	$('#filename2').change(function() {//이미지 첨부되면 실행
		
		setImage(this, '#preview2');
	});
	function setImage(input, preview2) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(preview2).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	
	$('#filename3').change(function() {//이미지 첨부되면 실행
		
		setImage(this, '#preview3');
	});
	function setImage(input, preview3) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(preview3).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	
	
	var fileCount = ${fileCount};
	
	$("#writeFrm b").click(function(){
		$(this).parent().css("display", "none");
		$(this).parent().next().attr("name", "delFile");
		$(this).parent().next().next().attr("type", "file");
		$(this).parent().prev().attr("src","${url}/img/Logo.png");
		fileCount--;
	});
	
	$("#writeFrm").submit(function(){
		
		if($("#category").val()==''){
			alert("category를 선택하세요.");
			$("#category").focus;
			return false;
		}
		if($("#breed").val()==''){
			alert("breed를 입력하세요.");
			$("#breed").focus;
			return false;
		}
		var text_data = CKEDITOR.instances.content.getData();
		if(text_data===''){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		
		text_data = CKEDITOR.instances.distinction.getData();
		if(text_data===''){
			alert("내용을 입력하세요.");
			$("#distinction").focus();
			return false;
		}
		
		text_data = CKEDITOR.instances.disease.getData();
		if(text_data===''){
			alert("내용을 입력하세요.");
			$("#disease").focus();
			return false;
		}
		
		if($("#filename1").val()!=''){
			fileCount++;
		}
		if($("#filename2").val()!=''){
			fileCount++;
		}
		if($("#filename3").val()!=''){
			fileCount++;
		}
		if(fileCount<3){
			alert("사진을 등록하세요.");
			return false;
		}
		
	});
	
	
	
	
});

</script>

<div class="container">
	<ul class="tab_title">
		<li><a href="/admin/admin_notice">공지사항 관리</a></li>
		<li><a href="/admin/admin_memberList">회원 관리</a></li>
		<li><a href="/admin/admin_board?searchKey=all">게시판 관리</a></li>
		<li><a href="/admin/admin_adopt?searchKey=all">입양 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
		<li><a href="/admin/admin_boardReview?searchKey=all">게시판 리뷰 관리</a></li>
		<li><a href="/admin/admin_shopReview?searchKey=all">동물병원 리뷰 관리</a></li>
	</ul>
	
	<div class="tab_content">
		<ul class="tab_title2" >
			<li style="float: left;"><a href="/admin/admin_notice">공지사항</a></li>
			<li><a href="/admin/admin_memberList">회원</a></li>
			<li><a href="/admin/admin_board?searchKey=all">게시판</a></li>
			<li><a href="/admin/admin_adopt?searchKey=all">입양</a></li>
			<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보</a></li>
			<li><a href="/admin/admin_boardReview?searchKey=all">게시판 리뷰</a></li>
			<li><a href="/admin/admin_shopReview?searchKey=all">동물병원 리뷰</a></li>
		</ul>
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a> > <a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a> > <a href="/admin/admin_animalInfo_Edit?breedkey=${vo.breed}">수정</a>
		</div><br/><br/>
		<form id="writeFrm" style="width:100%;" method="post" action="${url}/admin/animalInfoEditOk" enctype="multipart/form-data">
			<div>
				
			</div><br/>
			<input type="hidden" name="breed" value="${vo.breed}"/>
			<div id="imgDiv1" style="width:35%; float:left; ">
				<c:if test="${vo.filename1 == null || vo.filename1 == ''}">
					<img src='${url}/img/Logo.png' id="preview1" class="img-thumbnail"/>
					<input type="file" class="form-control-file border" name="imgName" id="filename1" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
				</c:if>
				<c:if test="${vo.filename1 != null && vo.filename1 != ''}">
					<img src='${url}/img/animalInfo/${vo.filename1}' id="preview1" class="img-thumbnail"/>
					<div>${vo.filename1} &nbsp; <b>X</b></div>
					<input type="hidden" name="" value="${vo.filename1}"/>
					<input type="hidden" class="form-control-file border" name="imgName" id="filename1" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
				</c:if>	
				
			</div>
			<div id="contentDiv" style="width:63%;float:right;">
				<span>category</span>
				<select name='category' id='category'>
					<option value=''>선택</option>
					<option <c:if test="${vo.category=='강아지'}">selected</c:if>>강아지</option>
					<option <c:if test="${vo.category=='고양이'}">selected</c:if>>고양이</option>
					<option <c:if test="${vo.category=='파충류,양서류'}">selected</c:if>>파충류,양서류</option>
					<option <c:if test="${vo.category=='조류'}">selected</c:if>>조류</option>
					<option <c:if test="${vo.category=='기타'}">selected</c:if>>기타</option>
				</select>
				<span>breed</span>
				<input style="margin-bottom:10px;" type="text" name="breed" id="breed" value="${vo.breed}" disabled="disabled" />
				<textarea name="content" id="content">${vo.content}</textarea>
			</div>
			
			<div class="bar">
				<div class="d1">
					<span class="barcontent">특징</span>
				</div>				
			</div>
			
			<div id="contentDiv" style="width:63%;float:left;">
				<textarea name="distinction" id="distinction">${vo.distinction}</textarea>
			</div>
			<div id="imgDiv1" style="width:35%; float:right;">
			
				<c:if test="${vo.filename2 == null || vo.filename2 == ''}">
					<img src='${url}/img/Logo.png' id="preview2" class="img-thumbnail"/>
					<input type="file" class="form-control-file border" name="imgName" id="filename2" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
				</c:if>
				<c:if test="${vo.filename2 != null && vo.filename2 != ''}">
					<img src='${url}/img/animalInfo/${vo.filename2}' id="preview2" class="img-thumbnail"/>
					<div>${vo.filename2} &nbsp; <b>X</b></div>
					<input type="hidden" name="" value="${vo.filename2}"/>
					<input type="hidden" class="form-control-file border" name="imgName" id="filename2" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
				</c:if>	
	
			</div>
			
			<div class="bar">
				<div>
					<span class="barcontent">질병정보</span>
				</div>
			</div>
			
			<div id="contentDiv" style="width:63%;float:left;">
				<textarea name="disease" id="disease">${vo.disease}</textarea>
			</div>
			<div id="imgDiv1" style="width:35%; float:right;">
				<c:if test="${vo.filename3 == null || vo.filename3 == ''}">
					<img src='${url}/img/Logo.png' id="preview3" class="img-thumbnail"/>
					<input type="file" class="form-control-file border" name="imgName" id="filename3" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
				</c:if>
				<c:if test="${vo.filename3 != null && vo.filename3 != ''}">
					<img src='${url}/img/animalInfo/${vo.filename3}' id="preview3" class="img-thumbnail"/>
					<div>${vo.filename3} &nbsp; <b>X</b></div>
					<input type="hidden" name="" value="${vo.filename3}"/>
					<input type="hidden" class="form-control-file border" name="imgName" id="filename3" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
				</c:if>	
			</div>
			
			<div class="bar_submit">
				<!-- <input type="reset" id="resetBtn" value="취소"/> -->
				<input type="submit" id="submitBtn" value="수정"/>
			</div>
			
		</form>
		
	</div>

</div>