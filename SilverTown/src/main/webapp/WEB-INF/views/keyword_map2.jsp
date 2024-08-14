<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>키워드 검색 api 2(옵션 선택 딸깍)</title>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>	
		<script>
		   $(function(){
			   //alert("test");
			   var htmlData = "";
			   var seoul_gu = ['강남구', '강동구', '강서구', '강북구', '관악구', '광진구', '구로구', '금천구'];
			   var gyeongi_si = ['부천시', '김포시', '파주시', '수원시', '남양주시', '고양시', '일산시', '광명시'];
			   var incheon_gu = ['강화군', '계양구', '남동구', '미추홀구', '부평구', '서구', '동구', '연수구'];
			   
			   $("#category1").change(function(){
				    //alert($("#category1").val());
				    htmlData = "";
				    if($("#category1").val()=='서울'){
				    	  
				    		htmlData = '<option value="0">시군구선택</option>';
				    	  for(var i=0;i<seoul_gu.length;i++){
				    		  htmlData += '<option value="'+seoul_gu[i]+'">'+seoul_gu[i]+'</option>';
				    	  }
				    	  $("#category2").html(htmlData);
				    }else if($("#category1").val()=='경기'){
			    		  htmlData = '<option value="0">시군구선택</option>';
				    	  for(var i=0;i<gyeongi_si.length;i++){
				    		  htmlData += '<option value="'+gyeongi_si[i]+'">'+gyeongi_si[i]+'</option>';
				    	  }
				    	  $("#category2").html(htmlData);
				    }else{
				    		htmlData = '<option value="0">시군구선택</option>';
				    	  for(var i=0;i<incheon_gu.length;i++){
				    		  htmlData += '<option value="'+incheon_gu[i]+'">'+incheon_gu[i]+'</option>';
				    	  }
				    	  $("#category2").html(htmlData);
				    }
				    
			   })
			   
		   });
		</script>
	</head>
	<body>
		<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<br>
	<form action="" name="search" method="post">
		<select name="category1" id="category1">
			<option value="0">지역선택</option>
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
		</select>
		<select name="category2" id="category2">
			<option value="0" selected>시군구선택</option>
		</select>
		<select name="category3" id="category3">
			<option value="0">시설선택</option>
			<option value="요양원">요양원</option>
			<option value="요양병원">요양병원</option>
		</select>
		<button type="button" id="sbtn">검색하기</button>
<!--<button type="button" onclick="jsonBtn()">-->
	</form>
	<br>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d892befda0f3748480b5e97a2dd60e23&libraries=services"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=본인의 APPKEY를 이용하세요잉~&libraries=services"></script>-->

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

//마커와 인포윈도우를 저장할 배열
var markers = [];
var infoWindows = [];

// 기존 마커 제거 함수
function removeMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null); // 지도에서 마커를 제거
    }
    for (var j = 0; j < infoWindows.length; j++) {
    		infoWindows[j].setMap(null); // 인포윈도우 제거
    }
    markers = [];
    infoWindows = [];
}

//버튼 클릭 이벤트
$('#sbtn').on('click', function() {
		var region = $("#category1").val();
		var gu = $("#category2").val();
		var facility = $("#category3").val();
		
    if (region === '0' || gu === '0' || facility === '0') {
        alert("옵션을 선택하세요.");
        return;
    }
	
    var keyword = region + " " + gu + " " + facility; 
    
    console.log(keyword);
    
 		// 기존 마커 제거
    removeMarkers();

 		// 키워드로 장소를 검색합니다
    ps.keywordSearch(keyword, function(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            var bounds = new kakao.maps.LatLngBounds();

            // 최대 10개 장소에 대해 마커를 표시합니다
            for (var i = 0; i < Math.min(data.length, 10); i++) {
                var coords = new kakao.maps.LatLng(data[i].y, data[i].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data[i].place_name + '</div>'
                });
                infowindow.open(map, marker);
                
             		// 마커와 인포윈도우 배열에 추가
                markers.push(marker);
                infoWindows.push(infowindow);

                // 지도의 영역을 결과값으로 확장합니다
                bounds.extend(coords);
            }

            // 지도의 중심을 검색된 결과의 중심으로 설정합니다
            map.setBounds(bounds);
        } else {
            alert("검색 결과가 없습니다.");
        }
    });
}); // jquery
</script>

	</body>
</html>