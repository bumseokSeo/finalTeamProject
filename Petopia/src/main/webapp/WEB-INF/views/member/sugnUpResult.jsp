<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 등록시 -->
<c:if test="${cnt>0}">
	<script>
		alert("펫토피아 회원가입을 환영합니다.");
		location.href="/member/login";
	</script>
</c:if>
<!-- 등록실패 -->
<c:if test="${cnt==null || cnt==0}">
	<script>
		alert("회원등록에 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>
