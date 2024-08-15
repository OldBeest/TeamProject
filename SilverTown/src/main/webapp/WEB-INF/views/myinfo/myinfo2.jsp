<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <!-- 폰트어썸 다운로드 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- CSS 및 JS 가져오기 -->
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/topbar.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/js/scripts.js"></script>
    <script src="/js/topbar.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        body {
            background-color: white;
        }

        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            width: 100%;
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 80px;
        }

        h2 {
            color: #2e8b57;
            border-bottom: 2px solid #2e8b57;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group input[type="date"],
        .form-group input[type="radio"],
        .form-group input[type="checkbox"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group input[type="text"]#id {
            border: none;
            background-color: #f0f8f0;
            font-weight: bold;
            cursor: default;
            color: #333;
        }

        .form-group input[type="radio"] {
            width: auto;
            margin-right: 5px;
        }

        .form-group input[type="checkbox"] {
            width: auto;
            margin-right: 5px;
        }

        .form-group .form-checkbox-group {
            display: flex;
            flex-wrap: wrap;
        }

        .form-group .form-checkbox-group label {
            margin-right: 15px;
        }

        .submit {
            text-align: center;
        }

        .submit button {
            background-color: #2e8b57;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 10px;
        }

        .submit button:hover {
            background-color: #1f6f4f;
        }

        .footer {
            font-size: 10px;
            color: rgba(0, 0, 0, .5);
            width: 100%;
            padding: 10px 30px;
            border-top: 1px solid #ff8f03;
            background-color: white;
            text-align: left;
        }

        .gender_flex {
            display: flex;
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
                            <li><a href="/customer/customer3_list" class="delay-1">1:1 상담</a></li>
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
</header>

<div class="main-content">
    <div class="container">
        <h2>회원정보 수정</h2>
        <form action="/myinfo/update" method="post" name="infoFrm">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" value="${memberDto.id}" readonly />
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${memberDto.email}" placeholder="E-MAIL" />
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="${memberDto.name}" placeholder="NAME" />
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" value="${memberDto.address}" placeholder="ADDRESS" />
            </div>
            <div class="form-group">
                <label for="phone">핸드폰번호</label>
                <input type="text" id="phone" name="phone" value="${memberDto.phone}" oninput="hypenTel(this)" maxlength="13" placeholder="휴대 전화번호" />
            </div>
            <div class="form-group gender_flex">
                <label>성별 &nbsp;&nbsp;</label>
                <input type="radio" id="male" name="gender" value="male" <c:if test="${memberDto.gender == '남성'}">checked="checked"</c:if> />
                <label for="male">남성</label>
                <input type="radio" id="female" name="gender" value="female" <c:if test="${memberDto.gender == '여성'}">checked="checked"</c:if> />
                <label for="female">여성</label>
            </div>
            <div class="form-group">
                <label for="birth_date">생년월일</label>
                <input type="date" id="birth_date" name="birth_date" value="${memberDto.birth_date}" placeholder="생년월일" />
            </div>
            <div class="form-group">
					<label>질환 여부</label>
				        <input type="checkbox" name="disease" value="암" <c:if test="${fn:contains(selectedDiseases, '암')}">checked="checked"</c:if> /> 암
                        <input type="checkbox" name="disease" value="뇌혈관질환" <c:if test="${fn:contains(selectedDiseases, '뇌혈관질환')}">checked="checked"</c:if> /> 뇌혈관질환
                        <input type="checkbox" name="disease" value="중추신경계질환" <c:if test="${fn:contains(selectedDiseases, '중추신경계질환')}">checked="checked"</c:if> /> 중추신경계질환<br>
                        <input type="checkbox" name="disease" value="근골격계질환" <c:if test="${fn:contains(selectedDiseases, '근골격계질환')}">checked="checked"</c:if> /> 근골격계질환
                        <input type="checkbox" name="disease" value="심폐질환" <c:if test="${fn:contains(selectedDiseases, '심폐질환')}">checked="checked"</c:if> /> 심폐질환
                        <input type="checkbox" name="disease" value="치매" <c:if test="${fn:contains(selectedDiseases, '치매')}">checked="checked"</c:if> /> 치매
				    <label>특성별</label>
				        <input type="checkbox" name="feature" value="도심위치" <c:if test="${fn:contains(selectedFeatures, '도심위치')}">checked="checked"</c:if> /> 도심위치
                        <input type="checkbox" name="feature" value="최신시설" <c:if test="${fn:contains(selectedFeatures, '최신시설')}">checked="checked"</c:if> /> 최신시설
                        <input type="checkbox" name="feature" value="대형병원인접" <c:if test="${fn:contains(selectedFeatures, '대형병원인접')}">checked="checked"</c:if> /> 대형병원인접<br>
                        <input type="checkbox" name="feature" value="암특화치료" <c:if test="${fn:contains(selectedFeatures, '암특화치료')}">checked="checked"</c:if> /> 암특화치료
                        <input type="checkbox" name="feature" value="여성전용" <c:if test="${fn:contains(selectedFeatures, '여성전용')}">checked="checked"</c:if> /> 여성전용
                        <input type="checkbox" name="feature" value="치매전문" <c:if test="${fn:contains(selectedFeatures, '치매전문')}">checked="checked"</c:if> /> 치매전문
            </div>
            <div class="submit">
                <button type="button" onclick="doupdateBtn()">수정완료</button>
                <button type="button" onclick="deleteBtn('${memberDto.id}')">회원탈퇴</button>
            </div>
        </form>
    </div>
</div>
<script>
        function hypenTel(input) {
            // 전화번호 하이픈 자동 삽입 스크립트
            const value = input.value.replace(/\D/g, '');
            if (value.length <= 3) {
                input.value = value;
            } else if (value.length <= 6) {
                input.value = value.slice(0, 3) + '-' + value.slice(3);
            } else if (value.length <= 10) {
                input.value = value.slice(0, 3) + '-' + value.slice(3, 6) + '-' + value.slice(6);
            } else {
                input.value = value.slice(0, 3) + '-' + value.slice(3, 6) + '-' + value.slice(6, 10) + '-' + value.slice(10);
            }
        }

        function deleteBtn(id) {
            if (confirm("회원탈퇴 하시겠습니까?")) {
                location.href = "/member/delete?id=" + id;
            }
        }

        function doupdateBtn() {
            alert("수정완료됐습니다");
            infoFrm.submit();
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
