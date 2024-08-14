<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 정보 페이지</title>
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
</head>


<body>
 <!-- 헤더 -->
    <div class="header">
        <div class="header-inner">
            <a href="/index" class="logo img-box block">
                 <img src="/images/mainlogo.png"> 
            </a>
            <nav class="top-menu-bar row line-height-0">
                <ul class="row">
                    <li class="cell menu-1"><a href="">소개</a>
                        <ul>
                            <li><a href="/introduce/introduce1" class="delay-1">사이트 스토리</a></li>
                            <li><a href="/introduce/introduce2" class="delay-2">실버케어 플랫폼 소개</a></li>
                            <li><a href="/introduce/introduce3" class="delay-3">플랫폼 기술</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-1"></div>
                    </li>
                    <li class="cell menu-2"><a href="search">시설검색</a>
                        <ul class="row">
                            <li class="cell">
                                
                            </li>
                            <li class="cell">
                                
                            </li>
                            <li class="cell">
                                <ul>
                                </ul>
                            </li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-2"></div>
                    </li>
                    <li class="cell menu-3"><a href="">정보</a>
                        <ul>
                            <li><a href="/information/information1" class="delay-1">시설분류</a></li>
                            <li><a href="/information/information2" class="delay-2">보험종류</a></li>
                            <li><a href="/information/information3" class="delay-3">요양등급</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-3"></div>
                    </li>
                </ul>
                <ul class="row cell-right">
                    <li class="cell menu-4"><a href="Help">고객지원</a>
                        <ul>
                            <li><a href="/customer/cutomer1" class="delay-1">자주묻는 질문</a></li>
                            <li><a href="/customer/cutomer2" class="delay-2">질문 게시판</a></li>
                            <li><a href="/customer/cutomer3" class="delay-3">1:1 상담</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-4"></div>
                    </li>
                    <li class="cell menu-5"><a href="member/signup1">회원가입</a>
                        <ul>
                            
                        </ul>
                        <div class="sub-menu-height sub-menu-height-5"></div>
                    </li>
                </ul>
                <div class="sub-menu-bg"></div>
            </nav>

            <div class="search">
                <a href="member/signin">
                    <span>로그인</span>
                    <img src="/images/lock.png" alt="lock" style="width: 20px; height: auto; margin-left: 5px;">
                </a>
            </div>
        </div>
    </div>


<h2>
		시설 검색 페이지




</h2>










</body>



<footer>
<div class="footer">
<h1 id="foot"> (주)실버타운컴퍼니</h1>
<p>
<span>대표: 김창민</span><br>
<span>통신판매업신고번호 :2016-부산금정-0114</span><br>
<span>사업자등록번호 617-86-14330</span>
</p>
<p>
<span>주소 : 부산광역시 금정구 중앙대로 1815, 5층(구서동, 가루라빌딩)</span><br>
<span>통사무소 : 서울시 금천구 서부샛길 606 대성디폴리스 B동 1401호</span><br>
<span>물류센터 : 인천광역시 서구 이든1로 21</span>
</p>
<p>
<span>고객센터 : support@thkc.co.kr / 070-7776-7676</span><br>
<span>통운영시간 : 월~금 오전 8:30 ~ 오후 5:30 점심시간 오후 12시 ~ 1시 (주말 및 공휴일 휴무)</span><br>
</p>
</div>
</footer>
</html>