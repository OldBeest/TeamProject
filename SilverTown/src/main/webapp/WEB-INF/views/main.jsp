<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="ko">
<head>
    <!-- 폰트어썸 불러오기 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!-- css 불러오기 -->
    <link rel="stylesheet" href="/css/Main.css">

    <!-- 제이쿼리 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- js 불러오기 -->
    <script src="/js/topbar.js"></script>

    <!-- 아울 캐러셀 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

    <style>
        {
            font-size: 0.5em; /* Reducing the font size to half */
        }

        #lang {
            display: block;
            margin: 0 auto; /* Center the select box */
        }

        #container {
            padding-top: 180px;
            width: 15%;
            margin: 10px 0;
            position: absolute;
            right: -30px;
        }

        fieldset {
            padding: 10px; /* Adjust padding if needed */
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 20px;
            font-weight: bold;
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
            background-color: #f1f1f1;
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
    </style>
</head>
<body>
    <!-- 헤더 -->
    <div class="header">
        <div class="header-inner">
            <a href="#" class="logo img-box block">
                <img src="/images/mainlogo.png">
            </a>
            <nav class="top-menu-bar row line-height-0">
                <ul class="row">
                    <li class="cell menu-1"><a href="Intro">소개</a>
                        <ul>
                            <li><a href="#" class="delay-1">사이트 스토리</a></li>
                            <li><a href="#" class="delay-2">실버케어 플랫폼 소개</a></li>
                            <li><a href="#" class="delay-3">플랫폼 기술</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-1"></div>
                    </li>
                    <li class="cell menu-2"><a href="Search">시설검색</a>
                        <ul class="row">
                            <li><a href="#" class="delay-1">양로원</a></li>
                            <li class="cell">
                                <ul>
                                    <li><a href="#" class="delay-2">요양병원</a></li>
                                    <li><a href="#" class="delay-3">3</a></li>
                                    <li><a href="#" class="delay-4">4</a></li>
                                    <li><a href="#" class="delay-5">5</a></li>
                                </ul>
                            </li>
                            <li class="cell">
                                <ul>
                                    <li><a href="#" class="delay-2">6</a></li>
                                    <li><a href="#" class="delay-3">7</a></li>
                                    <li><a href="#" class="delay-4">8</a></li>
                                    <li><a href="#" class="delay-5">9</a></li>
                                </ul>
                            </li>
                            <li class="cell">
                                <ul>
                                </ul>
                            </li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-2"></div>
                    </li>
                    <li class="cell menu-3"><a href="Info">정보</a>
                        <ul>
                            <li><a href="#" class="delay-1">시설분류</a></li>
                            <li><a href="#" class="delay-2">보험종류</a></li>
                            <li><a href="#" class="delay-3">요양등급</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-3"></div>
                    </li>
                </ul>
                <ul class="row cell-right">
                    <li class="cell menu-4"><a href="Custom">고객지원</a>
                        <ul>
                            <li><a href="#" class="delay-1">자주묻는 질문</a></li>
                            <li><a href="#" class="delay-1">질문 게시판</a></li>
                            <li><a href="#" class="delay-1">1:1 상담</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-4"></div>
                    </li>
                    <li class="cell menu-5"><a href="SignUp">회원가입</a>
                        <ul>
                            <li><a href="#" class="delay-1">회원가입</a></li>
                            <li><a href="#" class="delay-2">이용 약관</a></li>
                            <li><a href="/admin/index" class="delay-3">관리자 페이지</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-5"></div>
                    </li>
                </ul>
                <div class="sub-menu-bg"></div>
            </nav>

            <div class="search">
                <a href="Login">
                    <span>로그인</span>
                    <img src="/images/lock.png" alt="Happy Banner" style="width: 20px; height: auto; margin-left: 5px;">
                </a>
            </div>
        </div>
    </div>
    <form action="">
        <div id="container">
            <img src="/images/happy.png" alt="Happy Banner" style="width: 100%; height: auto; margin-bottom: 5px;">
            <fieldset>
                <legend>간편가입</legend>
                <label for="lang">지역</label>
                
                <select name="languages" id="lang">
                    <option value="seoul">서울시</option>
                    <option value="gyeonggi">경기도</option>
                </select>
                <br>
                <p><b>생년월일</b></p>
                <br>
                <input type="date" class="info" placeholder="생년월일 8자리">
                <br>
                <p><b>성별</b></p>
                <div class="radio-container">
                    <label for="male"><input type="radio" id="male" name="gen" value="남">남</label>
                    <label for="female"><input type="radio" id="female" name="gen" value="여">여</label>
                </div>
                <br>
                <p><b>해당질병체크</b></p>
                <br>
                <div class="checkbox-container">
                    <label><span>당뇨병</span><input type="checkbox"></label>
                    <label><span>고혈압</span><input type="checkbox"></label>
                    <label><span>뇌혈관질환</span><input type="checkbox"></label>
                    <label><span>소화기질환</span><input type="checkbox"></label>
                    <label><span>간질환</span><input type="checkbox"></label>
                </div>
                <div id="buttons">
                <br><br>
                    <input type="submit" value="가입하기" id="user_submit">
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>
