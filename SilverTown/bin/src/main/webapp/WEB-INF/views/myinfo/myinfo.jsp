<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- 폰트어썸 불러오기 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <!-- 외부 CSS 및 JS 가져오기 -->
    <link rel="stylesheet" href="/css/topbar.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
    <!-- 페이지 내부 CSS 스타일 -->
    <style>
        body {
            padding-top: 88px;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            display: flex;
            flex: 1;
        }
        .sidebar {
            width: 220px;
            background-color: #03C75A;
            padding-top: 30px;
            position: sticky;
            top: 0;
            
            overflow-y: auto;
        }
        .sidebar h2 {
            color: white;
            text-align: center;
            margin-bottom: 40px;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            text-align: center;
            margin: 20px 0;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }
        .sidebar ul li a:hover {
            color: #b7e4c7;
        }
        .main-content {
            flex: 1;
            padding: 40px;
            padding-right: 250px;
        }
        .info-table {
            width: 100%;
            max-width: 600px;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .info-table th, .info-table td {
            padding: 12px;
        }
        .info-table th {
            background-color: #03C75A;
            color: white;
            font-size: 22px;
        }
        .info-table td h4 {
            margin: 0;
            color: #2d6a4f;
        }
        .info-table input[type="text"],
        .info-table input[type="password"],
        .info-table input[type="email"],
        .info-table input[type="date"] {
            width: calc(100% - 10px);
            padding: 8px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .submit button {
            width: 100%;
            padding: 10px;
            background-color: #03C75A;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .submit button:hover {
            background-color: #03C75A;
        }
        .footer {
            font-size: 10px;
            color: rgba(0, 0, 0, .5);
            width: 100%;
            padding: 10px 30px;
            border-top: 1px solid #ff8f03;
            background-color: white;
            text-align: left;
            position: relative;
            padding-left: 30px;
        }
    </style>
</head>
<body>
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
                            <li><a href="/customer/customer3_list" class="delay-1">1:1 상담</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-4"></div>
                    </li>

                    <c:if test="${session_id == null}">
                        <c:if test="${sessionId == null }">
                            <li class="cell menu-5"><a href="/member/signup1">회원가입</a>
                                <ul>
                                    <li><a href="#" class="delay-1">회원가입</a></li>
                                    <li><a href="#" class="delay-2">이용 약관</a></li>
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
                                <ul>
                                    <li><a href="#" class="delay-1">회원가입</a></li>
                                    <li><a href="#" class="delay-2">이용약관</a></li>
                                </ul>
                                <div class="sub-menu-height sub-menu-height-5"></div>
                            </li>
                        </c:if>
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
                    <a href="https://kauth.kakao.com/oauth/logout?client_id=19855f07670ed426b71b6c31e02bb899&logout_redirect_uri=http://localhost:8181/kakao/logout"> <span>로그아웃</span> <img
                        src="/images/lock.png" alt="Happy Banner"
                        style="width: 20px; height: auto; margin-left: 5px;">
                    </a>
                </div>
            </c:if>
        </div>
    </div>
</header>
<div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
        <h2>마이페이지</h2>
        <ul>
            <li><a href="/myinfo/myinfo">회원정보</a></li>
            <li><a href="/myinfo/passwordCheck">보안설정</a></li>
        </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <form>
            <table class="info-table">
                <tr>
                    <th colspan="2">회원정보</th>
                </tr>
                <tr>
                    <td><h4>아이디</h4></td>
                    <td><input type="text" name="id" value="${memberDto.id}" readonly /></td>
                </tr>
                <tr>
                    <td><h4>비밀번호</h4></td>
                    <td><input type="password" name="pw" value="${memberDto.pw}" readonly /></td>
                </tr>
                <tr>
                    <td><h4>이메일</h4></td>
                    <td><input type="email" name="email" value="${memberDto.email}" readonly /></td>
                </tr>
                <tr>
                    <td><h4>이름</h4></td>
                    <td><input type="text" name="name" value="${memberDto.name}" readonly /></td>
                </tr>
                <tr>
                    <td><h4>주소</h4></td>
                    <td><input type="text" name="address" value="${memberDto.address}" readonly /></td>
                </tr>
                <tr>
                    <td><h4>핸드폰번호</h4></td>
                    <td><input type="text" name="phone" value="${memberDto.phone}" oninput="hypenTel(this)" maxlength="13" placeholder="휴대 전화번호" /></td>
                </tr>
                <tr>
                    <td><h4>성별</h4></td>
                    <td>
                        <input type="radio" id="male" name="gender" value="male" <c:if test="${memberDto.gender == '남성'}">checked="checked"</c:if> />
                        <label for="male">남성</label>
                        <input type="radio" id="female" name="gender" value="female" <c:if test="${memberDto.gender == '여성'}">checked="checked"</c:if> />
                        <label for="female">여성</label>
                    </td>
                </tr>
                <tr>
                    <td><h4>생년월일</h4></td>
                    <td><input type="date" name="birth_date" value="${memberDto.birth_date}" /></td>
                </tr>
                <tr>
                    <td><h4>질환 여부</h4></td>
                     <td>
				        <input type="checkbox" name="disease" value="암" <c:if test="${fn:contains(selectedDiseases, '암')}">checked="checked"</c:if> /> 암
                        <input type="checkbox" name="disease" value="뇌혈관질환" <c:if test="${fn:contains(selectedDiseases, '뇌혈관질환')}">checked="checked"</c:if> /> 뇌혈관질환
                        <input type="checkbox" name="disease" value="중추신경계질환" <c:if test="${fn:contains(selectedDiseases, '중추신경계질환')}">checked="checked"</c:if> /> 중추신경계질환<br>
                        <input type="checkbox" name="disease" value="근골격계질환" <c:if test="${fn:contains(selectedDiseases, '근골격계질환')}">checked="checked"</c:if> /> 근골격계질환
                        <input type="checkbox" name="disease" value="심폐질환" <c:if test="${fn:contains(selectedDiseases, '심폐질환')}">checked="checked"</c:if> /> 심폐질환
                        <input type="checkbox" name="disease" value="치매" <c:if test="${fn:contains(selectedDiseases, '치매')}">checked="checked"</c:if> /> 치매
				    </td>
                </tr>
                <tr>
                    <td><h4>특성별</h4></td>
				    <td>
				        <input type="checkbox" name="feature" value="도심위치" <c:if test="${fn:contains(selectedFeatures, '도심위치')}">checked="checked"</c:if> /> 도심위치
                        <input type="checkbox" name="feature" value="최신시설" <c:if test="${fn:contains(selectedFeatures, '최신시설')}">checked="checked"</c:if> /> 최신시설
                        <input type="checkbox" name="feature" value="대형병원인접" <c:if test="${fn:contains(selectedFeatures, '대형병원인접')}">checked="checked"</c:if> /> 대형병원인접<br>
                        <input type="checkbox" name="feature" value="암특화치료" <c:if test="${fn:contains(selectedFeatures, '암특화치료')}">checked="checked"</c:if> /> 암특화치료
                        <input type="checkbox" name="feature" value="여성전용" <c:if test="${fn:contains(selectedFeatures, '여성전용')}">checked="checked"</c:if> /> 여성전용
                        <input type="checkbox" name="feature" value="치매전문" <c:if test="${fn:contains(selectedFeatures, '치매전문')}">checked="checked"</c:if> /> 치매전문
				    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="submit">
                            <button type="button" onclick="updateBtn()">수정</button>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>
    function updateBtn() {
        location.href = "/myinfo/myinfo2";
    }
</script>
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
</body>
</html>
