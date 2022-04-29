<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.Share_logo{
	margin:40px 10px;
}
.Share_top{
	margin:10px;
	border:1px solid gray;
}
.Share_group{
	margin:20px;
	border:1px solid gray;
	width:250px;
	position:relative;
}
.Share_img{
	overflow:hidden;
}
.Share_img img{
	border-bottom:1px solid gray;
	width:250px;
}
.Share_title{
	margin:3px 5px;
	border:1px solid gray;
}
.Share_content{
	padding:3px;
}
.Share_text{	
	margin:3px;
	border:1px solid gray;
}
.Share_btn{
	float:right;
	margin:0 10px;
}
.Share_btn a{
	color:black;
	font-size:1.2em;
}
.Share_btn a:hover {
	color:#FF7900;
}
</style>

<div class="container">
	<h1 class="Share_logo">나눔게시판</h1>
	<div class="Share_top">
		<div class="card Share_group">
			<div class="card-img-top">
				<div class="card-body Share_img"><img src="/img/Logo(main).png">
					<div class="card-title Share_title">제목</div>
					<div class="card-text Share_content">
						<label class="Share_text">글쓴이</label> 
						<label class="Share_text">작성날짜</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="Share_btn"><a href="#"><i class="fa-solid fa-paw"></i>글쓰기</a></div>
	<br/><br/>
	
</div>
<br/>