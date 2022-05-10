<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/adopt/adoptList.css" type="text/css">
<div class="container">
	<h1>입양게시판</h1>
	<div class="Adopt_reg">
		<ul>
			<li>최신순</li>
			<li>인기순</li>
		</ul>
	</div>
	<br/>
	<div>
		<div class="row Adopt_top">
			<div class="col-lg-4 col-md-6 Adopt">
				<div class="card Adopt_group">
					<a href="${url }/board/adopt/adoptView"><img src="${url }/img/board/adopt/cat.jpeg"></a>
					<div class="card-body">
						<div class="card-text Adopt_content">
							<label class="Adopt_text">카테고리</label><br/>
							<label class="Adopt_text">제목</label><br/>
							<label class="Adopt_text"><i class="bi bi-emoji-heart-eyes" style="color:red"></i>&nbsp;0</label><br/>
							<label class="Adopt_text">글쓴이</label><br/>
							<label class="Adopt_text"><i class="bi bi-eye-fill"></i>&nbsp;0</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 Adopt">
				<div class="card Adopt_group">
					<a href="${url }/board/adopt/adoptView"><img src="${url }/img/board/adopt/cat.jpeg"></a>
					<div class="card-body">
						<div class="card-text Adopt_content">
							<label class="Adopt_text">카테고리</label><br/>
							<label class="Adopt_text">제목</label><br/>
							<label class="Adopt_text"><i class="bi bi-emoji-heart-eyes" style="color:red"></i>&nbsp;0</label><br/>
							<label class="Adopt_text">글쓴이</label><br/>
							<label class="Adopt_text"><i class="bi bi-eye-fill"></i>&nbsp;0</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 Adopt">
				<div class="card Adopt_group">
					<a href="${url }/board/adopt/adoptView"><img src="${url }/img/board/adopt/dog.jpeg"></a>
					<div class="card-body">
						<div class="card-text Adopt_content">
							<label class="Adopt_text">카테고리</label><br/>
							<label class="Adopt_text">제목</label><br/>
							<label class="Adopt_text"><i class="bi bi-emoji-heart-eyes" style="color:red"></i>&nbsp;0</label><br/>
							<label class="Adopt_text">글쓴이</label><br/>
							<label class="Adopt_text"><i class="bi bi-eye-fill"></i>&nbsp;0</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 Adopt">
				<div class="card Adopt_group">
					<a href="${url }/board/adopt/adoptView"><img src="${url }/img/board/adopt/dog.jpeg"></a>
					<div class="card-body">
						<div class="card-text Adopt_content">
							<label class="Adopt_text">카테고리</label><br/>
							<label class="Adopt_text">제목</label><br/>
							<label class="Adopt_text"><i class="bi bi-emoji-heart-eyes" style="color:red"></i>&nbsp;0</label><br/>
							<label class="Adopt_text">글쓴이</label><br/>
							<label class="Adopt_text"><i class="bi bi-eye-fill"></i>&nbsp;0</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="Adopt_btn"><a href="/board/adopt/adoptWrite"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/>
	<div class="Adopt_search">
		<select name="searchWord">
			<option value="" selected="selected">전체</option>
			<option value="title">제목</option>
			<option value="category">카테고리</option>
		</select>
		<input type="text" id="adopt_search"/>
		<input type="button" value="검색"/>
	</div>
	<br/><br/>
	<!-- 페이징 -->
	<div class="Adopt_paging">
		<ul>
			<li><a href="#">prev</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">next</a></li>
		</ul>
	</div>
</div>