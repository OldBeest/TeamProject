<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요양등급</title>

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

<!-- ScrollReveal 불러오기 -->
<script src="https://unpkg.com/scrollreveal"></script>

<style>
    body {
        margin: 0;
        padding: 0;
        font-size: 1.6rem;
        line-height: 1.5625;
        font-weight: 400;
        letter-spacing: -0.01em;
        word-break: keep-all;
        overflow-x: hidden;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        background-image: url('/images/main3.jpg');
        background-size: cover;
        background-position: center;
        height: 100%;
    }

    * {
        margin: 0;
        padding: 0;
    }

    section {
        flex: 1;
        display: flex;
        justify-content: center;
        padding-top:5%;
    }

    h2 {
        margin-bottom: 10px;
        text-align: center;
        color: white;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid black;
        text-align: center;
        padding: 8px;
        width: 20%;
        height: 50px;
        border-left: 0;
        border-right: 0;
        color: white;
        font-size: 80%;
    }

    th {
        background-color: #03C75A;
        color: white;
    }

    .footer {
        font-size: 10px;
        color: rgba(0, 0, 0, .5);
        position: fixed;
        bottom: 0;
        width: 100%;
        padding: 10px 30px;
        border-top: 1px solid #ff8f03;
        background-color: white;
        text-align: left;
    }
    
    .wrap {
        padding: 20px 40px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        width: 800px;
        height: 550px;
        position: relative;
        z-index: 2;
        -webkit-backdrop-filter: blur(10px);
        backdrop-filter: blur(40px);
        background-color: rgba(255, 255, 255, .25); /* 밝게 보이도록 배경색 추가 */
        border-radius: 30px; /* 둥근 테두리 */
        box-shadow: 0 6px 20px -15px #000; /* 그림자 효과 */
        border-width: 1px 1px 0 0; /* 입체감 흰색 테두리 */
        border-color: #fff;
        border-style: solid;
    }
</style>
</head>

<body>
   	<!-- 헤더 -->
	<%@ include file="../head&foot/header.jsp"%>
	<!-- 헤더 끝 -->

    <section>
        <div class="wrap reveal">
            <h2 class="cont_title3 bltD">등급판정 기준</h2>
            <table>
                <colgroup>
                    <col width="25%" />
                    <col width="75%" />
                </colgroup>
                <tr>
                    <th>등급구분</th>
                    <th>판정기준</th>
                </tr>
                <tr>
                    <td>장기요양 1등급</td>
                    <td>일상생활에서 전적으로 다른 사람의 도움이 필요한 자로서<br> 장기요양인정점수가 95점 이상인 자</td>
                </tr>
                <tr>
                    <td>장기요양 2등급</td>
                    <td>일상생활에서 상당 부분 다른 사람의 도움이 필요한 자로서<br> 장기요양인정점수가 75점 이상 95점 미만인 자</td>
                </tr>
                <tr>
                    <td>장기요양 3등급</td>
                    <td>일상생활에서 부분적으로 다른 사람의 도움이 필요한 자로서<br> 장기요양인정점수가 60점 이상 75점 미만인 자</td>
                </tr>
                <tr>
                    <td>장기요양 4등급</td>
                    <td>일상생활에서 일정부분 다른 사람의 도움이 필요한 자로서<br> 장기요양인정점수가 51점 이상 60점 미만인 자</td>
                </tr>
                <tr>
                    <td>장기요양 5등급</td>
                    <td>치매환자로서 장기요양인정점수가 45점 이상 51점 미만인 자</td>
                </tr>
            </table>
        </div>
    </section>

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

    <script>
        // ScrollReveal 애니메이션 설정
        ScrollReveal().reveal('.reveal', {
            duration: 2000,
            origin: 'bottom',
            distance: '50px'
        });
    </script>
</body>
</html>
