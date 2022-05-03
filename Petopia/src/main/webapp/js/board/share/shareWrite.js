$(function(){
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