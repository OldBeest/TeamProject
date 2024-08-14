<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="ko">
<head>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- css 불러오기 -->
<link rel="stylesheet" href="/css/topbar.css">

<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- js 불러오기 -->
<script src="/js/topbar.js"></script>
<script src="/js/sidebar_motion.js"></script>

<!-- 아울 캐러셀 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

<!-- swiper -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d892befda0f3748480b5e97a2dd60e23&libraries=services"></script>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

{
font-size


:

 

0


.5em


; /* Reducing the font size to half */
}
h2 {
	font-family: 'Pretendard-Regular';
	font-weight: 400;
}

#lang {
	display: block;
	margin: 0 auto; /* Center the select box */
}

#container {
	position: fixed; /* 고정된 위치로 설정 */
	top: 50px; /* 페이지 상단에서 50px 떨어진 위치 */
	right: 20px; /* 페이지 오른쪽에서 20px 떨어진 위치 */
	width: 15%;
	padding-right: 20px;
	padding-top: 20px;
	box-sizing: border-box;
	border-radius: 5px;
}

fieldset {
	padding: 10px; /* Adjust padding if needed */
	width: 80%;
	box-sizing: border-box;
	margin-bottom: 20px;
	font-weight: bold !important;
	z-index: 2;
	-webkit-backdrop-filter: blur(10px);
	backdrop-filter: blur(10px);
	background-color: rgba(255, 255, 255, .25); /* 밝게 보이도록 배경색 추가 */
	border-radius: 30px; /* 둥근 테두리 */
	box-shadow: 0 6px 20px -15px #000; /* 그림자 효과 */
	border-width: 1px 1px 0 0; /* 입체감 흰색 테두리 */
	border-color: #fff;
	border-style: solid;
}

label, input {
	display: block;
	margin-bottom: 10px;
}

input[type="submit"], input[type="reset"] {
	font-size: 1em; /* Maintain button font size for better readability */
}

.checkbox-container {
	display: flex;
	flex-wrap: wrap;
}

.checkbox-container label {
	width: 50%;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.checkbox-container input[type="checkbox"] {
	display: block;
	margin-top: 5px;
}

.radio-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.radio-container label {
	margin: 0 10px; /* Adding some space between the radio buttons */
}

#buttons {
	display: flex;
	justify-content: center; /* Center-aligning the buttons */
}

body {
	display: center;
	align-items: center;
	justify-content: center;
	margin: 0 auto;
	height: 100vh;
	background-color: white;
}

input, label {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto;
}

select {
	margin-bottom: 10px;
	margin-top: 10px;
}

.footer {
	font-size: 10px;
	color: rgba(0, 0, 0, .5);
	position: relative;
	padding: 10px 30px 20px;
	border-top: 1px solid #ff8f03;
	background-color: white;
}
.background {
    position: relative;
    height: 80vh;
    overflow: hidden;
}

.background video {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.text-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

.tit1, .tit2 {
    text-align: center;
    color: white;
}

.tit1 {
    font-size: 3.5em;
    animation: blink 4s infinite;
}

.tit2 {
    font-size: 1.5em;
    animation: blink 5s infinite;
}

@keyframes blink {
    0%, 100% { opacity: 0; }
    50% { opacity: 1; }
}
#box1 {
	width: 900px;
	height: 500px;
	margin: 2px;
	border: solid 2px #000000;
	background-color: white;
}

.background {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 80vh;
	text-align: center;
	color: white;
	position: relative;
	translate: none;
	rotate: none;
	scale: none;
	transform: translate(0px, 0px);
}

#youtube {
	display: inline;
	position: absolute;
	top: 40px;
	left: 5px;
	right: 20px;
	width: 100%; /* 변경: 전체 너비 사용 */
	height: 30%;
	box-sizing: border-box;
	border-radius: 5px;
}

.iframe-container {
	display: flex;
	justify-content: space-between;
	width: 100%;
	overflow-x: auto; /* 필요시 가로 스크롤 허용 */
	padding-top: 550px;
}

.iframe-container iframe {
	width: 32%; /* 각 iframe이 컨테이너의 약 1/3을 차지하도록 설정 */
	height: 315px; /* 높이 고정 */
	margin-right: 1%; /* iframe 사이의 간격 */
}

.iframe-container iframe:last-child {
	margin-right: 0; /* 마지막 iframe의 오른쪽 마진 제거 */
}

.tit1 {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 3.5em;
	color: white;
	opacity: 0;
	animation: blink 4s infinite;
}

.tit2 {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 1.5em;
	color: white;
	opacity: 0;
	animation: blink 5s infinite;
}

.tit3 {
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 20px;
	color: white;
}

@
keyframes blink { 0% {
	opacity: 0;
}

50
%
{
opacity
:
1;
}
100
%
{
opacity
:
0;
}
}

/* 흐물거리는 효과 추가 */
@
keyframes wobble { 0%, 100% {
	transform: translateX(0%);
}

15
%
{
transform
:
translateX(
-10px
)
rotate(
-6deg
);
}
30
%
{
transform
:
translateX(
10px
)
rotate(
6deg
);
}
45
%
{
transform
:
translateX(
-6px
)
rotate(
-3.6deg
);
}
60
%
{
transform
:
translateX(
6px
)
rotate(
3.6deg
);
}
75
%
{
transform
:
translateX(
-3px
)
rotate(
-1.8deg
);
}
90
%
{
transform
:
translateX(
3px
)
rotate(
1.8deg
);
}
}
.wobble-text {
	display: inline-block;
	animation: wobble 2s infinite;
}

.main-quote {
	width: 1000px;
}

.swiper {
	width: 560px;
	height: 315px;
}

.tit34 {
	background-color: white;
	text-align: center;
	height: 45%;
	padding-bottom: 20px;
}

.bottom-box {
	display: flex;
	justify-content: space-around;
}

.box-content {
	width: 33%
}

.slider {
	position: relative;
	overflow: hidden;
	width: 100%;
	max-width: 600px; /* Adjust as needed */
	margin: auto;
}

.slides {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slide {
	min-width: 100%;
	box-sizing: border-box;
}

.card {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.card-header {
	background-color: #0d790c; /* 초록색 */
	color: white;
	padding: 15px;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

.card-body {
	padding: 15px;
	overflow: hidden;
}

.card-body h2 {
	margin: 0;
	font-size: 16px;
	color: #333;
}

.card-body p {
	color: #666;
	height: 160px;
	font-size: 20px;
	line-height: 1.6;
	overflow: hidden;
	padding-bottom: 5px;
}

.card-footer {
	background-color: #0d790c;
	color: white;
	text-align: center;
	padding: 10px;
	cursor: pointer;
}

.facility-slider {
    position: relative;
    width: 80%;
    max-width: 800px;
    margin: auto;
    overflow: hidden;
}

.facility-slides {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.facility-slide {
    min-width: 100%;
    box-sizing: border-box;
}

.info-box {
    width: 100%;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: #fff;
    overflow: hidden;
    text-align: center;
}

.info-box img {
    width: 100%;
    height: 40%;
}
.info-title{
	font-size : 20px;
	font-weight : 700;
	margin-bottom : 5px;
}
.info-box-content {

    padding: 5px;
}

.tags{
	padding-top: 30px;
	padding-bottom: 10px;
}
.tags span {
    color: white;
    background-color: green;
    border: 2px solid white;
    border-radius: 15px;
    padding: 5px 10px;
    margin: 5px;
}

.facility-prev, .facility-next {
    cursor: pointer;
    position: absolute;
    top: 50%;
    width: auto;
    padding: 16px;
    margin-top: -22px;
    color: white;
    background-color: rgba(0, 0, 0, 0.5);
    border: none;
    border-radius: 3px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.facility-prev:hover, .facility-next:hover {
    background-color: rgba(0, 0, 0, 0.8);
}

.facility-prev {
    left: 0;
}

.facility-next {
    right: 0;
}

.facilities {
    margin: 0 auto;
    padding: 10px;
    width: 50%; /* 최대 너비를 90%로 설정 */
    background-color: white; /* 밝은 배경색 */
    overflow: hidden; /* 내용이 넘치지 않도록 처리 */
    max-width: 1200px; /* 최대 너비를 설정하여 화면 크기에 따라 반응형으로 조정 */
}

.facilities h3 {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
    padding: 10px; /* 여백 추가 */
    word-break: keep-all; /* 단어가 잘리지 않도록 설정 */
    white-space: nowrap; /* 텍스트가 한 줄로 나오게 설정 */
}


.facilities ul {
    list-style-type: none; /* 기본 불렛 제거 */
    padding: 0;
    margin: 0;
}

.facilities li {
    padding: 10px;
    margin-bottom: 10px;
    background-color: #fff; /* 흰색 배경 */
    border: 1px solid #ddd;
    border-radius: 8px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.facilities li:hover {
    background-color: #f0f8ff; /* 마우스 오버 시 배경색 변경 */
    border-color: #cce7ff; /* 마우스 오버 시 테두리색 변경 */
}

.facility-info {
    flex: 1;
    padding-right: 10px;
}

.facility-name {
    font-size: 18px;
    font-weight: bold;
    color: #0073e6;
}

.facility-address {
    font-size: 14px;
    color: #555;
}

.facility-regdate {
    font-size: 12px;
    color: #999;
    text-align: right;
    white-space: nowrap; /* 날짜가 잘리지 않도록 */
}

.foot-map{
	margin : 0 auto;
	display : flex;
}
#map{
	border : 3px solid green;
}
.scroll-icon {
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    color: white;
    font-size: 2em;
    cursor: pointer;
    animation: bounce 2s infinite;
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% {
        transform: translateY(0) translateX(-50%);
    }
    40% {
        transform: translateY(-30px) translateX(-50%);
    }
    60% {
        transform: translateY(-15px) translateX(-50%);
    }
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="./head&foot/header.jsp"%>
	<!-- 헤더 끝 -->
	<!-- 메인페이지 가운데 들어갈 내용 -->
	<section>
		<!-- 배경화면 -->
		<div class="background">
			<video src="/images/main1.html" autoplay playsinline muted loop></video>
			<div class="text-overlay">
			<div class="scroll-icon">    <i class="fas fa-chevron-down"></i></div>
			
				<div class="tit1">
					<h2 class="main-title">S I L V E R&nbsp;&nbsp;&nbsp;T O W N</h2>
				</div>
				<div class="tit2">
					<h2 class="main-quote">
						<br> <br> <br> 지난 수년간 오직 더 나은 미래와 행복한 노후를 위해 고민해
						왔습니다.<br> &nbsp;가족, 노후의 가장 소중한 친구
					</h2>
				</div>
			</div>
		</div>


		<!-- 
            <div id="youtube">
                <div class="iframe-container">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/85QahevJuxM?si=NttKlYmtaRD1gPmw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/Xigo-32ItoM?si=Cbk7t2k5apRlboUV" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/J2CnjnyCyRg?si=8mX2K54BQ50pp7xb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
 -->
	</section>
	<div class="tit34">
		<!-- Slider main container -->
		<div class="bottom-box">
			<div class="box-content">
				<h2 class="wobble-text">오늘의 건강뉴스</h2>
				<div class="slider">
					<div class="slides">
						<c:forEach items="${crawl_list }" var="i" begin="0" end="5">
							<div class="slide">
								<div class="card">
									<div class="card-header">${i.select("strong").text()}</div>
									<div class="card-body">
										<p>${i.select(".sa_text_lede").text()}...</p>
									</div>
									<a href='${i.select(".sa_text").select("a").attr("href")}'>
										<div class="card-footer">보러가기</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div>
				<h2 class="wobble-text">오늘의 추천영상</h2>
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<div class="swiper-slide">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/HoDiLkvLeaE" frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="swiper-slide">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/Xigo-32ItoM?si=Cbk7t2k5apRlboUV"
								frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="swiper-slide">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/J2CnjnyCyRg?si=8mX2K54BQ50pp7xb"
								frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>

					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>

					<!-- If we need navigation buttons -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>

					<!-- If we need scrollbar -->
					<div class="swiper-scrollbar"></div>
				</div>
			</div>
			<div class="box-content">
				<h2 class="wobble-text">실버타운이 추천합니다!</h2>
				<div class="facility-slider">
					<div class="facility-slides">
						<!-- Slide 1 -->
						<div class="facility-slide">
							<a href="#">
								<div class="info-box">
									<img src="/img/main1.jpg" alt="병원 이미지">
									<div class="info-box-content">
										<p class="info-title">국민건강보험 서울요양원</p>
										<p>서울시 강남구 헌릉로590길 50</p>
										<div class="tags">
											<span>#치매 전담</span> <span>#최신시설</span> <span>#도심특화</span> <span>#자연친화</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<!-- 추가 슬라이드들 -->
						<div class="facility-slide">
							<a href="#">
								<div class="info-box">
									<img src="/img/main2.jpg" alt="병원 이미지">
									<div class="info-box-content">
										<p class="info-title">서울숲요양병원</p>
										<p>서울특별시 강동구 고덕로 295-60</p>
										<div class="tags">
											<span>#암 전문</span> <span>#최신시설</span> <span>#도심특화</span> <span>#자연친화</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<!-- 추가 슬라이드들 -->
						<div class="facility-slide">
							<a href="#">
								<div class="info-box">
									<img src="/img/main3.jpg" alt="병원 이미지">
									<div class="info-box-content">
										<p class="info-title">메디컬오스위트요양병원</p>
										<p>경기도 하남시 미사강변대로54번길 37</p>
										<div class="tags">
											<span>#암 전문</span> <span>#최신시설</span> <span>#도심특화</span> <span>#여성전문</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<!-- 추가 슬라이드들 -->
						<div class="facility-slide">
							<a href="#">
								<div class="info-box">
									<img src="/img/main4.jpg" alt="병원 이미지">
									<div class="info-box-content">
										<p class="info-title">가은병원</p>
										<p>경기도 부천시 마니로 24번길 43-17</p>
										<div class="tags">
											<span>#대학병원인접</span> <span>#최신시설</span> <span>#도심특화</span> <span>#노인전문</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<!-- 추가 슬라이드들 -->
						<div class="facility-slide">
							<a href="#">
								<div class="info-box">
									<img src="/img/main5.jpg" alt="병원 이미지">
									<div class="info-box-content">
										<p class="info-title">실버프리 인천</p>
										<p>인천광역시 남동구 석정로 473-2</p>
										<div class="tags">
											<span>#치매전문</span> <span>#간호특화</span> <span>#도심특화</span> <span>#자연친화</span>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	        const slides = document.querySelector('.slides');
	        const slideCount = document.querySelectorAll('.slide').length;
	        let index = 0;
	        function moveToNextSlide() {
	            index = (index + 1) % slideCount;
	            const offset = -index * 100;
	            slides.style.transform = "translateX(" + offset + "%)";
	        }
	
	        setInterval(moveToNextSlide, 3000); // Change slide every 3 seconds
    	</script>
	<script>
            const swiper = new Swiper('.swiper', {
            	  // Optional parameters
            	  direction: 'vertical',
            	  loop: true,

            	  // If we need pagination
            	  pagination: {
            	    el: '.swiper-pagination',
            	  },

            	  // Navigation arrows
            	  navigation: {
            	    nextEl: '.swiper-button-next',
            	    prevEl: '.swiper-button-prev',
            	  },

            	  // And if we need scrollbar
            	  scrollbar: {
            	    el: '.swiper-scrollbar',
            	  },
            	});
            </script>
	<script>
            let facilitySlideIndex = 0;
            const facilitySlides = document.querySelectorAll('.facility-slide');
            const totalFacilitySlides = facilitySlides.length;

            function showFacilitySlide(index) {
                if (index >= totalFacilitySlides) {
                    facilitySlideIndex = 0;
                } else if (index < 0) {
                    facilitySlideIndex = totalFacilitySlides - 1;
                } else {
                    facilitySlideIndex = index;
                }
                const offset = -facilitySlideIndex * 100;
                document.querySelector('.facility-slides').style.transform = "translateX(" + offset + "%)";
            }

            function plusFacilitySlides(n) {
                showFacilitySlide(facilitySlideIndex + n);
            }

            showFacilitySlide(facilitySlideIndex);
            setInterval(() => plusFacilitySlides(1), 3000); // 3초마다 슬라이드 변경

            </script>
            <c:if test="${sessionId != null}">
	            <div class="foot-map">
	            	<input type="hidden" id="my-y-point" value="${my_y_cor }">
	            	<input type="hidden" id="my-x-point" value="${my_x_cor }">
	            	<c:forEach var="facility" items="${nearbyFacilities }">
		            	<input type="hidden" class="f-y-point" value="${facility.y_cor }">
		            	<input type="hidden" class="f-x-point" value="${facility.x_cor }">
		            	<input type="hidden" class="f-name" value="${facility.name }">
	            	</c:forEach>
	            	<div id="map" style="width:50%;height:730px;">
	            	</div>
	            	<script>
	            	function mark_info(y_cor, x_cor, name){
		            	var markerPosition  = new kakao.maps.LatLng(y_cor, x_cor); 
		
		            	// 마커를 생성합니다
		            	var marker = new kakao.maps.Marker({
		            	    position: markerPosition
		            	});
		
		            	// 마커가 지도 위에 표시되도록 설정합니다
		            	marker.setMap(map);
		
		            	var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">'+ name.trim() + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		            	    iwPosition = new kakao.maps.LatLng(y_cor, x_cor); //인포윈도우 표시 위치입니다
		
		            	// 인포윈도우를 생성합니다
		            	var infowindow = new kakao.maps.InfoWindow({
		            	    position : iwPosition, 
		            	    content : iwContent 
		            	});
		            	infowindow.open(map, marker); 
	            		
	            	}
	            		
						var my_y_point = parseFloat(document.getElementById("my-y-point").value);
						var my_x_point = parseFloat(document.getElementById("my-x-point").value);
						var f_y_points = document.querySelectorAll(".f-y-point");
						var f_x_points = document.querySelectorAll(".f-x-point");
						var f_names = document.querySelectorAll(".f-name");					
		            	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		                mapOption = {
		                    center: new kakao.maps.LatLng(my_y_point, my_x_point), // 지도의 중심좌표
		                    level: 3 // 지도의 확대 레벨
		                };  
	            		var map = new kakao.maps.Map(mapContainer, mapOption);
	            		// 내 위치 
	            		var points = []
	            		mark_info(my_y_point, my_x_point, "&#128205" + "내위치");
	        			points.push(new kakao.maps.LatLng(my_y_point, my_x_point));
	        			
	            		for (var i=0; i<5; i++){
	            			mark_info(f_y_points[i].value, f_x_points[i].value, "&#127973" + f_names[i].value);
	            			points.push(new kakao.maps.LatLng(f_y_points[i].value, f_x_points[i].value));
	            		}
	            		console.log(points);
	            		var bounds = new kakao.maps.LatLngBounds();    
						
	            		var i, marker;
	            		
	            		for (i = 0; i < points.length; i++) {
	            		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	            		    marker =     new kakao.maps.Marker({ position : points[i] });
	            		    marker.setMap(map);
	            		    
	            		    // LatLngBounds 객체에 좌표를 추가합니다
	            		    bounds.extend(points[i]);
	            		}
	
	            		function setBounds() {
	            		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	            		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	            		    map.setBounds(bounds);
	            		}
	            		
	            		setBounds();
	            	</script>
		            <c:if test="${not empty nearbyFacilities}">
					<div class="facilities">
						<h3>나에게 가장 가까운 요양병원</h3>
						<ul>
							<c:forEach var="facility" items="${nearbyFacilities}">
							<a href="/search/search2?place_name=${facility.name}&address=${facility.address}&disease=${facility.disease}&feature=${facility.feature}&price=${facility.price}&y=${facility.y_cor }&x=${facility.x_cor } ">
								<li>
									<div class="facility-info">
										<div class="facility-name">${facility.name}</div>
										<div class="facility-address" style="font-size : 15px; font-weight : 700;">${facility.address}</div>
										<div class="facility-address" style="color : green;">${facility.disease}</div>
										<div class="facility-address" style="color : orange;">${facility.feature}</div>
									</div>
										<div class="facility-price" style="color : blue;">일 이용 금액 : ${facility.price} 원&nbsp;&nbsp;&nbsp;</div>
									<div class="facility-regdate">
										시설 등록일:
										<span style="color : red;"><fmt:formatDate value="${facility.reg_date}"
											pattern="yyyy-MM-dd" /></span>
									</div>
								</li>
							</a>
							</c:forEach>
						</ul>
					</div>
				</c:if>
	            </div>
            </c:if>
</body>
<script>
document.querySelector('.scroll-icon').addEventListener('click', function() {
    const facilitiesSection = document.querySelector('.facilities');
    if (facilitiesSection) {
        facilitiesSection.scrollIntoView({ behavior: 'smooth' });
    }
});
</script>
<footer>
	<div class="footer">
		<h1 id="foot">(주)실버타운컴퍼니</h1>
		<p>
			<span>대표: 김창민</span><br> <span>통신판매업신고번호 :2016-부산금정-0114</span><br>
			<span>사업자등록번호 617-86-14330</span>
		</p>
		<p>
			<span>주소 : 부산광역시 금정구 중앙대로 1815, 5층(구서동, 가루라빌딩)</span><br> <span>통사무소
				: 서울시 금천구 서부샛길 606 대성디폴리스 B동 1401호</span><br> <span>물류센터 :
				인천광역시 서구 이든1로 21</span>
		</p>
		<p>
			<span>고객센터 : support@thkc.co.kr / 070-7776-7676</span><br> <span>통운영시간
				: 월~금 오전 8:30 ~ 오후 5:30 점심시간 오후 12시 ~ 1시 (주말 및 공휴일 휴무)</span><br>
		</p>
	</div>
</footer>
</html>