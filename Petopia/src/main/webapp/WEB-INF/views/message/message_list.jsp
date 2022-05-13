<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/message/message.css" type="text/css"/>
<div id="Top_menu2"> <!-- 탑 메뉴 전체 영역 -->
		<div id="Top_Logo"> <!--  로고 -->
			<a href="/"><img src="/img/Logo(main).png"/></a>
		</div>
		<div id="Top_menu_select"><!-- 메뉴 -->
			<div class="se"><b class="Top_menu_VA">정보</b> <b class="Top_menu_VA">커뮤니티</b> <b class="Top_menu_VA">입양</b></div>
				<div class="Top_menu_select_S">
					<div class="Top_menu_select_A">
						<ul>
							<li><a href="/map/mapMain">내 근처 병원</a></li>
							<li><a href="/animalInfo/animalInfoMain">반려동물 정보</a></li>
						</ul>
					</div>
					<div class="Top_menu_select_A">
						<ul>
							<li><a href="/board/SubMenuSelect?type=notice">공지사항</a></li>
							<li><a href="/board/SubMenuSelect?type=info">정보공유</a></li>
							<li><a href="/board/SubMenuSelect?type=share">나눔할래요</a></li>
							<li><a href="/board/SubMenuSelect?type=walk">산책할래요</a></li>
							<li><a href="/board/SubMenuSelect?type=boast">자랑할래요</a></li>
							<li><a href="/board/SubMenuSelect?type=suggest">건의할래요</a></li>
						</ul>
					</div>
					<div class="Top_menu_select_A">
						<ul>
							<li><a href="/board/adopt/adoptList">입양게시판</a></li>
						</ul>
					</div>
				</div>
		</div>
	<div id="Top_LGN_section"><!-- 로그인, 회원가입 들어갈 박스 -->
		<c:if test="${logLevel == '1' }">
			<div id="admin_box"><a href="/admin/adminMain">관리자페이지</a></div>
		</c:if>
		<c:if test="${logStatus != 'Y' }">
			<div id="Login_box"><a href="/member/login">로그인</a></div>
			<div id="join_box"><a href="/member/signUp">회원가입</a></div>
		</c:if>
		<c:if test="${logStatus == 'Y' }">
			<div id="Login_box"><a href="/member/logout">로그아웃</a></div>
			<div id="join_box"><a href="/member/memberEdit">회원정보수정</a></div>
			<button onclick="location.href='/message_list.do';" class="btn btn-warning" id="GOmessagebtn"><i class="bi bi-chat-left"></i></button>
			<c:if test="${logMessage != null && logMessage > 0}">
				<c:if test="${logMessage <= 99 }">
					<div class="unreadMessage"><a href="/message_list.do">${logMessage}</a></div>
				</c:if>
				
				<c:if test="${logMessage > 99 }">
					<div class="unreadMessage"><a href="/message_list.do">99+</a></div>
				</c:if>
			</c:if>
			
		</c:if>
	</div>
</div>
<div class="container">
	<div class="msg-container">
	
		<div class="messaging">
	      <div class="inbox_msg">
	      	<!-- 메세지 목록 영역 -->
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>쪽지기능</h4>
	            </div>
	            <!-- 
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> 
	              </div>
	            </div>
	             -->
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">
		          
	          </div>
	        </div>
	        
	        <!-- 메세지 내용 영역 -->
	        <div class="mesgs">
	          <!-- 메세지 내용 목록 -->
	          <div class="msg_history" name="contentList">
	            <!-- 메세지 내용이 올 자리 -->
	          </div>
	          <div class="send_message">
	          </div>
	          <!-- 메세지 입력란이 올자리 -->
	        </div>
	      </div>
	      
	    </div>
	</div>
	
	
	
	
	
	
	<script>
	var timer = null;
	// 가장 처음 메세지 리스트를 가져온다.
	const FirstMessageList = function(){
		$.ajax({
			url:"message_ajax_list.do",
			method:"get",
			data:{
			},
			success:function(data){
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					
					let room = $(this).attr('room');
					let other_nick = $(this).attr('other-nick');
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<form class='send_message_form'><div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-1'><button class='tel_send_btn' type='button' title='전화번호 전송하기'><i class='bi bi-telephone-plus' aria-hidden='true'></i></button></div>";
					send_msg += "		<div class='col-10'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력해주세요.' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div></form>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						// 메세지 전송 함수 호출
						SendMessage(room, other_nick);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						$('.chat_list_box:first').addClass('active_chat');
					});
					
					$('.send_message_form').on('submit',function(){
						event.preventDefault();//기본이벤트 제거
						
						// 메세지 전송 함수 호출
						SendMessage(room, other_nick);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						$('.chat_list_box:first').addClass('active_chat');
					});
					
					//전화번호 보내기 버튼 눌렀을 때
					$('.tel_send_btn').on('click',function(){
						
						if (window.confirm("상대방에게 자신의 전화번호를 보내겠습니까?")) {
					        //전화번호 보내기
							SendTel(room, other_nick);
					          
					        $('.chat_list_box:first').addClass('active_chat');
					    }else{
					    	
					    }
						
						
						
					});

					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(room);
					
				});
				
			}
		})
		//15초마다 쪽지 리스트 초기화
		timer=setInterval(MessageList,15000);
	};
	
	// 메세지 리스트를 다시 가져온다.
	const MessageList = function(){
		
		$.ajax({
			url:"message_ajax_list.do",
			method:"get",
			data:{
			},
			success:function(data){

				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					//alert('room : '+ $(this).attr('room'));
					
					let room = $(this).attr('room');
					let other_nick = $(this).attr('other-nick');
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<form class='send_message_form'><div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-1'><button class='tel_send_btn' type='button' title='전화번호 전송하기'><i class='bi bi-telephone-plus' aria-hidden='true'></i></button></div>";
					send_msg += "		<div class='col-10'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력해주세요.' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div></form>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						// 메세지 전송 함수 호출
						SendMessage(room, other_nick);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						
						$('.chat_list_box:first').addClass('active_chat');
					});
					
					$('.send_message_form').on('submit',function(){
						event.preventDefault();//기본이벤트 제거
						// 메세지 전송 함수 호출
						SendMessage(room, other_nick);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						
						$('.chat_list_box:first').addClass('active_chat');
					});
					//전화번호 보내기 버튼 눌렀을 때
					$('.tel_send_btn').on('click',function(){
						if (window.confirm("상대방에게 자신의 전화번호를 보내겠습니까?")) {
							//전화번호 보내기
							SendTel(room, other_nick);
					          
					          
					        $('.chat_list_box:first').addClass('active_chat');
					    }
						
						
						
					});
					MessageContentList(room);
					
				});
				
				$('.chat_list_box:first').addClass('active_chat');
			}
		})
		
	};
    
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(room) {
		
		$.ajax({
			url:"message_content_list.do",
			method:"GET",
			data:{
				room : room,
			},
			success:function(data){
				
				
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		})
		
		$('.unread'+room).empty();
	
	};
	
	
	// 메세지를 전송하는 함수
	const SendMessage = function(room, other_nick){
		
		let content = $('.write_msg').val();	
		content = content.trim();

		if(content == ""){
			alert("메세지를 입력하세요!");
		}else{
			$.ajax({
				url:"message_send_inlist.do",
				method:"GET",
				data:{
					room : room,
					other_nick: other_nick,
					content: content,
					messagetype: "message"
				},
				success:function(data){
					// 메세지 입력칸 비우기
					$('.write_msg').val("");
					
					// 메세지 내용  리로드
					MessageContentList(room);
					
					// 메세지 리스트 리로드
					MessageList();
					
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
		
	};
	
	//전화번호를 전송하는 메소드
	const SendTel = function(room, other_nick){
		
		let content = "${logTel}";
		
		$.ajax({
			url:"tel_send_inlist.do",
			method:"GET",
			data:{
				room : room,
				other_nick: other_nick,
				content: content,
				messagetype: "tel"
			},
			success:function(data){
				// 메세지 입력칸 비우기
				$('.write_msg').val("");
					
				// 메세지 내용  리로드
				MessageContentList(room);
					
				// 메세지 리스트 리로드
				MessageList();
					
			},
			error : function() {
				alert('서버 에러');
			}
		});
		
		
		
	};
	
	$(document).ready(function(){
		// 메세지 리스트 리로드
		FirstMessageList();
	});
	
	
	
	</script>
	
</div>
<div class="bottom2">
	바텀
</div>