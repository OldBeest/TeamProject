<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e422ab34489fb5e80e7def0fd930351&libraries=services"></script>
    <style>
        #view-container {
            display: flex;
        }
        #view{
            display: flex;
        }
    </style>
</head>
<body>
    <div>로컬 api 테스트<hr>
    	<input type="text" id="place" name="place" placeholder="지역을 입력하세요">
    	<button type="submit" id="submit-place">입력</button>
    </div>
	<div id="view-container">
		<div id="map" style="width: 50%; height: 500px;"></div>
		<div id="view">
			<input type="hidden" id="y-cor" name="y-cor" value="37.502606607304955">
			<input type="hidden" id="x-cor" name="x-cor" value="126.7599195351163">
            <div id="hostpital">
                <h2>가장 가까운 대학병원</h2>
                <p class="place-name"></p>
                <p class="place-address"></p>
                <p class="distance"></p>
                <p class="place-phone"></p>
                <p class="place-x"></p>
                <p class="place-y"></p>
            </div>
            <div id="pharmacy">
                <h2>가장 가까운 약국</h2>
                <p class="place-name"></p>
                <p class="place-address"></p>
                <p class="distance"></p>
                <p class="place-phone"></p>
                <p class="place-x"></p>
                <p class="place-y"></p>
            </div>
            <div id="convenience-store">
                <h2>가장 가까운 편의점</h2>
                <p class="place-name"></p>
                <p class="place-address"></p>
                <p class="distance"></p>
                <p class="place-phone"></p>
                <p class="place-x"></p>
                <p class="place-y"></p>
            </div>
        </div>
	</div>
    <script src="/js/keyword.js"></script>
</body>
</html>
