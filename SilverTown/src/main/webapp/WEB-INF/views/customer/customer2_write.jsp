<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
 
  
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
  
  <style>
  body {
    padding-bottom: 100px; /* Prevent content from being hidden behind the footer */
}
    body, html {
        height: 100%;
        margin: 0;
        padding: 0;
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #fff;
        display: flex;
        flex-direction: column;
    }

    .content {
        flex: 1;
        background-color: #f9f9f9;
        padding-bottom: 20px;
    }

    .write-container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    section {
        text-align: center;
        padding: 20px;
    }

    section h1 {
        font-size: 28px;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f1f1f1;
        font-weight: bold;
    }

    input[type="text"], textarea {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .button-wrapper {
        text-align: center;
        margin-top: 20px;
    }

    .button-wrapper button {
        padding: 10px 20px;
        margin: 0 10px;
        cursor: pointer;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        color: #fff;
    }

    .write {
        background-color: #ff8f03;
    }

    .cancel {
        background-color: #ccc;
    }

    .footer {
    position: fixed; /* Fix the footer to the bottom of the screen */
    bottom: 0; /* Align to the bottom */
    left: 0;
    width: 100%; /* Ensure it spans the entire width of the viewport */
    font-size: 12px;
    color: rgba(0, 0, 0, 0.5);
    padding: 15px;
    border-top: 1px solid #ff8f03;
    background-color: #fff;
    text-align: left;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1); /* Optional: Add some shadow for depth */
    z-index: 1000; /* Ensure it stays on top of other elements */
}

.footer p {
    margin: 0;
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
                        </ul>
                        <div class="sub-menu-height sub-menu-height-4"></div>
                    </li>

 						<c:if test="${session_id == null}">
						<c:if test="${sessionId == null }">
						<li class="cell menu-5"><a href="/member/signup1">회원가입</a>
							<ul>
							<!-- 
								<li><a href="#" class="delay-1">회원가입</a></li>
								<li><a href="#" class="delay-2">이용 약관</a></li>
							 -->
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
								<!-- 
									<li><a href="#" class="delay-1">회원가입</a></li>
									<li><a href="#" class="delay-2">이용약관</a></li>
								 -->
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

<section>
   <h1>질문 게시판 글쓰기</h1>

  <div class="write-container">
    <form action="/customer/customer2_write" name="write" method="post" enctype="multipart/form-data">
      <table>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="id" value="${sessionId}">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="post_title">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="post_content" cols="50" rows="10"></textarea>
          </td>
        </tr>
        <tr>
          <th>첨부하기</th>
          <td>
            <input type="file" name="files" id="file">
          </td>
        </tr>
      </table>
      <div class="button-wrapper">
        <button type="submit" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/customer/customer2_list'">취소</button>
      </div>
    </form>
  </div>
</section>
<footer>
<div class="footer">
<h2 id="foot"> (주)실버타운컴퍼니</h2>
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