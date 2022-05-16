<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/home/jquery.fullPage.css">
<link rel="stylesheet" href="/css/home/home.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/home/jquery.fullPage.js"></script>
<script src="/js/home/home.js"></script>
<script>
</script>

<nav class="home_nav">
	<ul>
		<li data-menuanchor="section1"><a href="#">정보</a>
			<ul class="sub_menu menu_select1">
				<li><a href="/map/mapMain">내 근처 병원</a></li>
				<li><a href="/animalInfo/animalInfoMain">반려동물 정보</a></li>
			</ul>
		</li>
		<li data-menuanchor="section1"><a href="#">커뮤니티</a>
			<ul class="sub_menu menu_select2">
				<li><a href="/board/SubMenuSelect?type=notice">공지사항</a></li>
				<li><a href="/board/SubMenuSelect?type=info">정보공유</a></li>
				<li><a href="/board/SubMenuSelect?type=share">나눔할래요</a></li>
				<li><a href="/board/SubMenuSelect?type=walk">산책할래요</a></li>
				<li><a href="/board/SubMenuSelect?type=boast">자랑할래요</a></li>
				<li><a href="/board/SubMenuSelect?type=suggest">건의할래요</a></li>
			</ul>
		</li>
		<li data-menuanchor="section1"><a href="#">입양</a>
			<ul class=" sub_menu menu_select3">
				<li><a href="/board/adopt/adoptList">입양게시판</a></li>
			</ul>
		</li>
		<li data-menuanchor="section1"><a href="#">회원</a>
			<ul class=" sub_menu menu_select4">
				<c:if test="${logStatus != 'Y' }">
					<li id="Login_box"><a href="/member/login">로그인</a></li>
					<li id="join_box"><a href="/member/signUp">회원가입</a></li>
				</c:if>
				
				<c:if test="${logStatus == 'Y' }">
					<li id="Login_box"><a href="/member/logout">로그아웃</a></li>
					<li id="join_box"><a href="/member/memberEdit">회원정보수정</a></li>
					<li id="meg_box" style="position:relative;">
						<a href="/message_list.do">쪽지</a>
						<c:if test="${logMessage != null && logMessage > 0}">
							<c:if test="${logMessage <= 99 }">
								<a class="msgCnt" style="font-size:14px;" href="/message_list.do">${logMessage}</a>
							</c:if>
							
							<c:if test="${logMessage > 99 }">
								<a class="msgCnt" style="font-size:14px;" href="/message_list.do">99+</a>
							</c:if>
						</c:if>
						
					</li>
				</c:if>
				
				<c:if test="${logLevel == '1' }">
					<li id="admin_box"><a href="/admin/adminMain">관리자페이지</a></li>
				</c:if>
			</ul>
		</li>
	</ul>
</nav>

<main id="fullpage">
	<section class="section section1">
		<div>
			<h1>반려동물과 함께하는</h1>
			<!-- 로고 글씨 흰색으로... -->
			<div><a href="/homeCHK"><img alt="logo" src="/img/home/logo_garo2.png" width="450px"/></a></div>
			
		</div>
		
	</section>
	
	<section class="section section2">
		<div class="slide">
			<div class="slide_card">
				<a href="/animalInfo/animalInfoMain">
					<img src="/img/home/dog.jpg"/>
					<span class="intext">Dog</span>
				</a>
			</div>
		</div>
		<div class="slide">
			<div class="slide_card">
				<a href="/animalInfo/animalInfoCat">
					<img src="/img/home/cat.jpg"/>
					<span class="intext">Cat</span>
				</a>
			</div>
		</div>
		<div class="slide">
			<div class="slide_card">
				<a href="/animalInfo/animalInfoReptile">
					<img src="/img/home/reptile.jpg"/>
					<span class="intext">Reptile | Amphibian</span>
				</a>
			</div>
		</div>
		<div class="slide">
			<div class="slide_card">
				<a href="/animalInfo/animalInfoBird">
					<img src="/img/home/bird.jpg"/>
					<span class="intext">Bird</span>
				</a>
			</div>
		</div>
		<div class="slide">
			<div class="slide_card">
				<a href="/animalInfo/animalInfoEtc">
					<img src="/img/home/etc.jpg"/>
					<span class="intext">Etc</span>
				</a>
			</div>
		</div>
	</section>
	
	<section class="section">
		<div class="animalInfoH1">
			<span>반려동물 정보?</span><br/>
			<span>다 있다!</span>
		</div>
		
		<div class="animalInfolink">
			<a href="/animalInfo/animalInfoMain"><img src="/img/home/pets.png"></a>
		</div>
				
		<div class="animalHospitalH1">
			<span>동물병원?</span><br/>
			<span>찾아보고 가자!</span>
		</div>
		
		<div class="animalHospitallink">
			<a href="/map/mapMain"><img src="/img/home/veterinarian.png"></a>
		</div>
	</section>
	
	<section class="section ">
			<div class="bottomlogo2">
				<span>반려동물을 위한</span><br/>
				<span>최고의 선택</span><br/>
				<img alt="이미지가 없습니다." src="/img/로고2.png" class="bottomimg2">
			</div>
			
			<div class="link">
				<ul>
					<li><a href="/map/mapMain">내 근처 병원</a></li>
					<li><a href="/animalInfo/animalInfoMain">반려동물 정보</a></li>
					<li><a href="/board/SubMenuSelect?type=notice">커뮤니티</a></li>
					<li><a href="/board/adopt/adoptList">입양</a></li>
					<li><a href="https://github.com/bumseokSeo/finalTeamProject.git"><img src="/img/home/github.png" style="width: 36px;"></a></li>
				</ul>
			</div>
			
			<div class="bottominfo2">
				<ul>
					<li>상호 : 펫토피아</li>
					<li>주소 : 서울시 강남구 멀티캠퍼스</li>
					<li>사업자 등록번호 : 123-456-7890</li>
					<li>이메일 : petopia@gmail.com</li>
				</ul>
			</div>
			<div class="bottometc2">
				<ul>
					<li>개인정보처리방침 | 이메일무단수집거부</li>
					<li>Copyrightⓒ petopia. All rights reserved.</li>
				</ul>
			</div>
	</section>
</main>