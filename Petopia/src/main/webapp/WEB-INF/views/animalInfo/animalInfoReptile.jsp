<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/animalInfo/animalInfoMain.css" type="text/css"/>
<style>
</style>
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
		<div id="resultArea">
			
			
			
			<div class="row">
				<div id="searchDiv">
					<form method="get" action="${url}/animalInfo/animalInfoReptile" class="d-flex" id="searchForm">
						<img alt="" src="${url}/img/search.png" class="searchIcon" >
			        	<input class="form-control me-2" type="search" placeholder="이름으로 검색하기" aria-label="Search" id="searchword" name="searchword">
			        	<input type="submit" value="검색" class="btn btn-info" id="searchBtn2">
			    	</form>
				</div>
				<c:forEach var="vo" items="${list}">
					<div class="col">
						<div class="card">
							<a href="/animalInfo/animalInfoSub?breedkey=${vo.breed}"><img src="/img/animalInfo/${vo.filename1}" class='animalimg' alt="이미지가 없습니다." title="${vo.breed}" style="height:275px; width:100%;"></a>
							<h4 class="card-title">${vo.breed}</h4>
							<div class="card-body">
								<p class="card-text">${vo.content}</p>
							</div>
						</div>
					</div>
				</c:forEach>
				
				
				
				

			</div>
			
			
			
			
			
			
			
		</div>
	</div>
</div>