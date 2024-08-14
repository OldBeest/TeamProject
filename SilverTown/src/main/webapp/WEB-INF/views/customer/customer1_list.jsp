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
<title>자주묻는 질문</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/css/customer/customer1_list.css">
<!-- 
<link rel="stylesheet" href="/css/customer/customer1_style.css">
 -->

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
  .faq-container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
  }
  section {
    margin: auto;
    width: 90%;
    text-align: center;
   padding-top: 50px;
}
  .faq-item {
    cursor: pointer;
    padding: 15px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
    background-color: #f9f9f9;
  }
  .faq-content {
    display: none;
    padding: 15px;
    border: 1px solid #ddd;
    border-top: none;
    background-color: #fff;
  }
  .header {
        position: relative;
    }
    .header-inner {
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }
    .logo-container {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
    }
    .logo img {
        max-height: 60px; /* 로고 이미지의 최대 높이를 설정합니다. 필요에 따라 조정하세요 */
    }
    .top-menu-bar {
        width: 100%;
        justify-content: space-between;
    }
    .footer{
	
		font-size: 10px;
		color : rgba(0, 0, 0, .5);
		position : relative;
 	 	transform : translateY(0%);
		bottom: -80px; /* Stick to the bottom */
		width: 100%; /* Full width */
		padding: 10px 30px 10px; /* Adjust padding as needed */
		border-top: 1px solid #ff8f03;
		background-color: white;
		text-align: left; /* Center align the text */
    }
    body{
        background-color: white;
    
    }
    
</style>
<script>
function sBtn(){
  if($("#sWord").val().length<1){
    return false;
  }
  search.submit();
}

$(document).ready(function() {
  $('.faq-item').click(function() {
    $(this).next('.faq-content').slideToggle();
  });
});
</script>
</head>
<body>
<header id="header">
    <div class="header">
        <div class="header-inner">
            <div class="logo-container">
                <a href="/index" class="logo img-box block">
                    <img src="/images/mainlogo.png" alt="Main Logo">
                </a>
            </div>
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
		</div>
</header>
	
<section>
  <h1>자주묻는 질문</h1>

  <div class="faq-container">
    <div class="faq-item">Q1. 요양원과 요양병원은 다른가요?</div>
    <div class="faq-content">크게 요양원은 비의료기관, 요양병원은 의료기관으로 구분됩니다. </div>

    <div class="faq-item">Q2. 면회 및 외출은 자유롭게 할 수 있나요?</div>
    <div class="faq-content">현행기준(21년 3월 9일부터) 요양병원은 2단계 이하, 요양시설은 2.5단계 이하에서 비접촉 방문 면회가 가능합니다. 예외적으로 임종 시기, 환자나 입소자의 의식불명 및 이에 준하는 중증환자, 주치의가 환자의 정서적 안정을 위해 면회 필요성을 인정하는 경우 등에 대해서는 접촉 면회가 가능하도록 규정하고 있습니다.</div>

    <div class="faq-item">Q3. 예민한 성격을 가진 부모님, 요양원에 잘 적응하실 수 있을까요? </div>
    <div class="faq-content">세각자 다른 특성을 가진 어르신들이 많기 때문에 요양시설에서는 사생활을 존중하는 공간 구성이나 직원들의 케어에 의해 생활할 수 있도록 배려되어 있습니다. 부모님 특유의 성향이 고민되신다면 해당 입소 시설에 어르신에 대한 성격이나 생활패턴 등을 상세히 피드백 해주시는 것도 좋은 방법이 되겠습니다!</div>

    <div class="faq-item">Q4. 시설의 식사는 어떻게 나오나요?</div>
    <div class="faq-content">보통 일반식으로 제공되지만 필요한 경우 치아나 영양상태와 같은 개별 특이사항에 맞춰 배식이 진행됩니다. 스스로 식사가 어려우신 경우 직원들의 도움을 받기도 합니다.</div>

    <div class="faq-item">Q5. 요양병원은 연령에 상관없이 입원이 가능합니다.</div>
    <div class="faq-content">뇌출혈, 뇌졸중 등 재활치료가 필요하신 분들과 기타 질환으로 치료와 더불어 간병 케어가 필요한 분들이라면 입원이 가능합니다.</div>

    <div class="faq-item">Q6. 입원 상담 시 구비서류가 어떻게 되나요?</div>
    <div class="faq-content">타 병원에서 오시는 경우 : 전원소견서, 의사지시서 또는 투약기록지, X-ray 등의 검사결과지</div>

    <div class="faq-item">Q7. 입원절차는 어떻게 되나요?</div>
    <div class="faq-content">방문 또는 전화상담 > 환자 서류 확인 > 주치의 상담 > 입원 결정 > 입원 수속</div>

    <div class="faq-item">Q8. 입원비용은 어떻게 책정되나요?</div>
    <div class="faq-content">요양병원은 기본적으로 입원 일당 정액수가를 적용하도록 되어 있습니다. 다만, 환자의 보험가입 유형 및 산정특례 적용 여부 등에 따라 진료비는 일부 차이가 나게 됩니다. </div>

    <div class="faq-item">Q9. 요양병원에서 혜택을 받을 수 있는게 있나요?</div>
    <div class="faq-content">의료급여 1종,2종일 경우 "의료급여 의뢰서"를 지참하여 혜택을 받아보실 수 있습니다.</div>
    
    <div class="faq-item">Q10. 치매환자인데 어떻게 관리가 되고 있나요?</div>
    <div class="faq-content">치매전담실 또는 치매전담형 장기요양기관에서는 치매교육을 이수 받은 전문인력이 치매어르신에 맞는 종합적인 관리를 하고 있습니다.</div>

  </div>

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