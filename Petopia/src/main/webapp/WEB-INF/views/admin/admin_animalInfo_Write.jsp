<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<link rel="stylesheet" href="/css/admin/admin_animalInfo_Write.css" type="text/css"/>

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
		
	$("#writeFrm").submit(function(){
		if($("#filename1").val()==''){
			alert("사진을 등록하세요.");
			$("#filename1").focus;
			return false;
		}
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
		if($("#filename2").val()==''){
			alert("사진을 등록하세요.");
			$("#filename2").focus;
			return false;
		}
		
		text_data = CKEDITOR.instances.disease.getData();
		if(text_data===''){
			alert("내용을 입력하세요.");
			$("#disease").focus();
			return false;
		}
		if($("#filename3").val()==''){
			alert("사진을 등록하세요.");
			$("#filename3").focus;
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
		<li><a href="#">입양 게시판 관리</a></li>
		<li><a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a></li>
		<li><a href="/admin/admin_boardReview?searchKey=all">게시판 리뷰 관리</a></li>
		<li><a href="#">동물병원 리뷰 관리</a></li>
	</ul>
	
	<div class="tab_content">
		<div style="float:right;">
			<a href="/admin/adminMain">관리자페이지</a> > <a href="/admin/admin_animalInfo?searchKey=all">반려동물 정보 관리</a> > <a href="/admin/admin_animalInfo_Write">글쓰기</a>
		</div><br/><br/>
		<form id="writeFrm" style="width:100%;" method="post" action="${url}/admin/animalInfoWriteOk" enctype="multipart/form-data">
			<div>
				
			</div><br/>
			
			<div id="imgDiv1" style="width:35%; float:left; ">
				<img src='${url}/img/Logo.png' id="preview1" class="img-thumbnail"/>
				<input type="file" class="form-control-file border" name="imgName" id="filename1" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
			</div>
			<div id="contentDiv" style="width:63%;float:right;">
				<span>category</span>
				<select name='category' id='category'>
					<option value=''>선택</option>
					<option>강아지</option>
					<option>고양이</option>
					<option>파충류,양서류</option>
					<option>조류</option>
					<option>기타</option>
				</select>
				<span>breed</span>
				<input style="margin-bottom:10px;" type="text" name="breed" id="breed"/>
				<textarea name="content" id="content"></textarea>
			</div>
			
			<div class="bar">
				<div class="d1">
					<span class="barcontent">특징</span>
				</div>				
			</div>
			
			<div id="contentDiv" style="width:63%;float:left;">
				<textarea name="distinction" id="distinction"></textarea>
			</div>
			<div id="imgDiv1" style="width:35%; float:right;">
				<img src='${url}/img/Logo.png' id="preview2" class="img-thumbnail"/>
				<input type="file" class="form-control-file border" name="imgName" id="filename2" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
			</div>
			
			<div class="bar">
				<div>
					<span class="barcontent">질병정보</span>
				</div>
			</div>
			
			<div id="contentDiv" style="width:63%;float:left;">
				<textarea name="disease" id="disease"></textarea>
			</div>
			<div id="imgDiv1" style="width:35%; float:right;">
				<img src='${url}/img/Logo.png' id="preview3" class="img-thumbnail"/>
				<input type="file" class="form-control-file border" name="imgName" id="filename3" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/>
			</div>
			
			<div class="bar_submit">
				<input type="reset" id="resetBtn" value="취소"></input>
				<input type="submit" id="submitBtn" value="등록"/>
			</div>
			
		</form>
		
	</div>

</div>