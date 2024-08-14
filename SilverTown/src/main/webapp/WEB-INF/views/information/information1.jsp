<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>요양원 이해</title>
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
    
    <!-- scrollReveal 불러오기 -->
    <script src="https://unpkg.com/scrollreveal"></script>
    

    <style>
        body {
            background-color: #f6f6f6;
            margin: 0;
            padding: 0;
        }

        .content-wrapper {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .image-container {
            text-align: center;
            margin-bottom: 40px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 10px 0px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            padding-top: 100px;
        }

        .image-container img:hover {
            transform: scale(1.02);
        }

        .text-box {
            background-color: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }

        h2 {
            color: #03C75A;
            border-bottom: 2px solid #03C75A;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        h3 {
            color: #03C75A;
            margin-top: 30px;
        }

        h4 {
            font-weight: normal;
            line-height: 1.6;
        }

        .highlight {
            background-color: #e6f7ff;
            padding: 10px;
            border-left: 4px solid #03C75A;
            margin: 20px 0;
        }
        .footer {
            font-size: 12px;
            color: rgba(0, 0, 0, .6);
            padding: 20px 30px;
            border-top: 1px solid #ff8f03;
            background-color: white;
        }

        /* 추가적인 스타일은 여기에 */
    </style>
</head>
<body>
    	<!-- 헤더 -->
	<%@ include file="../head&foot/header.jsp"%>
	<!-- 헤더 끝 -->

    <div class="content-wrapper">
        <div class="image-container">
            <img src="/images/image 24.png" alt="요양원 이미지">
        </div>

        <div class="text-box">
            <h2 class="reveal">1. 요양원 이해</h2>
            <p class="reveal">의료 분야에서 요양원은 독특하고 중요한 틈새 시장을 차지하고 있습니다. 이러한 전문 시설은 질병, 수술 또는 부상에서 회복 중인 환자의 급성 의료와 일상 생활 복귀 사이의 가교 역할을 합니다. 이 섹션에서는 요양원의 미묘한 차이를 조사하고 그 목적, 디자인, 환자의 웰빙에 미치는 영향을 탐구합니다.</p>

            <h3 class="reveal">a. 요양원의 목적</h3>
            <div class="highlight reveal">
                요양원은 단순한 병원이나 요양원의 확장이 아닙니다. 오히려 치유와 재활을 촉진하기 위해 고안된 의도적인 공간입니다.
            </div>
            <h4 class="reveal">
                • 전인적인 회복: 신체, 정서, 정신, 사회적 측면을 모두 고려한 환경 제공<br>
                • 전환 치료: 병원에서 독립적 생활로의 점진적 이동 지원<br>
                • 커뮤니티 통합: 사회적 상호작용 장려를 통한 회복 촉진
            </h4>

            <h3 class="reveal">b. 디자인 고려사항</h3>
            <h4 class="reveal">
                • 집 같은 분위기: 따뜻한 색상, 편안한 가구, 개인적인 터치<br>
                • 자연 접근: 녹지, 자연광, 신선한 공기 활용<br>
                • 적응형 기능: 이동성 제한 환자를 위한 특별 설계<br>
                • 개인 공간과 공용 공간의 균형
            </h4>
            
            <h3 class="reveal">c. 서비스 및 편의시설:</h3>
            <h4 class="reveal">
                요양원은 다양한 서비스를 제공합니다.<br>
                재활 프로그램: 물리 치료, 작업 치료, 언어 치료는 필수 요소입니다. 환자는 전문가와 협력하여 힘, 이동성 및 기능적 능력을 회복합니다.<br>
                영양 및 다이어트: 맞춤형 식사 계획은 회복을 지원합니다. 영양이 풍부한 식사는 치유를 돕고 합병증을 예방합니다.<br>
                정서적 지원: 숙련된 직원이 정서적 상담을 제공하고 불안, 우울증 및 적응 문제를 해결합니다.<br>
                여가 활동: 미술 수업, 정원 가꾸기, 음악 치료, 애완동물 방문 등을 통해 웰빙이 향상됩니다.<br>
            </h4>
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
							<!-- 글 차례대로뜨는 스크립트 -->
    <script>
        ScrollReveal().reveal('.reveal', { 
            duration: 1000,
            distance: '50px',
            easing: 'ease-in-out',
            origin: 'bottom',
            reset: false,
            interval: 100
        });
    </script>
</body>
</html>
