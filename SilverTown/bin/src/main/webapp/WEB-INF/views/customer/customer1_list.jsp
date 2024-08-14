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
    <script src="/js/sidebar_motion.js"></script>

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
	<%@ include file="../head&foot/header.jsp"%>
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
</html>