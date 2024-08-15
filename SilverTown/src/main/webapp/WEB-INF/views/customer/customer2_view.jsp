<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 게시판</title>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    
    <link rel="stylesheet" href="/css/topbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <script src="/js/topbar.js"></script>
    <script>
        function deleteBtn(post_no) {
            if(confirm("게시글을 삭제하시겠습니까?")) {
                location.href = "/customer/delete2?post_no=" + post_no;
            }
        }
    </script>
    <style >
    
   * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            line-height: 1.6;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: white;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        header {
            background-color: #f8f8f8;
            border-bottom: 1px solid #e7e7e7;
            padding: 10px 0;
        }

        section {
            flex: 1;
            max-width: 1200px; /* 넓이를 900px로 설정 */
            margin-left : 470px;
            padding-top: 20px;
             margin: 80px auto 0 auto;
            background-color: #fff; 
            width: 90%;
            padding-bottom: 40px;
        }

        h1 {
            margin-top: 40px;
    margin-bottom: 30px;
    font-size: 40px;
    background: #03C75A;
    color: #ffffff;
    padding: 30px;
    text-align: left;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e7e7e7;
        }

        th {
            background-color: #f8f8f8;
            font-weight: bold;
        }

        .article {
            padding: 20px 15px;
            line-height: 1.8;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .separator {
            color: #ccc;
            margin: 0 10px;
        }

        .button-group {
            text-align: right;
            margin-top: 20px;
        }

        .list, .button-group a, .button-group div {
            display: inline-block;
            padding: 10px 20px;
            margin-left: 10px;
            background-color: #f8f8f8;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #333;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .list:hover, .button-group a:hover, .button-group div:hover {
            background-color: #e7e7e7;
        }

        .footer {
            font-size: 10px;
            color: rgba(0, 0, 0, .5);
            padding: 10px 30px 10px;
            border-top: 1px solid #ff8f03;
            background-color: white;
            text-align: left;
            width: 100%;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            .button-group {
                text-align: center;
            }

            .list, .button-group a, .button-group div {
                display: block;
                margin: 10px 0;
            }
        }
/* Footer Styles */



    
    
    
    
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
        <h1>질문 게시판</h1>
        <table>
            <colgroup>
                <col width="80%">
                <col width="10%">
                <col width="10%">
            </colgroup>
            <tr>
                <th colspan="3">제목</th>
            </tr>
            <tr>
                <td colspan="3"><strong>${map.customer2Dto.post_title}</strong></td>
            </tr>
            <tr>
                <td>${map.customer2Dto.id}</td>
                <td>조회수</td>
                <td>${map.customer2Dto.post_hit}</td>
            </tr>
            <tr>
                <td colspan="3" class="article">${map.customer2Dto.post_content}</td>
            </tr>
            <tr>
                <td colspan="3"><strong>파일첨부</strong></td>
            </tr>
            <tr>
                <td colspan="3" class="article">
                    <c:choose>
                        <c:when test="${not empty map.customer2Dto.post_file}">
                            <img style="width:50%;" src="/upload/${map.customer2Dto.post_file}" alt="첨부 이미지">
                        </c:when>
                        <c:otherwise>
                            첨부파일 없음
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <strong>다음글</strong> <span class="separator">|</span>
                    <c:choose>
                        <c:when test="${not empty map.prevDto.post_no}">
                            <a href="/customer/customer2_view?post_no=${map.prevDto.post_no}&page=${page}">
                                [게시글] ${map.prevDto.post_title}
                            </a>
                        </c:when>
                        <c:otherwise>
                            다음글이 없습니다.
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <strong>이전글</strong> <span class="separator">|</span>
                    <c:choose>
                        <c:when test="${not empty map.nextDto.post_no}">
                            <a href="/customer/customer2_view?post_no=${map.nextDto.post_no}&page=${page}">
                                [게시글] ${map.nextDto.post_title}
                            </a>
                        </c:when>
                        <c:otherwise>
                            이전글이 없습니다.
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>

        <div class="button-group">
            <a href="/customer/customer2_list?page=${page}&category=${category}&sWord=${sWord}" class="list">목록</a>
            <c:if test="${sessionId eq map.customer2Dto.id}">
                <div class="list" onclick="deleteBtn(${map.customer2Dto.post_no})">삭제</div>
                <a href="/customer/update2?post_no=${map.customer2Dto.post_no}" class="list">수정</a>
            </c:if>
            <a href="/customer/customer2_reply?post_no=${map.customer2Dto.post_no}" class="list">답변달기</a>
        </div>
    </section>

    <footer>
        <div class="footer">
            <h2 id="foot">(주)실버타운컴퍼니</h2>
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
        </div>
    </footer>
</body>
</html>