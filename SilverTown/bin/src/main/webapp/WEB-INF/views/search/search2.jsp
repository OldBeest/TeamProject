<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e422ab34489fb5e80e7def0fd930351&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<link href="../css/star.css" rel="stylesheet" />
<title>search2</title>
<style>
body {
	width: 100%;
	height: 100%;
}

#container {
	background-color: white;
}

h2 {
	text-align: center;
	background-color: green;
	height: 5%;
	background-image: url('../images/searchback.jpg');
	background-size: cover;
	background-position: center;
	font-size: 200%;
	color: white;
	padding-top: 3%;
	padding-bottom: 3%;
}

#left-sidebar {
	text-align: center;
	height: 100%;
	background-color: white;
}

#contents {
	width: 100%;
	background-color: white;
	float: left;
}

#page_name {
	text-align: left;
	font-size: 30px;
}

#right-sidebar {
	text-align: right;
	height: 100%;
	background-color: white;
}

table {
	margin: 0 auto;
	padding: 0;
	width: 80%;
	border-collapse: collapse;
	height: 30%;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	background-color: white;
}

th, td {
	border-bottom: 1px solid black;
	border-collapse: collapse;
	padding: 8px;
	border-left: 0;
	border-right: 0;
}

th {
	border-bottom: 1px solid black;
	background-color: #03C75A;
	color: white;
}

form {
	width: 80%;
	margin: 0 auto;
}

select, button {
	width: 200px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	line-height: 16px;
}

button {
	background-color: #03C75A;
}

#map {
	border-radius: 10px;
	width: 45%;
	height: 400px;
	margin: 10px auto;
}

#hospital_info_div {
	display: none;
	width: 80%;
	height: 30%;
	text-align: center;
	border-radius: 10px;
	margin: 0 auto;
}

#hospital_info_table {
	width: 100%;
	height: 100%;
	border-style: none;
	text-align: center;
	margin: 20px auto;
}

#hospital_info_table td {
	vertical-align: top;
	padding: 10px;
}

#btn_list {
	text-align: center;
}

p {
	text-align: left;
}

.text {
	text-align: center;
}

#review_section {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	text-align: center;
}

.review_box {
	width: 80%;
	margin: 10px auto;
	padding: 10px;
	border: 1px solid #C4C4C4;
	border-radius: 10px;
	font-size: 20px;
	box-sizing: border-box;
	resize: vertical;
	height: 150px;
}

.review_buttons {
	margin: 10px auto;
	text-align: right;
	padding-right: 10%;
}

.review_buttons button {
	width: 100px;
	margin: 5px;
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
	a
}

#reviews_list {
	width: 80%;
	margin: 20px auto;
	padding: 10px;
	border-top: 1px solid #C4C4C4;
	text-align: left;
}

.review_item {
	margin: 10px 0;
	padding: 10px;
	border: 1px solid #C4C4C4;
	border-radius: 10px;
	font-size: 18px;
}

h3 {
	color: black;
	font-size: 30px;
}

h4 {
	color: grey;
	font-size: 10px;
}

.top-content {
	display: flex;
	padding-right: 10px;
}

.facility-title {
	height: 20%;
}

.facility-content {
	height: 80%;
}

.facility-category {
	font-size: 30px;
	font-weight: 700;
}

/* 계산기 부분 */
.calc-container {
	display: none;
	text-align: center;
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.calc-header {
	background-color: #03C75A;
	color: #FFFFFF;
	padding: 15px;
	border-radius: 10px 10px 0 0;
}

.calc-header h1 {
	margin: 0;
	font-size: 1.5em;
}

.initial-value-group, .period-group {
	margin-bottom: 20px;
	text-align: center;
}

.initial-value-group label, .period-group label {
	display: block;
	font-size: 1.1em;
	color: #2C6B2F;
	margin-bottom: 5px;
}

.initial-value-group input, .period-group input {
	width: 100%;
	font-size: 1.5em;
	padding: 10px;
	border: 1px solid #C4C4C4;
	border-radius: 5px;
	box-sizing: border-box;
	text-align: right;
}

.input-group {
	display: flex;
	align-items: center;
}

.input-group .unit {
	margin-left: 5px;
	font-size: 1.1em;
	color: #2C6B2F;
}

.period-group label {
	display: inline-block;
	margin-right: 10px;
}

.period-group input[type="radio"] {
	margin-right: 5px;
	accent-color: #2C6B2F;
	vertical-align: middle
}

.result {
	font-weight: bold;
	font-size: 1.5em;
	color: #03C75A;
	padding: 10px;
	border: 2px solid #03C75A;
	border-radius: 5px;
	margin-bottom: 10px;
}

.note {
	font-size: 0.9em;
	color: #888888;
}
</style>
<!-- 주변시설 열닫 js-->
<script type="text/javascript">
	var code_flag = false;
	$(function() {
		$(".btn").on("click", function() {
			$("#hospital_info_div").css("display", 'flex');
		});
		$(".calc").on("click", function() {
			$(".calc-container").css("display", 'block');
		});
		$(".hidden").on("click", function() {
			$("#hospital_info_div").css("display", 'none');
			$(".calc-container").css("display", 'none');
		});
	});
</script>
</head>
<body>
	<div id="container">
		<!-- 헤더 -->
		<%@ include file="../head&foot/header.jsp"%>
		<aside id="left-sidebar">
			<br> <br>
			<h2>검색결과</h2>
		</aside>
		<section id="contents">
			<!-- 좌표 값 저장 -->
			<input type="hidden" id="y-cor" name="y-cor"
				value=""> <input type="hidden" id="x-cor"
				name="x-cor" value="">
			<div class="top-content">
				<div id="map" style="width: 45%; height: 400px;">카카오지도</div>
				<div style="padding-left: 50px;">
					<div class="facility"
						style="width: 100%; height: 300px; display: flex;">
						<div style="margin: 0; padding: 10px; padding-top: 30px;">
							<img src="/images/hospital.jpg" style="padding-top: 40px;">
						</div>
						<div style="margin: 0; padding: 10px;">
							<div style="text-align: center;">
								<span class="facility-title"
									style="font-size: 30px; color: white; background: green; border-radius: 10px;">시설명</span>
							</div>
							<hr>
							<div class="facility-category">&nbsp;주소</div>
							<div>
								<span class="facility-content"
									style="line-height: 25px; font-size: 20px; color: green;">시설명</span>
							</div>
							<div class="facility-category">&nbsp;대표 번호</div>
							<div>
								<span class="facility-phone"
									style="line-height: 40px; font-size: 20px; color: green;">&nbsp;&nbsp;032-666-7710</span>
							</div>
							<div class="facility-category">&nbsp;주요 특징</div>
							<div>
								&nbsp;<span class="facility-tags tag1"
									style="line-height: 40px; font-size: 20px; color: white; background: green; border-radius: 10px;"></span>
								&nbsp;<span class="facility-tags tag2"
									style="line-height: 40px; font-size: 20px; color: white; background: green; border-radius: 10px;"></span>
							</div>
						</div>
					</div>
					<div id="btn_list">
						<button type="button" class="btn">주변시설</button>
						<button type="button" class="calc">비용계산</button>
						<button type="button" class="hidden">닫기</button>
					</div>
				</div>

			</div>
			<!-- 주변시설 열닫 -->
			<div id="hospital_info_div">
				<table id="hospital_info_table">
					<colgroup>
						<col width="30%" />
						<col width="5%" />
						<col width="30%" />
						<col width="5%" />
						<col width="30%" />
					</colgroup>

					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>대학병원🏥</td>
						<td></td>
						<td>약국💊</td>
						<td></td>
						<td>편의점🏪</td>
					</tr>

					<tr class="text">
						<td id="hostpital">
							<p class="place-name"></p>
							<p class="place-address"></p>
							<p class="distance"></p>
							<p class="place-phone"></p>
							<p class="place-x"></p>
							<p class="place-y"></p>
						</td>
						<td></td>
						<td id="pharmacy">
							<p class="place-name"></p>
							<p class="place-address"></p>
							<p class="distance"></p>
							<p class="place-phone"></p>
							<p class="place-x"></p>
							<p class="place-y"></p>
						</td>
						<td></td>
						<td id="convenience-store">
							<p class="place-name"></p>
							<p class="place-address"></p>
							<p class="distance"></p>
							<p class="place-phone"></p>
							<p class="place-x"></p>
							<p class="place-y"></p>
						</td>
					</tr>
				</table>
			</div>
			<!-- 계산기 -->
			<div class="calc-container">
				<div class="calc-header">
					<h1>시설 이용비용 간편계산기</h1>
				</div>
				<form>
					<div class="initial-value-group">
						<br> <br> <label for="initial-value">일일 이용료 :</label>
						<div class="input-group">
							<input type="number" id="initial-value" value="" readonly>
							<span class="unit">원</span>
						</div>
					</div>
					<div class="initial-value-group">
						<br> <br> <label for="initial-value1">프로모션 코드 :</label>
						<div class="input-group">
							<input type="text" id="initial-value1"
								style="font-size: 15px; font-style: italic;"
								placeholder="여기에 코드를 입력하세요.">
							<div id="check-code" onclick="check_code()">입력</div>
						</div>

					</div>
					<div>
						<div class="period-group">
							<label><input type="radio" name="period" value="30"
								checked> 1개월 </label> <label><input type="radio"
								name="period" value="180"> 6개월</label> <label><input
								type="radio" name="period" value="365"> 1년</label>
						</div>
					</div>
					<div class="result">
						예상비용 : <span id="result">0</span> 원
					</div>
					<p class="note" style="color: red;">※경고※ 정확한 금액은 시설에 확인해야 합니다.</p>
				</form>
			</div>
			<script>
				const url = window.location.search;
				const urlParams = new URLSearchParams(url);
				var diseases = urlParams.get("disease");
				var features = urlParams.get("feature");
				var price = urlParams.get("price");
				console.log(price);
				document.querySelector(".tag1").innerText = diseases;
				document.querySelector(".tag2").innerText = features;								
				document.querySelector("#initial-value").value = parseInt(price);								
				document.querySelector("#initial-value").value = parseInt(price);								
				
			</script>
			<script>
		        const periodRadios = document.querySelectorAll('input[name="period"]');
		        const resultSpan = document.getElementById('result');
		        const initialValueInput = document.getElementById('initial-value');
		        function updateCalculations() {
		            let periodValue = 0;
		            let result = parseFloat(initialValueInput.value) || 0;
		            periodRadios.forEach(radio => {
		                if (radio.checked) {
		                    periodValue = parseFloat(radio.value);
		                }
		            });
		            result *= periodValue;
		            resultSpan.textContent = result.toLocaleString();
		        }
		        periodRadios.forEach(radio => {
		            radio.addEventListener('change', updateCalculations);
		        });
		        // Initial calculation
		        updateCalculations();
		    </script>
			<script>
				function check_code(){
					var code = document.getElementById("initial-value1").value;
					if ((code == "silvertown") && (code_flag == false)){
						result = document.querySelector("#result").innerText.replace(/,/g,"");
						result *= 0.85;
						document.querySelector("#result").innerText = result.toLocaleString();
						code_flag = true;
					}
				}
			</script>
			<!-- 계산기 끝 -->
			<!-- 리뷰작성 공간 -->
			<div id="review_section">
				<h3>♡칭찬사연♡</h3>
				<h4>병원 내 환자 및 방문 고객분들께서 의료진, 간호사 등의 교직원을 온라인으로 직접 칭찬해주신 사연입니다.</h4>
				<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset>
						<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
							name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
						<input type="radio" name="reviewStar" value="4" id="rate2"><label
							for="rate2">★</label> <input type="radio" name="reviewStar"
							value="3" id="rate3"><label for="rate3">★</label> <input
							type="radio" name="reviewStar" value="2" id="rate4"><label
							for="rate4">★</label> <input type="radio" name="reviewStar"
							value="1" id="rate5"><label for="rate5">★</label>
					</fieldset>
				</form>



				<textarea class="review_box"
					placeholder="좋은 리뷰을 남겨주시면 실버타운에 큰 힘이 됩니다!"></textarea>
				<div class="review_buttons">
					<button id="submit_review">작성</button>
					<button id="cancel_review">취소</button>
				</div>
			</div>
			<div id="reviews_list">
				<h3>칭찬 목록</h3>
				<!-- 작성된 리뷰들이 여기에 추가될 것입니다. -->
			</div>

			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					//상세정보를 누르면 위도경도가 여기로 넘어와서 지도에 표시되도록; 아래 대학병원, 약국, 편의점 포함
					center : new kakao.maps.LatLng(37.5663937, 126.9387066), // 지도의 중심좌표
					level : 4
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
			</script>

		</section>
		<aside id="right-sidebar"></aside>
		<!-- footer -->
		<%@ include file="../head&foot/footer.jsp"%>
	</div>
	<script>
		$(function() {
			const url = new URL(window.location.href);
			const urlParams = url.searchParams;

			let address1 = urlParams.get("address");
			let place1 = urlParams.get("place_name");

			//시설명 및 시설명 표시
			$(".facility-title").html(
					"&nbsp;&nbsp;&nbsp;" + place1 + "&nbsp;&nbsp;&nbsp;");
			$(".facility-content").html(
					"&nbsp;&nbsp;&nbsp;" + address1 + "&nbsp;&nbsp;&nbsp;");

			geocoder.addressSearch(address1,function(result, status) {
			$("#y-cor").val(result[0].y);
			$("#x-cor").val(result[0].x);
			var y_cor = $("#y-cor").val();
			var x_cor = $("#x-cor").val();
			
			points = []
			points.push(new kakao.maps.LatLng(y_cor, x_cor));
			
			let REST_API_KEY = '44102386908e102073a79562f84fbcf6';

			var markerPosition = new kakao.maps.LatLng(y_cor, x_cor);

			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			function annotate_place(documents) {
				console.log(documents);
				for (var i = 0; i < 1; i++) {
					var coords = new kakao.maps.LatLng(documents[i].y, documents[i].x);
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});
					var infowindow = new kakao.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">'+ documents[i].place_name + '</div>'
							});
					infowindow.open(map, marker);
				}
				points.push(coords);
			}
			function annotate_place1(documents) {
				console.log(documents);
				var coords = new kakao.maps.LatLng(documents.y, documents.x);
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords

				});
				var infowindow = new kakao.maps.InfoWindow(
						{
							content : '<div style="width:150px;text-align:center;padding:6px 0;">'+ documents.place_name + '</div>'
						});
				infowindow.open(map, marker);
				console.log(coords);
				points.push(coords);
			}
			$.ajax({
						headers : {'Authorization' : "KakaoAK 44102386908e102073a79562f84fbcf6"},
						url : 'https://dapi.kakao.com/v2/local/search/keyword.json',
						type : "get",
						data : {
							query : "대학병원",
							category_group_code : "HP8",
							x : x_cor,
							y : y_cor,
							radius : 20000,
							sort : "distance"
						},
						dataType : "json",
						success : function(data) {
							console.log("병원데이터 ", data);

							for (var i = 0; i < 10; i++) {
								if (data.documents[i].category_name.slice(-4) == "대학병원") {
									annotate_place1(data.documents[i]);
									$("#hostpital .place-name").text("이름 : " + data.documents[i].place_name)
									$("#hostpital .place-address").text("주소 : " + data.documents[i].road_address_name)
									$("#hostpital .distance").text("거리 : " + data.documents[i].distance + "m")
									$("#hostpital .place-phone").text("전화번호 : " + data.documents[i].phone)
									break;
									//$("#hostpital .place-x").text("x좌표(경도) : " + data.documents[i].x)
									//$("#hostpital .place-y").text("y좌표(위도) : " + data.documents[i].y)
								}
							}

						},
						error : function() {
							console.log("실패");
						}
					}

					);

			$.ajax({
						headers : {'Authorization' : "KakaoAK 44102386908e102073a79562f84fbcf6"},
						url : 'https://dapi.kakao.com/v2/local/search/category.json?category_group_code=PM9&y='
								+ y_cor
								+ '&x='
								+ x_cor
								+ '&radius=10000&sort=distance&size=1',
						type : "get",
						data : {},
						dataType : "json",
						success : function(data) {

							annotate_place1(data.documents[0]);

							$("#pharmacy .place-name").text("이름 : " + data.documents[0].place_name)
							$("#pharmacy .place-address").text("주소 : " + data.documents[0].road_address_name)
							$("#pharmacy .distance").text("거리 : " + data.documents[0].distance + "m")
							$("#pharmacy .place-phone") .text( "전화번호 : " + data.documents[0].phone)
							//$("#pharmacy .place-x").text("x좌표(경도) : " + data.documents[0].x)
							//$("#pharmacy .place-y").text("y좌표(위도) : " + data.documents[0].y)

						},
						error : function() {
							console.log("실패");
						}
					}

					);

			$.ajax({
						headers : {'Authorization' : "KakaoAK 44102386908e102073a79562f84fbcf6"},
						url : 'https://dapi.kakao.com/v2/local/search/category.json?category_group_code=CS2&y=' + y_cor+ '&x=' + x_cor + '&radius=10000&sort=distance&size=1',
						type : "get",
						data : {},
						dataType : "json",
						success : function(data) {

							annotate_place1(data.documents[0]);

							$("#convenience-store .place-name").text("이름 : " + data.documents[0].place_name)
							$("#convenience-store .place-address").text("주소 : " + data.documents[0].road_address_name)
							$("#convenience-store .distance").text("거리 : " + data.documents[0].distance + "m")
							$("#convenience-store .place-phone").text("전화번호 : " + data.documents[0].phone)
							//$("#convenience-store .place-x").text("x좌표(경도) : " + data.documents[0].x)
							//$("#convenience-store .place-y").text("y좌표(위도) : " + data.documents[0].y)

						},
						error : function() {
							console.log("실패");
						}
					});
			console.log(points);
			
			var bounds = new kakao.maps.LatLngBounds();    
    		console.log("b : ", bounds);
			
    		var i, marker;
    		
    		for (i = 0; i < points.length; i++) {
    		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    		    marker = new kakao.maps.Marker({ position : points[i] });
    		    marker.setMap(map);
    		    
    		    // LatLngBounds 객체에 좌표를 추가합니다
    		    bounds.extend(points[i]);
    		}

    		function setBounds() {
    		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    		    map.setBounds(bounds);
    		}
    		setBounds();


		});
			// 리뷰 작성 및 취소 버튼 이벤트 핸들러
			$("#submit_review").on("click",function() {
								var reviewText = $(".review_box").val();
								if (reviewText.trim() !== "") {
									var reviewItem = '<div class="review_item">' + reviewText + '</div>';
									$("#reviews_list").append(reviewItem);
									$(".review_box").val(""); // 리뷰 작성 후 입력창 초기화
								} else {
									alert("사연을 작성하세요.");
								}
							});

			$("#cancel_review").on("click", function() {
				$(".review_box").val(""); // 취소 버튼 클릭 시 입력창 초기화
			});
		});
	</script>
</body>
</html>