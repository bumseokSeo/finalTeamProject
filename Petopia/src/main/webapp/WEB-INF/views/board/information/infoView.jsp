<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/notice/noticeView.css" type="text/css"/>
<script>
function delCheck(){
	if(confirm("삭제하시겠습니까?")){
		location.href = "/board/boardDelete?boardno="+${vo.boardno};// 게시글 삭제 매핑
	}
}

$(function(){
	function replyListAll(){
		var url = "/reply/replyList";
		var params = "boardno=${vo.boardno}"; 
		$.ajax({
			url:url,
			data:params,
			success:function(result){
				var $result = $(result);
				console.log(result);
				console.log(${vo.boardno});
				var tag = "<ul>";
				$result.each(function(idx, vo){		//vo에서 프로필사진 가져올 자리
					tag +="<li><div class='reply_area'><div class='reply_u_info'><div class='reply_user'>"+vo.userid+"</div><div class='reply_proima'>프로필 이미지</div>";
					tag +="<div class='reply_date'>"+vo.writedate+"</div>";

					if(vo.userid == '${logId}'){
					tag +="<input type='button' value='수정' class='reply_modi'/><input type='button' value='삭제' title='"+vo.replyno+"' class='reply_del'/></div>";
					}
					if(vo.userid == '${logId}'){   // user_id
						tag += "<div class='content_modify' style='display:none'><form method='post'>";
						tag += "<input type='hidden' name='replyno' value='"+vo.replyno+"'/>";
						tag += "<textarea name='content' class='content_modi'>"+vo.content+"</textarea>";
						tag += "<input type='submit' value='수정' class='modi_button'/></form></div>";
					}	
					tag +="<div class='reply_con'>"+vo.content+"</div></div></div></li>";
				});
				tag += "</ul>";
				
				$("#replyList").html(tag);
				
			},error:function(e){
				console.log(e.responseText);
			}
			
		});
	}
    // 댓글등록------
	$("#replyFrm").submit(function(){
		event.preventDefault();
		if($("#content").val()==""){
			alert("댓글을 입력후 등록하세요.")
			return;
		}else{	
			var params = $("#replyFrm").serialize();
			$.ajax({
				url:'/reply/replyWrite',
				data:params,
				type:'POST',
				success:function(r){
					$("#View_conment").val("");
					replyListAll();
				},error:function(e){
					console.log(e.responseText);
				}
			});
		}
	});
	$(document).on('click','#replyList input[value="수정"]',function(){
		$(this).css("display","none");
		$(this).next().css("display","none");
		$(this).prev().css("display","none");
		$(this).parent().next().next().css("display","none");
		$(this).parent().next().css("display","block");
	});

    $(document).on('submit','#replyList form',function(){
        event.preventDefault();
        let params2 = $(this).serialize();
        let url2 = '/reply/replyEditOk';
        $.ajax({
            url : url2,
            data : params2,
            type : 'POST',
            success : function(result){
                console.log(result);
                replyListAll();
            }, error : function(e){
                console.log('수정에러');
            }
        });
    });
	$(document).on('click','#replyList input[value="삭제"]',function(){
		if(confirm('댓글을 삭제하시겠습니까?')){
			var params = "replyno=" + $(this).attr("title");
			$.ajax({
				url:'/reply/replyDelete',
				data:params,
				success:function(result){
					console.log(result);
					replyListAll();
				}, error:function(){
					console.log("댓글삭제에러발생...")
				}
			});
		}
	});
	replyListAll();
	
});
</script>	
</head>
<body>
<div id="notice-wrapper"><!--  전체 틀  -->
<h1>공지사항</h1>
<hr/>
<div>
</div>
	<div class="View_topmenu">
  	  	<div id="View_title">${vo.title}</div>
  	  	<div id="View_subtitle">
	  	  	<div id="View_author">${vo.userid}</div>
	  	  	<div id="View_hit">${vo.hit}</div>
	  	  	<div id="View_date">${vo.writedate}</div>
  	  	</div>
  	  </div>
  	  	<div class="View_content">${vo.content}</div>
  	  	<div class="View_bottommenu">
  	  		<p style="float: right;">
				<a href="/board/boardEdit?boardno=${vo.boardno}" id="modi_AA">수정</a> 
				<a href="javascript:delCheck()" id="Del_AA">삭제</a>
			</p>
  	  	</div>
  	  	<hr/>
  	  <div class="reply">
        	<br/>
			<b>댓글</b>
			<hr />
			<!--댓글-->
				<div id="replyList"></div>
				<c:if test="${logStatus=='Y'}">
					<div id="reply_area">
						<form id="replyFrm">
							<input type="hidden" name="boardno" value="${vo.boardno}"/>
								<div id="reply_info">댓글 작성  | 작성자 : ${user}</div>
								<textarea name="content" id='View_conment'
									style="width: 100%; height: 120px; font-size:18px; border:none; border-radius: 15px;" placeholder=" 댓글 입력" ></textarea>
								<input type="submit" value="등록" id="replybtn" />						
						</form>
					</div>
				</c:if>
	  </div>
</div>
