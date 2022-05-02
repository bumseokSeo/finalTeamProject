$(function(){
	CKEDITOR.replace("shareContent",{
		height:"500px",
		startupFocus:false
	});
	
	$("#boardFrm").submit(function(){
		if(CKEDITOR.instances.content.getData() == ''){
			alert("글내용을 입력하세요!");
			return false;
		}
	});
});