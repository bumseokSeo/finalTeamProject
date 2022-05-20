<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/map/mapMain.css" type="text/css">

<div class="map_wrap">
	<div><button id="getMyPositionBtn" onclick="getCurrentPosBtn()" title="내위치로이동"><i class="bi bi-cursor"></i></button></div>
	<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				<form onsubmit="searchPlaces(); return false;">
					<div class="search_addr">주변 동물병원 검색</div>
					 <div class="search_bar">
					 	<input type="text" id="keyword" placeholder="지역검색(예시-시청역)" size="15">
					 	<button type="submit" id="mapBtn">검색</button>
					 </div>
				</form>
			</div>
		</div>
		<hr>
		<ul id="placesList"></ul>
	</div>
	<div id="menu_wrap_2" class='bg_white'>
		<div class="option">
			<div class="host_title">
				<img id="map_src" src="/img/Logo.png">
			</div>
			<hr/>
			<div>
				<div class="host_info"></div>
				<div class="host_info2">
					
				</div>
			</div>
			<hr/>
			<div>
				<div class="host_review"><i class="bi bi-pencil-square"></i>&nbsp;리뷰를 남겨주세요</div>
				<div class='host_review3'>
					
				</div>
				<div id="host_review2">
				
				</div>
			</div>
		</div>
	</div>
	<div id="closeBtn" onclick="closeMenu()"><span><i class="bi bi-x-lg"></i></span></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bffc103d445dc60ffcc8badf1da53cf7&libraries=services"></script>
<script src="/js/map/mapMain.js"></script>
<script>
	let userid = "${logId}";
</script>
