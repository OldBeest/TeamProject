<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery 라이브러리 로드 -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(function() {
            // 지역 및 구 목록 정의
            var htmlData = "";
            var seoul_gu = ['강남구', '강동구', '강서구', '강북구', '관악구', '광진구', '구로구', '금천구'];
            var gyeongi_si = ['부천시', '김포시', '파주시', '수원시', '남양주시', '고양시', '일산시', '광명시'];
            var incheon_gu = ['강화군', '계양구', '남동구', '미추홀구', '부평구', '서구', '동구', '연수구'];

            // 첫 번째 선택 상자가 변경되면 호출되는 이벤트 핸들러
            $("#category1").change(function() {
                htmlData = "";
                if ($("#category1").val() == '서울') {
                    // 서울을 선택한 경우 서울 구 목록 추가
                    htmlData = '<option value="0">시군구선택</option>';
                    for (var i = 0; i < seoul_gu.length; i++) {
                        htmlData += '<option value="' + seoul_gu[i] + '">' + seoul_gu[i] + '</option>';
                    }
                    $("#category2").html(htmlData);
                } else if ($("#category1").val() == '경기') {
                    // 경기 지역을 선택한 경우 경기 시 목록 추가
                    htmlData = '<option value="0">시군구선택</option>';
                    for (var i = 0; i < gyeongi_si.length; i++) {
                        htmlData += '<option value="' + gyeongi_si[i] + '">' + gyeongi_si[i] + '</option>';
                    }
                    $("#category2").html(htmlData);
                } else {
                    // 인천을 선택한 경우 인천 구 목록 추가
                    htmlData = '<option value="0">시군구선택</option>';
                    for (var i = 0; i < incheon_gu.length; i++) {
                        htmlData += '<option value="' + incheon_gu[i] + '">' + incheon_gu[i] + '</option>';
                    }
                    $("#category2").html(htmlData);
                }
            });

            // 버튼 클릭 시 호출되는 함수
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

                // 기존 마커 및 테이블 내용 제거
                removeMarkers();
                clearTable();

                // 카카오 지도 API로 장소 검색
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

                            // 테이블에 결과 추가
                            addToTable(data[i]);
                        }

                        // 지도의 중심을 검색된 결과의 중심으로 설정합니다
                        map.setBounds(bounds);
                    } else {
                        alert("검색 결과가 없습니다.");
                    }
                });
            });

            // 마커와 인포윈도우를 저장할 배열
            var markers = [];
            var infoWindows = [];

            // 마커와 인포윈도우 제거 함수
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

            // 테이블의 내용을 제거하는 함수
            function clearTable() {
                $("#hospital_info_table tbody").empty();
            }

            // 검색 결과를 테이블에 추가하는 함수
            function addToTable(data) {
                var rowHtml = '<tr>' +
                    '<td><img src="../images/hospital.jpg" width="30%" alt="이미지"></td>' + // 이미지 URL을 적절히 변경
                    '<td>' + data.place_name + '<br>' + data.address_name + '</td>' +
                    '<td><a href="' + data.place_url + '" target="_blank">상세보기</a></td>' +
                    '</tr>';
                $("#hospital_info_table tbody").append(rowHtml);
            }

            // 카카오 지도 API 로드
            var mapContainer = document.getElementById('map'),
                mapOption = {
                    center: new kakao.maps.LatLng(37.566826, 126.9786567),
                    level: 3
                };

            var map = new kakao.maps.Map(mapContainer, mapOption);
            var ps = new kakao.maps.services.Places();
        });
    </script>
    <meta charset="UTF-8">
    <title>search1</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            width: 100%;
            height: 100%;
        }
        #left-sidebar {
            text-align: center;
            
            height: 2500px;
            background-color: white;
            float: left;
        }
        #contents {
            width: 100%;
            height: 2500px;
            background-color: white;
            float: left;
            margin: 0 auto;
            
            
        }
        #page_name {
            text-align: left;
            font-size: 30px;
        }
        #right-sidebar {
            text-align: right;
            
            height: 2500px;
            background-color: white;
            float: right;
        }
        #images_1 {
            display: flex;
            object-fit: contain;
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
            text-align: center;
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
            line-height: 20px;
        }
        button {
            background-color: #03C75A;
            color : white;
            font-weight: 300;
        }
        #map {
            border-radius: 10px;
            width: 80%;
            height: 30%;
            margin: 20px auto;
        }
        #hospital_info_div {
            display: flex;
            width: 80%;
            height: 30%;
            background: #FAFAF5;
            border-radius: 10px;
            margin: 20px auto;
        }
        #hospital_info_table {
            width: 100%;
            height: 100%;
            border-style: none;
            
        }
        #hs_img {
            width: 80%;
        }
        .allPageMoving1 {
            margin: 30px 0 0 40%;
        }
        .allPageMoving1 * {
            vertical-align: top;
        }
        .allPageMoving1 a {
            display: inline-block;
            width: 25px;
            height: 25px;
            line-height: 23px;
            color: #888;
            text-decoration: none;
            border: 0px #c0c0c0 solid;
            background: #fff;
            font-size: 20px;
        }
        .allPageMoving1 a.n, .allPageMoving1 a.pre, .allPageMoving1 a.next {
            border: 0;
            padding: 0;
        }
        .allPageMoving1 a img {
            vertical-align: top;
        }
        .allPageMoving1 span.mobile {
            display: none;
        }
        .allPageMoving1 strong {
            display: inline-block;
            width: 25px;
            height: 25px;
            line-height: 23px;
            color: #f7703c;
            text-decoration: none;
            border: 0px #f7703c solid;
            background: #fff;
            font-size: 20px;
            font-weight: normal;
        }
        h2{text-align: center;
	        background-color: green;
	        height: 5%;
	        padding-top: 5%;
	        background-image: url('../images/searchback.jpg');
            background-size: cover;
            background-position: center;
            font-size: 200%;
            color: white;
            
            
            
            }
        
        
        
        h3{font-size: 30%;
        text-align: right;
        padding-right: 11%;
        
        
        }
    </style>
</head>
<body>
    <div id="container">
        <!-- 헤더 포함 -->
        <%@ include file="../head&foot/header.jsp" %>
        <aside id="left-sidebar">
            <br><br>
            
        </aside>
        <section id="contents">
            <p style="margin-top:40px">
                <em class="link">
                    <!-- 주소 결과가 잘못된 경우 제보 링크 -->
                    <h2>시설검색
                    <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
                       <br><br> <h3>혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.</h3>
                    </a>
                    </h2>
                </em>
            </p>
            <br>
            <form action="" name="search" method="post">
                <!-- 지역 선택 드롭다운 -->
                <select name="category1" id="category1">
                    <option value="0">지역선택</option>
                    <option value="서울">서울</option>
                    <option value="경기">경기</option>
                    <option value="인천">인천</option>
                </select>
                <!-- 시군구 선택 드롭다운 -->
                <select name="category2" id="category2">
                    <option value="0" selected>시군구선택</option>
                </select>
                <!-- 시설 선택 드롭다운 -->
                <select name="category3" id="category3">
                    <option value="0">시설선택</option>
                    <option value="요양원">요양원</option>
                    <option value="요양병원">요양병원</option>
                </select>
                <!-- 검색 버튼 -->
                <button type="button" id="sbtn">검색하기</button>
            </form>
            <br>
            <!-- 지도 표시 영역 -->
            <div id="map" style="width:80%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d892befda0f3748480b5e97a2dd60e23&libraries=services"></script>
            <!-- 검색 결과를 표시할 테이블 -->
            <div id="hospital_info_div">
                <table id="hospital_info_table">
              <colgroup>
              <col width="30%">
              <col width="50%">
              <col width="20%">
              </colgroup>
                    <thead>
                        <tr>
                            <th >이미지</th>
                            <th >주소</th>
                            <th >상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 검색 결과는 여기에 추가됩니다 -->
                    </tbody>
                </table>
            </div>
        </section>
        <aside id="right-sidebar">
            <!-- 사이드바 내용 -->
        </aside>
        <!-- footer -->
	<%@ include file="../head&foot/footer.jsp" %>
    </div>
</body>
</html>
