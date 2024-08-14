<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>introduce3</title>
<style>
	html, body {
		height: 100%;
		margin: 0;
		display: flex;
		flex-direction: column;
	}

	.header {
		width: 100%;
	}

	section {
		flex: 1;
		margin: auto;
  width: 90%;
  text-align: center;
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

	body {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16px;
		margin: 0;
  padding: 0;
	}
	h2 {
  margin-top: 100px;
  margin-bottom: 30px;
  font-size: 40px;
  background: #03C75A;
  color: #ffffff;
  padding: 30px;
  text-align: left;
}
	table {
  width: 96%;
  margin-top: 30px;
  margin-left: auto;
  margin-right: auto;
  border-collapse: collapse;
  line-height: 40px;
}
.page-num {
  margin-top: 15px;
}
</style>
</head>
<body>
<!-- 헤더 시작 -->
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
                             <li><a href="/customer/customer1_list" class="delay-1">자주묻는 질문</a></li>
                            <li><a href="/customer/customer2_list" class="delay-1">질문 게시판</a></li>
                            <li><a href="/customer/customer3_list" class="delay-1">1:1 상담</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-4"></div>
                    </li>
                    <li class="cell menu-5"><a href="/member/signup1">회원가입</a>
                        <ul>
                            <li><a href="#" class="delay-2">이용 약관</a></li>
                            <li><a href="#" class="delay-1">회원가입</a></li>
                        </ul>
                        <div class="sub-menu-height sub-menu-height-5"></div>
                    </li>
                </ul>
                <div class="sub-menu-bg"></div>
            </nav>

            <div class="search">
                <a href="/member/signin">
                    <span>로그인</span>
                    <img src="/images/lock.png" alt="lock" style="width: 20px; height: auto; margin-left: 5px;">
                </a>
            </div>
        </div>
    </div>
    <!-- 헤더 끝 -->
    <section>
    <h2>질문 게시판</h2>
    <div id="wrapper">
      <form action="/customer/customer2_list" name="search" method="post" class="search-form">
        <select name="category" id="category">
          <option value="all">전체</option>
          <option value="btitle">제목</option>
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
	        <td><span class="table-notice">${c2dto.bno}</span></td>
	        <td class="table-title">
	        <a href="/customer/customer2_view?bno=${c2dto.bno}&page=${map.page}&category=${map.category}&sWord=${map.sWord}">
	        <c:forEach var="i" begin="1" end="${c2dto.bindent}" step="1">▶</c:forEach>
	        ${c2dto.btitle}
	        </a>
	        </td>
	        <td>${c2dto.id}</td>
	        <td>${c2dto.bdate}</td>
	        <td>${c2dto.bhit}</td>
	      </tr>
      </c:forEach>
      <!-- 게시판 내용부분 끝 -->
    </table>
    <ul class="page-num">
     <!-- first 부분 -->
      <c:if test="${map.page<=1}">
      	<li class="first" ></li>
      </c:if>
      <c:if test="${map.page>1}">
      	<a href="customer2_list?page=1"><li class="first" ></li></a>
      </c:if>
     <!-- prev 부분 -->
      <c:if test="${map.page<=1}">
      	<li class="prev" ></li>
      </c:if>
      <c:if test="${map.page>1}">
      	<a href="customer2_list?page=${map.page-1}"><li class="prev" ></li></a>
      </c:if>
      <c:forEach var="i" begin="${map.startPage}" end="${map.endPage}" step="1">
      <c:if test="${map.page == i}">
      	<li class=" myNum num" ><div>${i}</div></li>
      </c:if>
      <c:if test="${map.page!= i}">
      	<a href="customer2_list?page=${i}"><li class="num" ><div>${i}</div></li></a>
      </c:if>
      </c:forEach>
      <c:if test="${map.page<map.maxPage}">
      	<a href="customer2_list?page=${map.page+1}"><li class="next" ></li></a>
      </c:if>
      <c:if test="${map.page>=map.maxPage}">
      	<li class="next" ></li>
      </c:if>
      <c:if test="${map.page<map.maxPage}">
      	<a href="customer2_list?page=${map.maxPage}"><li class="last" ></li></a>
      </c:if>
       <c:if test="${map.page>=map.maxPage}">
      	<li class="last" ></li>
      </c:if>
    </ul>

    <a href="/customer/customer2_write"><div class="write">글쓰기</div></a>
    
    
    
    
    
    
    </section>
</body>
<footer class="footer">
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
</footer>
</html>
