<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/animalInfo/animalInfoSub.css" type="text/css"/>
<div id="animalInfo_container">
	<div id="animalInfo_wrap">
		<div id="animalInfo_lnb">
			<a href="/animalInfo/animalInfoMain"><img id="ad_logo" src="/img/로고2.png" alt="logo"/></a>
			<ul>
				<li><a href="/animalInfo/animalInfoMain">강아지</a></li>
				<li><a href="/animalInfo/animalInfoCat">고양이</a></li>
				<li><a href="/animalInfo/animalInfoReptile">파충류|양서류</a></li>
				<li><a href="/animalInfo/animalInfoBird">조류</a></li>
				<li><a href="/animalInfo/animalInfoEtc">기타동물</a></li>
				
			</ul>
		</div>
		
		<div class="container" id="content">
			<div id="imgDiv">
				<img src="/img/animalInfo/${vo.filename1}" class="img-fluid" alt="이미지가 없습니다." id="animalImg">
				
			</div>
			<div id="contentDiv">
				<span id="breed">${vo.breed}</span><br>
				<span id="explanation">${vo.content}</span>
			</div>
			<div id="distinctDiv">
				${vo.distinction}
			</div>
			<div id="diseaseDiv">
				${vo.disease}
			</div>
		</div>

		
	</div>
</div>