<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>플랫폼 기술</title>
    <!-- 기존 스타일시트 및 스크립트 링크들 -->
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
    @font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
        body {
            font-family: 'Pretendard-Regular', sans-serif;
            background-color: #f6f6f6;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .content-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px); /* 헤더와 푸터 높이에 따라 조정 */
            padding: 40px 0;
            background-color: white;
            padding-left: 40px;
            padding-right: 40px;
        }

        .image-grid {
        	width : 100%;
            display: flex;
            flex-wrap: wrap; /* 이미지가 너무 많을 경우 다음 줄로 넘어가게 함 */
            gap: 200px; /* 이미지 사이의 간격 */
        }

        .image-item {
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            opacity: 0;
            animation: fadeIn 1s ease-out forwards;
            flex: 1 1 200px; /* 이미지 아이템이 최소 200px 너비를 가지게 함 */
            max-width: 300px; /* 이미지 아이템의 최대 너비 설정 */
        }
@keyframes blink {
    0%, 50%, 100% {
        opacity: 0;
    }
    25%, 75% {
        opacity: 1;
    }
}

        .image-item:nth-child(1) .arrow {
    display: none;
}
.image-item:nth-child(2) .arrow {
    display: block;
}
.image-item:nth-child(3) .arrow {
    display: block;
}
.image-item:nth-child(4) .arrow {
    display: block;
}
.image-item:nth-child(5) .arrow {
    display: block;
}

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .image-item:hover {
            transform: translateY(-10px);
        }

        .image-item img {
            width: 100%;
            height: auto;
            display: block;
        }

        .footer {
            font-size: 12px;
            color: rgba(0, 0, 0, .6);
            padding: 20px 30px;
            border-top: 1px solid #ff8f03;
            background-color: white;
        }

        .image-grid {
    width : 80%;
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    align-items: center;
    position : relative;
}

.arrow {
    font-size: 10px;
    color: #ff8f03;
    animation: blink 2s infinite;
    
}
.arrow img {
    width: 70px; /* 화살표 이미지의 너비를 30px로 설정 */
    height: auto; /* 높이는 자동으로 조정되어 비율을 유지 */
}

@keyframes blink {
    0%, 50%, 100% {
        opacity: 0;
    }
    25%, 75% {
        opacity: 1;
    }
}

/* 모바일 화면에서 화살표 숨기기 */
@media (max-width: 768px) {
    .arrow {
        display: none;
    }
}
    </style>
</head>
<body>
    <!-- 헤더 시작 -->
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
    <!-- 헤더 끝 -->
	<h2 style="margin : 0; padding-top : 120px; font-size: 50px; text-align: center; background: white; color : green;">서비스 소개</h2>
    <div class="content-wrapper">
        <div class="image-grid">
		    <div class="image-item">
		        <img src="/images/people.png" alt="기술 카드 1">
		        	<div style="font-size: 25px; font-weight: 700; text-align: center;">사용자의 <span style="color : red;">주소 및 특성 정보</span> 입력</div>
		    </div>
		        	<div style="font-size: 20px; font-weight: 700;">주소를 <span style="color : red;">위도 및 경도</span> 로변환</div>
			    <div class="arrow"><img src="/images/arrow.png" ></div>
			    <div class="image-item">
			        <img src="/images/db.png" alt="기술 카드 2">
		        	<div style="font-size: 25px; font-weight: 700; text-align: center;"><span style="color : blue;">DB</span>에 등록된 <span style="color : red;">시설 정보</span> 비교</div>
			    </div>
			    <div class="arrow"><img src="/images/arrow.png" ></div>
		        	<div style="font-size: 20px; font-weight: 700;">위도 경도 기반 <span style="color : red;">거리 계산</span></div>
			    <div class="image-item">
			        <img src="/images/computer.png" alt="기술 카드 3">
		        	<div style="font-size: 25px; font-weight: 700; text-align: center;"><span style="color : blue;">가장 가깝고 </span><span style="color : red;">특성에 맞는</span> 시설을 추천</div>
			    </div>
			    <div class="image-item4 arrow">
			        <img src="/images/arrow2.png" style="width : 1200px; height : 200px; top : -50px; position: relative; transform : rotate(-5deg);" alt="기술 카드 4">
		        	<div style="font-size: 25px; font-weight: 700; text-align: center; color : black;">사용자 화면에 <span style="color : red;">표시</span></div>
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
