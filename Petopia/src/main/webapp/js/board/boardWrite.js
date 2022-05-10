$(function(){
	//share board 글작성
	CKEDITOR.replace("shareContent",{
		height:"500px",
		startupFocus:false
	});
	$("#shareFrm").submit(function(){
		if($("#shareSubject").val()==''){
			alert("제목을 입력해주세요.");
			return false;
		}
		if(CKEDITOR.instances.shareContent.getData() == ''){
			alert("내용을 입력해주세요.");
			return false;
		}
	});
	$("#shareCancle").on('click',function(){
		CKEDITOR.instances.shareContent.setData("");
	});
	$("#shareBack").on('click',function(){
		location.href="/board/share/shareList";
	});
});

$(function(){
	// 입양 페이지 글 작성
	CKEDITOR.replace("adoptContent",{
		height:"500px",
		startupFocus:false
	});
	$("#adoptFrm").submit(function(){
		if($("#adoptSubject").val()==''){
			alert("제목을 입력해주세요.");
			return false;
		}
		if(CKEDITOR.instances.shareContent.getData() == ''){
			alert("내용을 입력해주세요.");
			return false;
		}
	});
	$("#adoptCancle").on('click',function(){
		CKEDITOR.instances.shareContent.setData("");
	});
	$("#adoptBack").on('click',function(){
		location.href="/board/adopt/adoptList";
	});
});