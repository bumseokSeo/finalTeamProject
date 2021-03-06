<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/animalInfo/animalInfoSub.css" type="text/css"/>
<div id="animalInfo_container" class="container">
	<div id="animalInfo_wrap">
		<div id="animalInfo_lnb">
			<div style="float: center; margin:30px auto;">
				<a href="/animalInfo/animalInfoMain"><img id="ad_logo" src="/img/로고2.png" alt="logo"/></a>
			</div>
			<ul>
				<li><a href="/animalInfo/animalInfoMain">강아지</a></li>
				<li><a href="/animalInfo/animalInfoCat">고양이</a></li>
				<li><a href="/animalInfo/animalInfoReptile">파충류|양서류</a></li>
				<li><a href="/animalInfo/animalInfoBird">조류</a></li>
				<li><a href="/animalInfo/animalInfoEtc">기타동물</a></li>
				
			</ul>
		</div>
		
		<div id="content">
			<div id="imgDiv1">
				<img src="/img/animalInfo/${vo.filename1}" class="img-fluid" alt="이미지가 없습니다." id="animalImg">
				
			</div>
			<div id="contentDiv">
				<h3 id="breed">${vo.breed}</h3>
				<span id="explanation">${vo.content}</span>
			</div>
			<div class="bar">
				<div class="d1">
					<span class="barcontent">특징</span>
				</div>
				<div class="d2">
					<img src="/img/특징아이콘.png" alt="" class="d-flex icon">
				</div>
				
			</div>
			<div id="distinctDiv">
				<b style="font-size: 2em; position: absolute; left: 30px; margin-top: 20px;">저는..</b>
				
				<div style="margin: 0 auto;"><br><br><br>${vo.distinction}</div>
				<div id="imgDiv2">
				
					<img src="/img/animalInfo/${vo.filename2}" class="img-fluid" alt="이미지가 없습니다." id="animalImg">
				</div>
			</div>
			
			<div class="bar">
				<div>
					<span class="barcontent">질병정보</span>
				</div>
				<div>
					<img src="/img/질병아이콘.png" alt="" class="d-flex icon">
				</div>
			</div>
			<div id="diseaseDiv">
				<b style="font-size: 2em; position: absolute; left: 30px; margin-top: 20px;">저는..</b>
				<div style="margin: 0 auto;"><br><br><br>${vo.disease}</div>
				<div id="imgDiv3">
					<img src="/img/animalInfo/${vo.filename3}" class="img-fluid" alt="이미지가 없습니다." id="animalImg">
				</div>
			</div>
			
		</div>

	</div>
</div>