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
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 220px;
            background-color: #03C75A;
            padding-top: 50px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
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
            flex-grow: 1;
            background-color: #ffffff;
            margin-left: 220px;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
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
    </style>
</head>
<body>
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
                        <td><input type="text" name="phone" value="${memberDto.phone}" readonly oninput="hypenTel(this)" maxlength="13" placeholder="휴대 전화번호" /></td>
                    </tr>
                  <tr>
				    <td><h4>성별</h4></td>
				    <td>
				        <input type="radio" id="male" name="gender" value="male" disabled <c:if test="${memberDto.gender == '남성'}">checked="checked"</c:if> />
				        <label for="male">남성</label>
				        <input type="radio" id="female" name="gender" value="female" disabled <c:if test="${memberDto.gender == '여성'}">checked="checked"</c:if> />
				        <label for="female">여성</label>
				    </td>
				</tr>
                    <tr>
                        <td><h4>생년월일</h4></td>
                        <td><input type="date" name="birth_date" value="${memberDto.birth_date}" disabled /></td>
                    </tr>
                <tr>
				    <td><h4>질환 여부</h4></td>
				    <td>
				        <input type="checkbox" name="disease" value="암" disabled <c:if test="${fn:contains(selectedDiseases, '암')}">checked="checked"</c:if> /> 암
				        <input type="checkbox" name="disease" value="뇌혈관질환" disabled <c:if test="${fn:contains(selectedDiseases, '뇌혈관질환')}">checked="checked"</c:if> /> 뇌혈관질환
				        <input type="checkbox" name="disease" value="중추신경계질환" disabled <c:if test="${fn:contains(selectedDiseases, '중추신경계질환')}">checked="checked"</c:if> /> 중추신경계질환<br>
				        <input type="checkbox" name="disease" value="근골격계질환" disabled <c:if test="${fn:contains(selectedDiseases, '근골격계질환')}">checked="checked"</c:if> /> 근골격계질환
				        <input type="checkbox" name="disease" value="심폐질환" disabled <c:if test="${fn:contains(selectedDiseases, '심폐질환')}">checked="checked"</c:if> /> 심폐질환
				        <input type="checkbox" name="disease" value="치매" disabled <c:if test="${fn:contains(selectedDiseases, '치매')}">checked="checked"</c:if> /> 치매
				    </td>
				</tr>
				<tr>
				    <td><h4>특성별</h4></td>
				    <td>
				        <input type="checkbox" name="feature" value="도심위치" disabled <c:if test="${fn:contains(selectedFeatures, '도심위치')}">checked="checked"</c:if> /> 도심위치
				        <input type="checkbox" name="feature" value="최신시설" disabled <c:if test="${fn:contains(selectedFeatures, '최신시설')}">checked="checked"</c:if> /> 최신시설
				        <input type="checkbox" name="feature" value="대형병원인접" disabled <c:if test="${fn:contains(selectedFeatures, '대형병원인접')}">checked="checked"</c:if> /> 대형병원인접<br>
				        <input type="checkbox" name="feature" value="암특화치료" disabled <c:if test="${fn:contains(selectedFeatures, '암특화치료')}">checked="checked"</c:if> /> 암특화치료
				        <input type="checkbox" name="feature" value="여성전용" disabled <c:if test="${fn:contains(selectedFeatures, '여성전용')}">checked="checked"</c:if> /> 여성전용
				        <input type="checkbox" name="feature" value="치매전문" disabled <c:if test="${fn:contains(selectedFeatures, '치매전문')}">checked="checked"</c:if> /> 치매전문
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
    	// 화원정보 수정창으로 이동
        function updateBtn() {
            location.href = "/myinfo/myinfo2";
        }
    </script>
</body>
</html>
