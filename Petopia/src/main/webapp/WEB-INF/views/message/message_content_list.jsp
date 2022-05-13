<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${clist }">
	
	<c:choose>
		<c:when test="${sessionScope.logName ne tmp.send_nick }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
				<a href="#">
					<c:if test="${tmp.profile != null && tmp.profile != '' }">
						<img src="${url}/img/memberimg/${tmp.profile}" alt="보낸사람 프로필">
					</c:if>
					<c:if test="${tmp.profile == null || tmp.profile == '' }">
						<img src="${url}/img/sampleProfile.jpg" alt="보낸사람 프로필">
					</c:if>
					
				</a>
				
			</div>
			<div class="received_msg">
				<div class="received_withd_msg">
					<span class="user_name">${tmp.send_nick}</span>
					<c:if test="${tmp.messagetype == 'tel'}">
						<p class="telP"><b>펫토피아에서 인증된 전화번호입니다.</b><br>[${tmp.content }]</p>
					</c:if>
					<c:if test="${tmp.messagetype == 'message'}">
						<p class="messageP">${tmp.content }</p>
					</c:if>
					
					<span class="time_date"> ${tmp.send_time}</span>
				</div>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메세지 -->
		<div class="outgoing_msg">
			<div class="sent_msg">
				<c:if test="${tmp.messagetype == 'tel'}">
					<p class="telPsend"><b>펫토피아에서 인증된 전화번호입니다.</b><br>[${tmp.content }]</p>
				</c:if>
				<c:if test="${tmp.messagetype == 'message'}">
					<p class="messagePsend">${tmp.content }</p>
				</c:if>
				
				<span class="time_date"> ${tmp.send_time }</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>


</c:forEach>