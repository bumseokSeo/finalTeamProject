<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/board/notice/noticeView.css" type="text/css"/>
<link rel="stylesheet" href="/css/board/adopt/adoptView.css" type="text/css">
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
				
		//로그인 상태일 경우 메세지 보내기 진행
		if(logName!=null){
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
		else{
			alert("로그인후 이용해주세요.");
			return false;
		}
	
		    	
	});
	
	$('#messageForm').on('submit',function(){
		var messagebtn=document.getElementById("messagebtn");
		alert("전송버튼을 눌러주세요");
		messagebtn.focus();
		return false;
		
	
	    	
	});
	
	
	
	
	
	
	/*쪽지부분*/
	
	
	
	
	
	
	
	
	
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
<h1>입양 프로필</h1>
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
  	  <div class="Adopt_img"><img name="filename1" src="/img/board/adopt/cat.jpeg" style="width:500px"></div>
  	  <div class="Adopt_files">
		<img src="img/board/adopt/cat.jpeg" alt="고양이이미지">
		<img src="img/board/adopt/cat.jpeg" alt="고양이이미지">
	</div>
  	  	<div class="View_content">${vo.content}
  	  	고양이의 입양과 임시보호를 올리는 게시판입니다. 내눈에 순화적 길고양로 보여도 가엽다고 무조건 입양글을 올리면
		안됩니다. 길에서 살아갈 수 없는 고양이에 한해 성격파악후 입양을 추진해야 해당 고양이에게 피해가 없답니다. 입양은 아이의
		묘생 전체가 좌지우지되는 일입니다. 보내는 분들도 입양하시는 분들 모두 고양이를 존중하는 신중한 판단을 요합니다.	
		<br/><br/>
		 제 수명을 다할 때까지 사랑해주고 보호해 주셔야 하며, 실외 또는 외출 고양이로 키우시는 것은 안됩니다.<br/>
		 - 입양 후, 3개월 간은 임시보호기간입니다.  지속적인 연락 등이 되지 않거나, 소식을 보내주시지 않으면 입양이 취소됩니다.<br/>
  		 - 부득이한 사정으로 키우지 못하게 되시는 경우, 반드시 원보호자에게 다시 돌려 보내주셔야 합니다.<br/>
  		 - 결혼을 앞둔 분, 신혼이신 분은 안됩니다.<br/>
  		 - 미성년자는 부모의 동의가 있어도 안됩니다.<br/>
  		 - 입양신청서를 작성해서 이메일로 보내주셔야 합니다.(메일을 보내시면 입양조건에 동의하신 것으로 간주합니다.)<br/>
		이름, 나이, 전화번호, 현주소, 직업, 가족상황과 입양에 대한 반응등을 적어서 보내주세요.
  	  	
  	  	</div>
  	  	<div class="View_bottommenu">
	  	  	<div class="col-2 Adopt_chatBtn">
				<input type="button" id="chatBtn" value="쪽지보내기"/>
			</div>
  	  		<p style="float: right;">
				<a href="/board/notice/noticeEdit?boardno=${vo.boardno}" id="modi_AA">수정</a> 
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
					<input type="button" value="전송" id="messagebtn"/>				
					
				</form>
				
			</div>
			
		</div>
	</div>

