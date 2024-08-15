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
	    	background-image: url("/img/info_back.jpg");
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
				<h2>요양원과 요양병원</h2>
				<p>별다른 지병은 없지만 스스로 식사나 거동이 불편하다면, 요양원이 적합하다. 요양원은 독립적인 생활이 어려운 노인을 요양보호사가 24시간 보조하지만 주사를 놓거나 수술을 하지는 않는다. 대부분 의사는 상주하지 않고, 주기적으로 방문해 건강 상태를 점검하는 정도로 관리가 이루어진다.</p>
				<p>요양원은 입소를 원하는 사람의 거주지 관할 국민건강보험공단에 신청해 노인장기요양등급을 받아야만 입소가 가능하다. 등급은 총 5개로 분류된다. 입소비와 요양보호사의 간병비는 노인장기요양보험이 적용되므로 대상자가 20%를 부담하면 된다. 그 외 약물 처방이나 기타 진료가 필요할 경우는 외부 의료기관을 방문해야 하고, 이 비용은 모두 본인 부담이다.</p>
				<p>노인장기요양등급을 받지 못했지만 노인성 질환으로 건강이 좋지 않은 사람은 요양원 대신 요양병원에 입원할 수 있다. 빠른 치료와 퇴원이 목적인 대학병원·종합병원 등 급성기 병원과 달리, 요양병원은 만성기 환자를 위한 병원이다. 의사와 간호사가 상주하며 집중 치료를 한다. 대신 요양병원은 요양보호사가 상주하지 않아 필요 시 개인이 고용해야 하므로 요양원에 비해 비용이 많이 든다. 간병비는 개인 간병이냐 공동 간병이냐에 따라 차이가 있다. 공동 간병은 한 명의 간병인이 몇 명의 환자를 돌보는지 알아봐야 한다.</p>
			</div>
			<div class="last-line">
				
			</div>
		</div>
		<div class="content-box">
			<div class="content">
				<h2>양로원과 실버타운</h2>
				<p>양로원은 의료나 요양이 아닌 주거를 목적으로 하는 시설이다. 몸이 불편할 경우 도움을 구할 의사나 요양보호사 등이 상주하지 않는다. 종류로는 무료, 실비, 유료 세 가지가 있다. 무료와 실비 양로원은 정부의 지원을 받아 운영하며, 경제적으로 어려운 65세 이상 노인들을 대상으로 한다. 노인장기요양등급과 상관없이 입소 가능하고, 한 숙소를 여러 명이 사용한다. 무료 양로원은 무연고자 혹은 기초생활수급권자 노인을 대상으로 정부에서 100% 비용을 지원한다. 실비 양로원은 노인복지법시행규칙 제14조 1항의 2에 따른 실비보호 대상자가 정부에서 지원하는 비용을 뺀 일정 생활비를 부담하고 입소할 수 있다. 비용은 월 48만 원 정도다.</p>
				<p>유료 양로원은 실버타운을 말한다. 건강하고 생활에 큰 어려움이 없는 만 60세 이상이 입주한다. 건강진단서와 의사 소견서를 요구하는 곳도 있다. 가사 서비스와 식사가 제공되고, 수영장·헬스장·도서관·당구장 등 편의 시설에서 여가 생활을 즐길 수 있다.</p>
				<p>실버타운은 위치에 따라 크게 도심형, 근교형, 전원형(휴양형)으로 나뉜다. 흔히 ‘산 좋고 물 좋은 곳이 제일’이라는 생각으로 무조건 전원형 실버타운을 고르는 것은 금물이다. 가족이나 친구가 자주 찾아온다면 도심·근교에 있는 시설이 적합하다. 반대로 평생을 전원에서 살아왔거나 전원생활에서 위안과 안정을 찾는다면 전원형 실버타운에 입주하는 것이 맞다. 현재 전국에 운영 중인 실버타운은 시설 수준과 서비스 내용이 천차만별이다. 보증금을 포함해 적지 않은 비용을 부담해야 하므로 계약 전 충분히 둘러보기를 권한다.</p>
				<p>이외에도 정부에서 저소득층 노인을 지원하는 ‘고령자복지주택’(공공실버주택)이 있다. 주택과 사회복지 시설이 복합 설치된 주거 시설이다. 입주 조건은 ‘공공주택이 만들어진 지역에 거주하는 만 65세 이상 무주택 세대 구성원’이다. 해당자 중 우선순위를 정해 입주자를 선발한다. △1순위는 국가유공자 또는 그 유족, 광주 5·18민주유공자 또는 그 유족, 특수임무유공자 또는 그 유족, 참전유공자 △2순위는 생계급여 수급자 또는 의료급여 수급자 △3순위는 해당 세대의 월평균 소득이 전년도 도시 근로자 가구 월평균 소득의 50% 이하인 사람이다. 다만 지자체별로 선정 기준이 상이할 수 있으니 주민센터에 문의해 시설 입주자 모집 공고문을 확인하는 것이 좋다.</p>
				<div style="text-align: center;">
					<img src="/img/info_table.png" style=" width : 60%;">
				</div>
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
