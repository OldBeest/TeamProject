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
  <title>질문 게시판</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/customer/customer2_list.css">
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
  <!-- <link rel="stylesheet" href="/css/customer/customer2_style.css"> -->
   <script>
  	function sBtn(){
  		if($("#sWord").val().length<1){
	  		//alert("검색어를 입력하세요.");
	  		return false;
  		}
  		
  		search.submit();
  	}
  </script>
  <style >
  
  body{
  
  padding-top: 100px;
  background-color: white;
  }
  img {
    width: 20px;
    height: 20px;
    
}
  
 .footer{
	
		font-size: 10px;
		color : rgba(0, 0, 0, .5);
		position : relative;
 	 	transform : translateY(0%);
		bottom: 0; /* Stick to the bottom */
		width: 100%; /* Full width */
		padding: 10px 30px 10px; /* Adjust padding as needed */
		border-top: 1px solid #ff8f03;
		background-color: white;
		text-align: left; /* Center align the text */
    }
    .fa-search:before {
    content: "";
}
   .write {
    text-align: center; /* Center content within the .write div */
    margin-top: 20px; /* Add some spacing above */
}

.page-num {
    display: inline-flex; /* Use inline-flex to center horizontally */
    justify-content: center; /* Center items horizontally */
    list-style: none;
    padding: 0;
    margin: 0;
    padding-top: 100px;
}

.page-num li {
    
    padding: 8px;
    cursor: pointer;
    font-size: 14px;
    text-align: center;
}
.fa-chevron-right:before {
    content: "\f054";
}
.page-num .num {
    background-color: #f4f4f4;
    border-radius: 4px;
}

.page-num .myNum {
    background-color: #ff8f03;
    color: white;
    font-weight: bold;
    border-radius: 4px;
}

.page-num .disabled {
    color: rgba(0, 0, 0, 0.3);
    cursor: default;
}

.page-num a {
    text-decoration: none;
    color: inherit;
}

.page-num .first,
.page-num .prev,
.page-num .next,
.page-num .last {
    font-size: 18px;
}

.page-num .first i,
.page-num .prev i,
.page-num .next i,
.page-num .last i {
    font-size: 20px;
}
    .search{
    
    top: +60px !important;
    right : 8px !important;
    }
     .header-inner {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .top-menu-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }

    .left-menu, .right-menu {
        display: flex;
        align-items: center;
    }

    .logo-container {
        margin: 0 20px;  /* 로고 좌우 여백 조정 */
    }

    .logo img {
        width: 100px !important;
        height: 70px !important;
        margin-left: 150px;
        margin-right: 150px;
    }

    /* 반응형 디자인을 위한 미디어 쿼리 */
    @media (max-width: 768px) {
        .top-menu-bar {
            flex-direction: column;
        }

        .logo-container {
            order: -1;  /* 로고를 최상단에 배치 */
            margin: 10px 0;
        }
    }
    .search a {
        font-weight: bold;
    }
    
  </style>
</head>
<body>
<header id="header">
    <div class="header">
        <div class="header-inner">
            <div class="logo-container">
                <a href="/index" class="logo img-box block">
                </a>
            </div>
            <nav class="top-menu-bar row line-height-0">
                 <ul class="row left-menu">
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
                 <div class="logo-container">
        <a href="/index" class="logo img-box block">
            <img src="/images/mainlogo.png" alt="Main Logo">
        </a>
    </div>
                
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
				<div class="sub-menu-bg"></div>
			</nav>

			 </div>
		</div>
</header>
<section>
    <h1>질문 게시판</h1>
    <div id="wrapper">
      <form action="/customer/customer2_list" name="search" method="post" class="search-form">
        <select name="category" id="category">
          <option value="all">전체</option>
          <option value="post_title">제목</option>
          <option value="id">작성자</option>
        </select>
	
          <input type="text" name="sWord" id="sWord" placeholder="검색어를 입력하세요">
  
        <button type="button" onclick="sBtn()"><img src="/images/magnifying-glass-solid.svg"><i class="fas fa-search"></i></button>
      </form>
    </div>
    <table>
      <colgroup>
        <col width="18%">
        <col width="34%">
        <col width="18%">
        <col width="20%">
        <col width="10%">
      </colgroup>
      <tr>
      	<td colspan="5">전체 ${map.countAll}건</td>
      </tr>
      <!-- 제목부분 -->
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
      <!-- 게시판 내용부분 시작 -->
      <c:forEach items="${map.list}" var="c2dto">
	<tr>
		<td>
		<c:if test="${c2dto.post_indent == 0}"> <!-- 답변 부분 번호표시 x -->
			<span class="table-notice">${c2dto.post_no}</span>
		</c:if>
		</td>
		<td class="table-title">
		<c:choose>
		<c:when test="${c2dto.id == null || c2dto.id == '탈퇴한 유저'}">
		<span class="deleted-user-post">${c2dto.post_title}</span>
		</c:when>
		<c:otherwise>
		<a href="/customer/customer2_view?post_no=${c2dto.post_no}&page=${map.page}&category=${map.category}&sWord=${map.sWord}">
		<c:forEach var="i" begin="1" end="${c2dto.post_indent}" step="1">↪Re:</c:forEach>
		${c2dto.post_title}
		</a>
		</c:otherwise>
		</c:choose>
		</td>
		<td>
		<c:choose>
		<c:when test="${c2dto.id == null || c2dto.id == '탈퇴한 유저'}">
		<span class="deleted-user">탈퇴한 유저</span>
		</c:when>
		<c:otherwise>
		${c2dto.id}
		</c:otherwise>
		</c:choose>
		</td>
		<td>
		<c:choose>
		<c:when test="${c2dto.id == null || c2dto.id == '탈퇴한 유저'}">
		<span class="deleted-user"><fmt:formatDate value="${c2dto.post_reg_date}" pattern="YYYY-MM-dd"/></span>
		</c:when>
		<c:otherwise>
		<fmt:formatDate value="${c2dto.post_reg_date}" pattern="YYYY-MM-dd"/>
		</c:otherwise>
		</c:choose>
		</td>
		<td>
		<c:choose>
		<c:when test="${c2dto.id == null || c2dto.id == '탈퇴한 유저'}">
		<span class="deleted-user">${c2dto.post_hit}</span>
		</c:when>
		<c:otherwise>
		${c2dto.post_hit}
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
	</c:forEach>
      
      <!-- 게시판 내용부분 끝 -->
      
    </table>
	<div class="write">
    <button type="button" onclick="writeBtn()">글쓰기</button>
    
    <ul class="page-num">
        <!-- first 부분 -->
        <c:if test="${map.page <= 1}">
            <li class="first disabled"><i class="fas fa-chevron-left"></i></li>
        </c:if>
        <c:if test="${map.page > 1}">
            <a href="customer2_list?page=1"><li class="first"><i class="fas fa-chevron-left"></i></li></a>
        </c:if>
        <!-- prev 부분 -->
        <c:if test="${map.page <= 1}">
            <li class="prev disabled"><i class="fas fa-chevron-left"></i></li>
        </c:if>
        <c:if test="${map.page > 1}">
            <a href="customer2_list?page=${map.page - 1}"><li class="prev"><i class="fas fa-chevron-left"></i></li></a>
        </c:if>
        <!-- 페이지 번호 -->
        <c:forEach var="i" begin="${map.startPage}" end="${map.endPage}" step="1">
            <c:if test="${map.page == i}">
                <li class="myNum num"><div>${i}</div></li>
            </c:if>
            <c:if test="${map.page != i}">
                <a href="customer2_list?page=${i}"><li class="num"><div>${i}</div></li></a>
            </c:if>
        </c:forEach>
        <!-- next 부분 -->
        <c:if test="${map.page >= map.maxPage}">
            <li class="next disabled"><i class="fas fa-chevron-right"></i></li>
        </c:if>
        <c:if test="${map.page < map.maxPage}">
            <a href="customer2_list?page=${map.page + 1}"><li class="next"><i class="fas fa-chevron-right"></i></li></a>
        </c:if>
        <!-- last 부분 -->
        <c:if test="${map.page >= map.maxPage}">
            <li class="last disabled"><i class="fas fa-chevron-right"></i></li>
        </c:if>
        <c:if test="${map.page < map.maxPage}">
            <a href="customer2_list?page=${map.maxPage}"><li class="last"><i class="fas fa-chevron-right"></i></li></a>
        </c:if>
    </ul>
</div>
	<!-- 로그인한 회원은 글쓰기창으로 이동 -->
	<c:if test="${sessionId != null}">
	    <script>
	        function writeBtn(){
	            location.href="/customer/customer2_write"; 
	        }
	    </script>
</c:if>
	
  </section>
</body>
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
</html>