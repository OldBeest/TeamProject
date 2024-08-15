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
    
    <!-- chart.js 불러오기 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>introduce1</title>
<style>    
    body {
    		height : 100%;
	    	background-image: url("/img/intro_back.png");
	    	background-repeat: no-repeat;
	    	background-size: cover;
	    	
        }
    .content-wrap{
    	width : 100%;
    	color : white;
    	
    }
    .content-box{
    	width : 60%;
		margin : 0 auto;
    	background: none;
    }
    .content > h2{
    	font-size: 50px;
    	font-weight: 700;
    	text-align: center;
    }
    h4{
    	text-align: center;
    	margin : 0;
    	padding-bottom : 2px;
    }
    .content > p{
    	padding-bottom: 30px;
	    font-size: 20px;
	    font-weight: 300;
	    line-height: 1.65;
	    letter-spacing: 0;
    }
    .last-line{
    	border-bottom: 2px solid #dfdfdf;
    	padding-bottom: 2px;
    }
    
    .chart-row{
    	display: flex;
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
        

</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="../head&foot/header.jsp"%>
	<!-- 헤더 끝 -->
	<div class="content-wrap">
		<div class="content-box">
			<div class="content">
				<h2>Silver Town과 함께하는</h2>
				<h2>새로운 여정, 시작</h2>
				<p>2050년까지 65세 이상 인구는 <strong>현재보다 두 배 이상 많은 16억 명을 돌파</strong>할 것으로 전망된다. 유엔 인구국 데이터 포털에 따르면 전체 인구 대비 65세 인구 비중은 현재 9.4%에서 2050년에는 16.5%로 증가하게 된다. 세계 경제가 떠안아야 하는 노인 부양 부담도 전례가 없는 수준으로 커졌다. 1950년 65세 이상 인구 1인당 생산가능인구는 11.7명이었지만, 현재는 7명, 2040년에는 4.4명으로 줄어들게 된다. 65세 이상 인구 비중이 20%가 넘는 ‘초고령사회’에 진입한 일본은 상황이 더욱 심각하다. 1950년에 노인 1명당 생산 가능 인구가 12명이었지만, 현재는 2명, 2040년에는 1.5명으로 줄어들 수 있다. 한마디로 세계의 노년부양비(15~64세 생산가능인구 100명에 대한 65세 인구의 비율)는 1950년 8.5에서 2050년 26.3으로 세 배 이상 증가할 것으로 전망된다.</p>
				<div class="people-chart">
					<div class="chart-row" style="height : 300px;">
						<canvas id="myChart"></canvas>
					</div>
					<h4>자료 출처 : 통계청 (2023 고령자 통계)</h4>
				</div>
			</div>
			<div class="last-line">
				
			</div>
		</div>
		<div class="content-box">
			<div class="content">
				<h2>커지는 홈케어 시장</h2>
				<h2>Silver Town은 선도합니다.</h2>
				<p>국가별로 최대 실버 이코노미는 미국이다. 월드데이터랩에 따르면 미국 실버 시장은 2025년 약 3조 5,000억 달러가 될 것으로 추정된다. 김문선 한국무역협회 국제무역통상연구원 수석연구원은 최근 보고서를 통해 “2030년이면 8,000만 명의 베이비붐 세대(1946~1965년생)가 모두 65세 이상 고령층에 진입한다”라며 “이들은 MZ세대보다 자산과 연금소득이 많아 은퇴 이후에도 높은 소비력을 보인다”라고 설명했다. 2020년 기준 55세 이상 인구가 미국 소비시장의 42%를 차지한다.</p>
				<p>노인 대상 간병 시장은 바이든 행정부가 나서서 키우는 분야다. 미국에서만 노인을 위한 비공식 간병 비용이 연간 5,000억 달러를 초과하는 것으로 알려졌다. ‘돌봄 경제(caring economy)’를 내건 바이든 행정부는 노인·장애인을 대상으로 가정과 지역사회 기반의 메디케이드(공공건강보험) 서비스(HCBS)에 4,000억 달러 규모의 간병 인프라 확충을 발표했다.</p>
				<p>다른 국가들도 노인 간병 인력 수요와 공급 간의 격차를 줄이는 것을 목표로 하고 있다. 호주는 노인간호 인력 3만 5,000명 이상이 부족한 상황이다. 스위스 보건부는 노인을 돌보는 자원봉사 시간을 개인 사회보장 계좌에 적립하는 ‘타임뱅크’라는 개념을 테스트하고 있다. 일정 연령에 도달하면 시간 예치금에 따라 자원봉사 돌봄을 받을 수 있다.</p>
				<p>HCBS 프로그램 관련 실버케어 스타트업도 잇따라 투자금을 유치했다. 노인과 사람들을 연결해 동반자 관계를 지원하는 매칭 플랫폼 ‘파파’는 메디케이드 및 고용보험을 통해 지원된다. 이 기업은 타이거글로벌 등 주요 벤처캐피탈(VC)로부터 2억 4,120만 달러 규모 투자금을 유치하며 유니콘(기업가치 1조 원 이상 비상장기업) 반열에 올랐다.</p> 
				<p>중대 질환자 대상 원격 치료플랫폼 하모나이즈와 노인 주택을 안전하게 개조해주는 스타트업 루비도 각각 1,380만 달러, 290만 달러 투자금을 유치했다. 원격진료 플랫폼 가운데 가장 많은 투자금을 유치한 기업은 디스패치헬스(7억 3,320만 달러 투자유치)다. 홈케어 매칭 플랫폼 아너(6억 2,500만 달러), 가정간호 환자 데이터 관리 및 모니터링 플랫폼 알라야케어(2억 9,340만 달러)에도 뭉칫돈이 몰렸다. 초기 실버케어 스타트업으로는 노인과 간병인을 위한 음성인식 의료경보 시스템업체 알로에케어헬스(500만 달러), 간병 메시징 앱 세레니티인게이즈(240만 달러), 노인돌봄 관련 모든 정보를 한데 모은 그레이스(340만 달러)가 있다.</p>
			</div>
			<div class="last-line">
				
			</div>
			
		</div>
		<div class="content-box">
			<div class="content">
				<h2>젊은 세대 아이디어로 차별화된 서비스로 경쟁력↑</h2>
				<h2>Silver Town은 항상 고민합니다.</h2>
				<p>한국 사회의 초고령화가 점차 빨라짐에 따라 실버산업에 대한 관심도 함께 늘고 있다. 이에 최근 스타트업 기업들이 시니어 친화 서비스에 앞장서고 있어 눈길을 끈다. 돌봄 서비스부터 헬스케어, 이커머스, 여가 등 노년층의 삶의 질을 향상시키기 위한 서비스 영역도 다양할뿐더러, MZ세대로 구성된 청년들의 아이디어에서 출발했다는 점도 주목할 요소로 꼽힌다.</p>
				<p>30일 통계청에 따르면 오는 2025년 국내 만 65세 이상 고령인구는 1000만명을 돌파할 것으로 전망되고 있다. 이는 2020년 807만명에서 3년 만에 약 30%가 증가한 수치다. 고령화 정도는 총 인구대비 65세 이상 인구 비중인 고령화 인구비중을 기준으로 판단한다. △7~14% 고령화 사회 △14~20% 고령사회 △20% 이상을 초고령화 사회로 분류하는데 우리나라의 고령화율은 2019년 기준 14.9%로 이미 고령사회에 해당한다.</p>
				<p>오는 2025년에 국내 노인인구 1000만명(고령화율 20.3%)을 돌파하며 우리나라가 초고령화 사회로 접어들 것으로 예상됨에 따라 관련 산업에 뛰어드는 스타트업 기업도 늘고 있다. 이들은 시니어 라이프에 초점을 맞춰 경쟁력 있는 솔루션으로 서비스를 진화시킴으로써 초고령화 사회에 대비한 청사진을 그려내고 있다.</p>
			</div>
			<div class="last-line">
				
			</div>
			
		</div>
		
	</div>
	
<script>
						var ctx = document.getElementById("myChart");
						var myBarChart = new Chart(ctx, {
						  type: 'line',
						  data: {
						    labels: ["2023", "2030", "2040", "2050", "2060", "2070"],
						    datasets: [{
						      label: "고령화 인구(65세 이상) 통계 추이(만명)",
						      backgroundColor: "#white",
						      hoverBackgroundColor: "#2e59d9",
						      borderColor: "white",
						      data: [950, 1306, 1724, 1900, 1868, 1747],
						    }],
						  },
						  options: {
						    maintainAspectRatio: false,
						    layout: {
						      padding: {
						        left: 10,
						        right: 25,
						        top: 25,
						        bottom: 0
						      }
						    },
						    scales: {
						      xAxes: [{
						        time: {
						          unit: 'month'
						        },
						        gridLines: {
						        	color: "rgb(255, 255, 255)",
							          zeroLineColor: "rgb(255, 255, 255)",
							          drawBorder: false,
							          borderDash: [2],
							          zeroLineBorderDash: [2]
						        },
						        ticks: {
						          maxTicksLimit: 6
						        },
						        maxBarThickness: 25,
						      }],
						      yAxes: [{
						        ticks: {
						          min: 0,
						          max: 2500,
						          maxTicksLimit: 5,
						          padding: 10,
						          // Include a dollar sign in the ticks
						          callback: function(value, index, values) {
						            return '$' + number_format(value);
						          }
						        },
						        gridLines: {
						          color: "rgb(255, 255, 255)",
						          zeroLineColor: "rgb(255, 255, 255)",
						          drawBorder: false,
						          borderDash: [2],
						          zeroLineBorderDash: [2]
						        }
						      }],
						    },
						    legend: {
						      display: false
						    },
						    tooltips: {
						      titleMarginBottom: 10,
						      titleFontColor: '#6e707e',
						      titleFontSize: 14,
						      backgroundColor: "rgb(255,255,255)",
						      bodyFontColor: "#ffffff",
						      borderColor: '#ffffff',
						      borderWidth: 1,
						      xPadding: 15,
						      yPadding: 15,
						      displayColors: false,
						      caretPadding: 10,
						      callbacks: {
						        label: function(tooltipItem, chart) {
						          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
						          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
						        }
						      }
						    },
						  }
						});

						</script>	
</body>
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
</html>
