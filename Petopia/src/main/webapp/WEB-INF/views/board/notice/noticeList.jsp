<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/notice/noticeList.css" type="text/css"/>
<script>
</script>
<div class="container">
	<div class="Menu_Bar_A">
		<h1 class="Menu_title">공지 사항</h1>
		<div class="Menu_img">이미지 들어갈것</div>
	</div>
	<div class="Menu_container">
		<ul class="List_menu_F">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			
			<c:foreach var="vo" items="${list}">
				<li>${nlist.no}</li>
				<li>${nlist.title}</li>
				<li>${nlist.writedate}</li>
				<li>${nlist.hit}</li>
			</c:foreach>
		</ul><!-- 게시물 -->
	</div>
		
		<div class="Share_btn"><a href="/board/notice/noticeWrite"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
		<br/><br/><br/>
		<div class="Share_search">
			<select>
				<option value="" selected="selected">전체</option>
				<option value="title">제목</option>
				<option value="userid">글쓴이</option>
			</select>
			<input type="text" id="share_search"/>
			<input type="button" value="검색"/>
		</div>
		<br/><br/>
		<div class="Share_paging">
			 <c:if test="${pVO.pageNum>1}">
		        <li><a href="/board/notice/noticeList?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">prev</a></li>
		        </c:if>
		        <!--  페이지 번호                 1,5      6,10         11,15-->
		        <c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
		            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
		             <c:if test="${p<=pVO.totalPage}">
		               <c:if test="${p==pVO.pageNum}">
		               <li style="background-color:green">
		               </c:if>
		               <c:if test="${p!=pVO.pageNum}">
		               <li>
		               </c:if>
		               <a href="/board/notice/noticeList?pageNum=${p}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${p}</a></li> 
		             </c:if>
		        </c:forEach>
		        <c:if test="${pVO.pageNum<pVO.totalPage}">
		        <li><a href="/board/notice/noticeList?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">next</a></li>
		        </c:if>
		</div>
</div>
<br/>