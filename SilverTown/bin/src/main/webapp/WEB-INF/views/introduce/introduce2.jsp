<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>실버케어 플랫폼 소개</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!-- css 불러오기 -->
    <link rel="stylesheet" href="/css/topbar.css">

    <!-- 제이쿼리 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- js 불러오기 -->
    <script src="/js/topbar.js"></script>

    <!-- 아울 캐러셀 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

    <style>
    
      body {
            font-family: 'Pretendard', sans-serif;
            background-color: #f6f6f6;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .content-wrapper {
            flex: 1;
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            padding-top: 100px;
            padding-bottom: 200px;
            
        }

        .footer {
            font-size: 10px;
            color: rgba(0, 0, 0, .5);
            position: fixed;
            bottom: 0; /* Stick to the bottom */
            width: 100%; /* Full width */
            padding: 10px 30px; /* Adjust padding as needed */
            border-top: 1px solid #ff8f03;
            background-color: white;
            text-align: left; /* Left align the text */
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .grid-item {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            
        }

        .grid-item:hover {
            transform: translateY(-5px);
        }

        .grid-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .grid-item h2, .grid-item h3 {
            color: #ff8f03;
            margin: 15px;
        }

        .grid-item p {
            color: #333;
            margin: 0 15px 15px;
            font-size: 14px;
            line-height: 1.6;
        }

        .main-image {
            grid-column: 1 / -1;
        }

        .main-image img {
            height: 300px;
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: 1fr;
            }
        }

        /* Add any additional styles for header, navigation, etc. here */
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header id="header">
   	<div class="header">
        <div class="header-inner">
            <a href="/index" class="logo img-box block">
                <img src="/images/mainlogo.png">
            </a>
            <nav class="top-menu-bar row line-height-0">
                <ul class="row">
                    <li class="cell menu-1"><a href="/introduce/introduce1">소개</a>
		                <ul>
		                    <li><a href="/introduce/introduce1" class="delay-1">사이트 스토리</a></li>
		                    <li><a href="/introduce/introduce2" class="delay-2">실버케어 플랫폼 소개</a></li>
		                    <li><a href="/introduce/introduce3" class="delay-3">플랫폼 기술</a></li>
                            <li><a href="/chatbot/index" class="delay-4">챗봇사이트(베타)</a></li>
		                </ul>
                        <div class="sub-menu-height sub-menu-height-1"></div>
                    </li>
                    <li class="cell menu-2"><a href="/search/search1">시설검색</a>
						<ul class="row">
							<!-- 
                         	<li><a href="map_test">검색 주소 마커 표시하기</a></li>
							<li><a href="keyword_map">키워드로 검색하기</a></li>        
							<li><a href="db_map">디비 연동?</a></li>       
							 -->       
                        </ul>
                        <div class="sub-menu-height sub-menu-height-2"></div>
                    </li>
                    <li class="cell menu-3"><a href="/information/information1">정보</a>
                        <ul>
                            <li><a href="/information/information1" class="delay-1">시설분류</a></li>
                            <li><a href="/information/information2" class="delay-2">보험종류</a></li>
                            <li><a href="/information/information3" class="delay-3">요양등급</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-3"></div>
                    </li>
                </ul>
                <ul class="row cell-right">
                    <li class="cell menu-4"><a href="/customer/customer1_list">고객지원</a>
                        <ul>
                            <li><a href="/customer/customer1_list" class="delay-1">자주묻는 질문</a></li>
                            <li><a href="/customer/customer2_list" class="delay-1">질문 게시판</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-4"></div>
                    </li>

 						<c:if test="${session_id == null}">
						<c:if test="${sessionId == null }">
						<li class="cell menu-5"><a href="/member/signup1">회원가입</a>
							<ul>
								
							</ul>
							<div class="sub-menu-height sub-menu-height-5"></div>
						</li>
						</c:if>
						</c:if>


						<c:if test="${sessionId != null }">
						<c:if test="${sessionId == 'admin' }">
							<li class="cell menu-5"><a href="/admin/index">관리자페이지</a>								
						</c:if>
						<c:if test="${sessionId != 'admin' }">
							<li class="cell menu-5"><a href="/myinfo/myinfo">마이페이지</a>																							
						</c:if>
								<ul>
									<li><a href="#" class="delay-1">회원가입</a></li>
									<li><a href="#" class="delay-2">이용약관</a></li>
								</ul>
								<div class="sub-menu-height sub-menu-height-5"></div>
							</li>
						</c:if>

				</ul>
				<div class="sub-menu-bg"></div>
			</nav>

			<c:if test="${session_id == null}">
			<c:if test="${sessionId == null}">
				<div class="search">
					<a href="/member/signin"> <span>로그인</span> <img
						src="/images/lock.png" alt="Happy Banner"
						style="width: 20px; height: auto; margin-left: 5px;">
					</a>
				</div>
			</c:if>
			</c:if>


			<c:if test="${sessionId != null}">
				<div class="search">
					<a href="/member/signout"> <span>로그아웃</span> <img
						src="/images/lock.png" alt="Happy Banner"
						style="width: 20px; height: auto; margin-left: 5px;">
					</a>
				</div>
			</c:if>


			<c:if test="${session_id != null}">
				<div class="search">
					<a href="https://kauth.kakao.com/oauth/logout?client_id=19855f07670ed426b71b6c31e02bb899&logout_redirect_uri=http://localhost:8181/kakao/logout""> <span>로그아웃</span> <img
						src="/images/lock.png" alt="Happy Banner"
						style="width: 20px; height: auto; margin-left: 5px;">
					</a>
				</div>
			</c:if>
			
		</div>
	</div>
    </header>

   <div class="content-wrapper">
    <div class="grid-container">
        <div class="grid-item main-image">
            <img src="/images/소개1.png" alt="">
            <h2>우리 가족을 위한 최적의 요양시설 찾기</h2>
            <p>고령의 부모님이나 사랑하는 이가 필요한 요양시설을 찾는 것은 큰 결정이자 중요한 과정입니다. 저희 실버타운은 이러한 결정을 보다 쉽고 명확하게 도와드리기 위해 설계된 전문 추천 서비스 플랫폼입니다.</p>
        </div>
        <div class="grid-item">
            <img src="/images/소개2.png" alt="">
            <h3>우리가 제공하는 서비스</h3>
            <p>맞춤형 추천: 최신 데이터와 이용자 리뷰를 기반으로, 개인의 건강 상태와 필요에 맞는 최적의 요양시설을 추천해드립니다. 상세한 검색 옵션을 통해 사용자는 자신의 조건에 맞는 시설을 쉽게 찾을 수 있습니다.</p>
        </div>
        <div class="grid-item">
            <img src="/images/소개3.png" alt="">
            <h3>우리 엄마, 아빠 가족을 위한 요양시설 찾기</h3>
            <p>보건복지부와 한국보건사회연구원이 발표한 2022년 장기요양 실태조사에 따르면, 요양시설 선택 시 고려하는 사항으로 집에서 요양서비스를 받는 재가급여의 경우 주변인의 소개 및 추천이 1순위, 요양시설에 입소하여 요양서비스를 받는 시설급여의 경우 물질적 환경이 1순위로 가장 높은 비중을 차지했습니다.

​</p>
        </div>
        <div class="grid-item">
            <img src="/images/소개4.png" alt="">
            <h3>왜 실버타운을 선택해야 할까요?</h3>
            <p>신뢰성 있는 데이터: 정확하고 신뢰할 수 있는 데이터를 기반으로 서비스를 제공합니다</p>
            <br>
			<p>편리한 사용: 직관적인 인터페이스와 간편한 검색 기능으로 쉽고 빠르게 원하는 정보를 찾을 수 있습니다.</p>
			<br>
			<p>고객 중심 서비스: 고객의 편리함과 만족도를 최우선으로 생각하여 지속적으로 서비스를 개선해 나갑니다.</p>
			<br>
			<p>사랑하는 가족이 편안하고 안전한 환경에서 생활할 수 있도록, 저희 실버타운이 함께 하겠습니다. 요양시설에 대한 궁금증이나 도움이 필요하시다면 언제든지 문의해 주세요.</p>        
        </div>
        <div class="grid-item">
            <img src="/images/소개5.png" alt="">
            <h3>나와 부모님을 위한 방문약료 서비스, 다제약물 관리사업</h3>
            <p>﻿만성질환으로 장기간 많은 약을 복용하는 만큼 올바르게 약 복용하는 것이 중요하기 때문에 오늘은 나와 부모님을 위한 방문약료 서비스, 다제약물 관리사업을 안내해 드리겠습니다. </p>        
            
            
        </div>
    </div>
</div>

    <footer class="footer">
        <h1 id="foot">(주)실버타운컴퍼니</h1>
        <p>
            <span>대표: 김창민</span><br>
            <span>통신판매업신고번호: 2016-부산금정-0114</span><br>
            <span>사업자등록번호: 617-86-14330</span>
        </p>
        <p>
            <span>주소: 부산광역시 금정구 중앙대로 1815, 5층(구서동, 가루라빌딩)</span><br>
            <span>통사무소: 서울시 금천구 서부샛길 606 대성디폴리스 B동 1401호</span><br>
            <span>물류센터: 인천광역시 서구 이든1로 21</span>
        </p>
        <p>
            <span>고객센터: support@thkc.co.kr / 070-7776-7676</span><br>
            <span>운영시간: 월~금 오전 8:30 ~ 오후 5:30 점심시간 오후 12시 ~ 1시 (주말 및 공휴일 휴무)</span>
        </p>
    </footer>
</body>
</html>