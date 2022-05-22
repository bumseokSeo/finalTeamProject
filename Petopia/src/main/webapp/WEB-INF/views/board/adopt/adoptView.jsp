<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/css/board/boardView.css" type="text/css">
<script type="text/javascript">
	


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
				var tag = "<ul>";
				$result.each(function(idx, vo){		//vo에서 프로필사진 가져올 자리
					tag +="<li><div class='reply_area'><div class='reply_u_info'><div class='reply_user'>"+vo.username+"</div>";
					tag +="<div class='reply_date'>"+vo.writedate+"</div>";

					if(vo.userid == '${logId}'){
					tag +="<input type='button' value='수정' class='reply_modi'/><input type='button' value='삭제' title='"+vo.replyno+"' class='reply_del'/>";
					}
					tag+="</div>";
					if(vo.userid == '${logId}'){   // user_id
						tag += "<div class='content_modify' style='display:none'><form method='post'>";
						tag += "<input type='hidden' name='replyno' value='"+vo.replyno+"'/>";
						tag += "<textarea name='content' class='content_modi' id='content_modi'>"+vo.content+"</textarea>";
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
	
	/*쪽지부분*/
	$(document).on('click','#chatBtn',function(){
		$(".modal").show();
	});
		
		//.modal안에 button을 클릭하면 .modal닫기
	$(".modal button").click(function(){
		$(".modal").hide();
	});
		
		//.modal밖에 클릭시 닫힘
	$(".modal").click(function (e) {
		if (e.target.className != "modal") {
			return false;
		} else {
		    $(".modal").hide();
		}   
	});
		
	//쪽지보내기 전송버튼 처리
	$('#messagebtn').on('click',function(){
		    	
		//메세지 내용 공백 검사
		var content=document.getElementById("messagecontent");
		if(content.value==""){
			alert("메세지를 입력해주세요.");
			content.focus();
			return false;
		}
		var username = document.getElementById("username");//메세지 받는 계정
				
		var content = document.getElementById("messagecontent");//내용
		var logName = "${logName}";
		
		if("${logName}"==""){
			alert("로그인후 이용해주세요.");
			return false;
		}else if("${logName}"==$("#username").val()){
			alert("본인에게 쪽지를 보낼 수 없습니다.");
			return false;
		}else{
			//메세지 보내기 절차
			var url= "${url}/message/messagesend";
			var params = "username="+username.value+"&content="+messagecontent.value;
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					var $result = $(result);
					alert("쪽지를 보냈습니다.");
					$(".modal").hide();
				},
				error:function(e){
					console.log(e.resopnseText);
				}
			});
		}
		
	
		    	
	});
	
	
	//쪽지보내기 서브밋 처리
	$('#messageForm').on('submit',function(){
		event.preventDefault();//기본이벤트 제거
		
		var content=document.getElementById("messagecontent");
		if(content.value==""){
			alert("메세지를 입력해주세요.");
			content.focus();
			return false;
		}
		var username = document.getElementById("username");//메세지 받는 계정
				
		var content = document.getElementById("messagecontent");//내용
		var logName = "${logName}";
				
		//로그인 상태일 경우 메세지 보내기 진행
		if("${logName}"==""){
			alert("로그인후 이용해주세요.");
			return false;
		}else if("${logName}"==$("#username").val()){
			alert("본인에게 쪽지를 보낼 수 없습니다.");
			return false;
		}
		
		else{
			//메세지 보내기 절차
			var url= "${url}/message/messagesend";
			var params = "username="+username.value+"&content="+messagecontent.value;
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					var $result = $(result);
					alert("쪽지를 보냈습니다.");
					$(".modal").hide();
				},
				error:function(e){
					console.log(e.resopnseText);
				}
			});
		}
		
	
	    	
	});
	
	
	/*쪽지부분*/
	
	
	
	
	
	
	
	
	
    // 댓글등록------
	$("#replyFrm").submit(function(){
		event.preventDefault();
		if($("#View_conment").val()==""){
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
        if($("#content_modi").val()==""){
        	alert("댓글을 입력후 수정하세요.");
        	replyListAll();
        	return false;
		}else{
			let url2 = '/reply/replyEditOk';
	        $.ajax({
	            url : url2,
	            data : params2,
	            type : 'POST',
	            success : function(result){
	                
	                replyListAll();
	            }, error : function(e){
	                console.log('수정에러');
	            }
	        });
		}
        
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
<div class="container"><!--  전체 틀  -->
<div>
</div>
	<div class="View_topmenu">
  	  	<h2>${vo.title}</h2>
  	  	<div id="View_subtitle">
  	  		<c:set var ="profile" value="${vo.profileimage}"/>
			<c:choose>
				<c:when test="${fn:startsWith(profile, 'http://')}">
					<img src="${vo.profileimage}" class="View_topmenu_profile" alt="보낸사람 프로필">
				</c:when>
				<c:when test="${vo.profileimage != null && vo.profileimage != '' }">
					<img src="${url}/img/memberimg/${vo.profileimage}" class="View_topmenu_profile" alt="보낸사람 프로필">
				</c:when>
				<c:when test="${vo.profileimage == null || vo.profileimage == '' }">
					<img src="${url}/img/sampleProfile.jpg" class="View_topmenu_profile" alt="보낸사람 프로필">
				</c:when>
			</c:choose>
	  	  	<div class="View_author"><h4>${vo.username}</h4></div>
	  	  	<p class='text-end'><small class='text-muted'>${vo.writedate} 조회수:${vo.hit}</small></p>
	  	  	
	  	  	<c:if test="${vo.userlevel == 1 }">
				<p class='text-start'><small class='text-muted'>관리자</small></p>
			</c:if>
			<c:if test="${vo.userlevel == 2 }">
				<p class='text-start'><small class='text-muted'>일반 유저</small></p>
			</c:if>
			<c:if test="${vo.userlevel == 3 }">
				<p class='text-start'><small class='text-muted'>제재 대상</small></p>
			</c:if>
			<button type="button" id="chatBtn" class="btn btn-warning"><i class="bi bi-chat-left"></i>쪽지 보내기</button>
	  	  	
	  	  	
  	  	</div>
  	 </div>
  	  	<div class="View_content">
  	  		${vo.content}
  	  		<div class="precaution">
  	  			<div class="precautionTop">
  	  				<strong>반려동물을 기르기 전 고려해야 할 사항</strong>
  	  			</div>
  	  			<div class="precautionBody">
					&nbsp;·&nbsp;반려동물을 입양 또는 분양을 받기 전에 모든 가족 구성원이 동의하고 충분히 생각해 보셨나요?<br><br>
					&nbsp;·&nbsp;개와 고양이의 수명은 약 15년 정도입니다. 살아가면서 질병도 걸릴 수 있습니다. 생활패턴이나 환경이 바뀌어도 오랜 기간 동안 책임지고 잘 돌보아 줄 수 있나요?<br><br>
					&nbsp;·&nbsp;매일 산책을 시켜주거나 함께 있어줄 수 있는 시간이 충분한가요? 개는 물론이고 고양이도 혼자 있으면 외로워하는 사회적 동물입니다.<br><br>
					&nbsp;·&nbsp;식비, 건강 검진비, 예방접종과 치료비 등 관리비용을 충당할 수 있을 정도의 경제적 여유를 갖고 계신가요?<br><br>
					&nbsp;·&nbsp;동물의 소음(짖거나 울음소리), 냄새(배변 등), 털 빠짐 등의 상황이 일어납니다. 또한 물거나 할퀼 수도 있으며 다양한 문제행동을 보일 수도 있습니다.<br><br>
					&nbsp;·&nbsp;개와 고양이로 인한 알레르기 반응은 없나요? 입양 또는 분양받기 전에 반드시 가족 구성원 모두 알레르기 유무를 확인해야 합니다.
					&nbsp;·&nbsp;반려동물의 중성화수술 및 동물등록에 동의하시나요?
  	  			</div>
  	  		</div>
  	  	</div>
  	  	<div class="View_bottommenu">
  	  		<c:if test="${logId == vo.userid}">
  	  		<p style="float: right;">
				<a href="/board/boardEdit?type=adopt&boardno=${vo.boardno}" id="modi_AA">수정</a> 
				<a href="javascript:delCheck()" id="Del_AA">삭제</a>
			</p>
			</c:if>
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
								<div id="reply_info">댓글 작성  | 작성자 : ${logName}</div>
								<textarea name="content" id='View_conment' maxlength="99"
									placeholder=" 댓글 입력" ></textarea>
								<input type="submit" value="등록" id="replybtn" />						
						</form>
					</div>
				</c:if>
	  </div>
</div>

<!-- 팝업 될 곳 -->
	<div class="modal">
		<button>&times;</button>
		<div class="modalBox">
			<div class="modaltop">
				<br>
				<h4>${vo.username}님에게 쪽지가 보내집니다.</h4>
			</div>
			<div class="modalbody">
				<form method="get" id="messageForm">			
					<input type="text" name="messagecontent" id="messagecontent" maxlength="100" />					
					<input type="hidden" name ="username" id="username" value="${vo.username}" maxlength="100" />
					<button id="messagebtn" class='msg_send_btn' type='button' title='전송' style="background-color: #97df93;border: medium none;border-radius: 50%;position: relative;left:0px;top:0px;color: #fff;font-size: 17px;">
					<i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>				
					
				</form>
				
			</div>
			
		</div>
	</div>

