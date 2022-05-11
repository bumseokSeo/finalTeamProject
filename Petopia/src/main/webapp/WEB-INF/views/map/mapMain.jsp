<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/map/mapMain.css" type="text/css">

<div class="map_wrap">
	<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				<form onsubmit="searchPlaces(); return false;">
					<div class="search_addr">주변 동물병원 검색</div>
					 <div class="search_bar">
					 	<input type="text" id="keyword" placeholder="search" size="15">
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
			<div>
				<div class="host_title">정보<div class="close" onclick="closeOverlay()" title="닫기"></div></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bffc103d445dc60ffcc8badf1da53cf7&libraries=services"></script>
<script src="/js/map/mapMain.js"></script>