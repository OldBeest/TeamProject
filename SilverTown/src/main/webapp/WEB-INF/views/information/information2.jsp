<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>노인장기요양보험제도</title>
    <!-- 폰트어썸 불러오기 -->
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
            height: 100%;
            line-height: 1.6;
            background-color: #f6f6f6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1, h2, h3 {
            color: #ff8f03;
        }
        .box {
            background-color: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            padding: 20px;
            margin-bottom: 20px;
            border-color: #03C75A;
            border-width: 3px;
        }
        ul {
            padding-left: 20px;
        }
        .img-container {
            text-align: center;
            margin: 20px 0;
        }
        img {
            max-width: 100%;
            height: auto;
        }
        .footer {
            font-size: 10px;
            color: rgba(0, 0, 0, .5);
            position: relative;
            padding: 10px 30px 20px;
            border-top: 1px solid #ff8f03;
            background-color: white;
        }
    </style>
</head>
<body style="background-color:#F6F6F6">
    	<!-- 헤더 -->
	<%@ include file="../head&foot/header.jsp"%>
	<!-- 헤더 끝 -->

    <div class="container">
        <h1 class="reveal">노인장기요양보험제도</h1>
        
        <div class="box reveal">
            <h2>의의</h2>
            <p>고령이나 노인성 질병 등으로 일상생활을 혼자서 수행하기 어려운 이들에게 신체활동 및 일상생활 지원 등의 서비스를 제공하여 노후 생활의 안정과 그 가족의 부담을 덜어주기 위한 사회보험제도</p>
        </div>
        
        <div class="box reveal">
            <h2>주요내용</h2>
            <h3>신청대상</h3>
            <ul>
                <li>소득수준과 상관없이 노인장기요양보험 가입자(국민건강보험 가입자와 동일)와 그 피부양자</li>
                <li>의료급여수급권자로서 65세 이상 노인과 65세 미만의 노인성 질병이 있는 자</li>
            </ul>
        </div>
        
        <div class="box reveal">
            <h3>급여대상</h3>
            <ul>
                <li>65세 이상 노인 또는 치매, 중풍, 파킨스병 등 노인성 질병을 앓고 있는 65세 미만인 자 중 6개월 이상의 기간 동안 일상생활을 수행하기 어려워 장기요양서비스가 필요하다고 인정되는 자</li>
                <li>장기요양등급 : 1등급, 2등급, 3등급, 4등급, 5등급</li>
            </ul>
        </div>
        
        <div class="box reveal">
            <h3>장기요양인정 및 서비스 이용절차</h3>
            <ol>
                <li>신청 (공단 각 지사별 장기요양센터)</li>
                <li>방문조사 (공단직원)</li>
                <li>장기요양 인정 및 등급판정 (등급판정위원회)</li>
                <li>장기요양인정서 및 표준장기요양이용계획서 통보 (장기요양센터)</li>
                <li>서비스 이용 (장기요양기관)</li>
            </ol>
            <div class="img-container reveal">
                <img src="/images/old01_01_02.gif" alt="노인장기요양보험제도 이용절차">
            </div>
        </div>
        
        <!-- 추가 내용을 더 넣을 수 있습니다 -->
        
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
